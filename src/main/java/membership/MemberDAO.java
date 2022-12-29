package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model1.board2.Board2DTO;
/*
DAO(Data Access Object)
: 실제 데이터베이스에 접근하여 여러가지 CRUD작업을 하기 위한 객체
*/
public class MemberDAO extends JDBConnect{
	
	//매개변수가 4개인 부모의 생성자를 호출하여 DB에 연결한다.
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	//application 내장객체만 매개변수로 전달한 후 DB에 연결한다.
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setAdmin(rs.getString(6));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
public MemberDTO ViewMemberDTO(String id) {
		
		
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member WHERE id=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setMobile(rs.getString(5));
				dto.setAdmin(rs.getString(6));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//호출한 지점으로 DTO객체를 반환한다.
		return dto;
	}
	public int updateEdit(MemberDTO dto) {
		int result = 0;
		
		try {
			
			String query = " UPDATE member SET pass=?, name=?, email=?, mobile=? WHERE id=? ";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(5, dto.getId());
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getMobile());
			
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정중 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
