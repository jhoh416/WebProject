package model1.board;

public class BoardDTO {
	//멤버 변수 선언 : board 테이블에 생성된 컬럼과 동일함
	private int idx;
	private String title;
	private String id;
	private String content;
	private java.sql.Date postdate;
	private String visitcount;
	// member테이블과의 join을 통해 회원 이름을 출력해야 할때를 위해
	// 멤버변수를 추가한다.
	private String b_id;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	
	
	
	
	
	
	

	

	
	//특별한 이유가 없다면 생성자는 없어도 된다.
	

	
}
