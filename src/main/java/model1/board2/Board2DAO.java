

package model1.board2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

//JDBC를 이용한 DB연결을 위해 클래스 상속
public class Board2DAO extends JDBConnect {
	
	//인수생성자에서는 application 내장객체를 매개변수로 전달한다.
	public Board2DAO(ServletContext application) {
		//부모 생성자에서는 application을 통해 web.xml에 직접
		//접근하여 컨텍스트 초기화 파라미터를 얻어온다.
		super(application);
	}
	
	//멤버메서드
	//게시물의 갯수를 카운트하여 int형으로 반환한다.
	public int selectCount(Map<String, Object> map) {
		// 결과(게시물 수)를 담을 변수
		int totalCount = 0;
		
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM board2 ";
		//검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만
		//인출한다.
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord")+"%'";
		}
		
		try {
			//정적쿼리문 실행을 위한 Statement객체 생성
			stmt = con.createStatement();
			//쿼리문 실행후 결과는 ResultSet으로 반환한다.
			rs = stmt.executeQuery(query);
			//커서를 첫번째 행으로 이동하여 레코드를 읽는다.
			rs.next();
			//첫번째 컬럼의 값을 가져와서 변수에 저장한다.
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	//작성된 게시물을 반환한다. 특히 반환값은 여러개의 레코드를
	//반환할 수 있으므로 List컬렉션을 반환타입으로 정의한다.
	public List<Board2DTO> selectList(Map<String, Object> map){ 
		
		//List계열의 컬렉션을 생성한다. 이때 타입 매개변수는
		//BoardDTO객체로 설정한다.
		//게시판 목록은 출력 순서가 보장되야 하므로 Set컬렉션은
		//사용할 수 없고 List 컬렉션을 사용해야 한다.
		List<Board2DTO> bbs = new Vector<Board2DTO>();
		
		//레코드 추출을 위한 select쿼리문 작성
		String query = " SELECT * FROM Board2 "; 
		if(map.get("searchWord") != null) {
			query += " WHERE " +" "+ map.get("searchField")+ " " 
					+ "LIKE '%" + map.get("searchWord")+ "%'"; 
		} 
		//최근 게시물을 상단에 노출하기 위해 내림차순으로 정렬한다.
		query += " ORDER BY num DESC "; 
	
		try {
			//쿼리실행 및 결과값 반환
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			//2개 이상의 레코드가 반환될수 있으므로 while문을 
			//사용한다. 갯수만큼 반복하게 된다.
			while(rs.next()) {
				//하나의 레코드를 저장할 수 있는 DTO객체를 생성
				Board2DTO dto = new Board2DTO();
				
				//setter()를 이용해서 각 컬럼의 값을 저장
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_id(rs.getString("b_id"));
				
				//List컬렉션에 DTO객체를 추가한다.
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//새로운 게시물 입력을 위한 메서드 
	public int insertWrite(Board2DTO dto) {
		int result = 0;
		
		try {
			//인파라미터가 있는 동적쿼리문으로 insert문 작성
			//게시물의 일련번호는 시퀀스를 통해 자동부여받고,
			//조회수의 경우에는 0을 입력한다.
			String query = "INSERT INTO board2("
					+ " title,id,content,visitcount)"
					+ " VALUES ( "
					+ " ?, ?, ?, 0)";
			//동적쿼리문 이므로 prepared객체를 통해 인파라미터를
			//채워준다.
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getContent());
			//insert를 실행하여 입력된 행의 갯수를 반환받는다.
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//인수로 전달된 게시물의 일련번호로 하나의 게시물을 인출한다.
	public Board2DTO selectView(String num) {
		//하나의 레코드 저장을 위한 DTO객체 생성
		Board2DTO dto = new Board2DTO();
		
		//inner join(내부조인)을 통해 member테이블의 name컬럼까지
		//가져온다.
		String query = " SELECT B.*, M.name  FROM member M INNER JOIN board2 B  ON M.id=B.id WHERE idx=? ";
		
		try {
			//인파라미터 설정 및 쿼리문 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			/*
			일련번호는 중복되지 않으므로 단 한개의 게시물만 인출하게
			된다. 따라서 while문이 아닌 if문으로 처리한다.
			next() 메서드는 ResultSet으로 반환된 게시물을 확인해서
			존재하면 true를 반환해준다.
			*/
			if(rs.next()) {
				//DTO 객체에 레코드를 저장한다.
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				/*
				각 컬럼의 값을 추출할때 1부터 시작하는 인덱스와 
				컬럼명 둘다 사용할 수 있다. 날짜인 경우에는
				getDate() 메서드로 추출할 수 있다.
				*/
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_id(rs.getString("b_id"));
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//게시물의 조회수를 1 증가시킨다.
	public void updateVisitCount(String num) {
		
		/* 게시물의 일련번호를 통해 visitcount를 1증가 시킨다.
		 * 해당 커럼은 number 타입이므로 사칙연산이 가능하다. */
		String query = "UPDATE board2 SET "
					+ " visitcount = visitcount+1 "
					+ " WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int updateEdit(Board2DTO dto) {
		int result = 0;
		
		try {
			//특정 일련번호에 해당하는 게시물을 수정한다.
			String query = "UPDATE board2 SET "
						+ " title=?, content=? "
						+ " WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			//인파라미터 설정하기
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getIdx());
			//수정된 레코드의 갯수가 반환된다.
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정중 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시물 삭제하기
	public int deletePost(Board2DTO dto) { 
		int result = 0;
		
		try {
			//인파라미터가 있는 delete 쿼리문 작성
			String query = " DELETE FROM board2 WHERE idx=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getIdx());
			
			result = psmt.executeUpdate();
		} 	
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시물 목록 출력시 페이징 기능 추가
	public List<Board2DTO> selectListPage(Map<String, Object> map){
		List<Board2DTO> bbs = new ArrayList<Board2DTO>();
		
		System.out.println("selectListPage 쿼리 실행");
		
		/* 검색조건에 일치하는 게시물을 얻어온 후 각 페이지에 출력할
		구간까지 설정한 서브쿼리문 작성 */
		//게시물 수를 얻어오는 쿼리문 작성
				String query = " SELECT * FROM board2 ";
				//검색어가 있는 경우 where절을 추가하여 조건에 맞는 게시물만
				//인출한다.
				if(map.get("searchWord") != null) {
					query += " WHERE " + map.get("searchField") + " "
							+ " LIKE '%" + map.get("searchWord")+"%'";
				}
				query += " order by postdate desc";
		
		/*
		between절 대신 비교연산자를 통해 쿼리문을 구성할 수도 있다.
		==> where rNum>=? and rNum<=?
		 */
		
		try {
			//인파라미터가 있는 쿼리문이므로 prepared객체를 생성한다.
			psmt = con.prepareStatement(query);
			//인파라미터를 설정한다. 구간의 시작과 끝을 계산한 값이다.
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			//쿼리문을 실행하고 결과레코드를 ResultSet으로 반환받는다.
			rs = psmt.executeQuery();
			//결과 레코드의 갯수만큼 반복하여 List컬렉션에 저장한다.
			while(rs.next()) {
				Board2DTO dto = new Board2DTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setB_id(rs.getString("b_id"));
				bbs.add(dto);
			}
		}
		
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
}