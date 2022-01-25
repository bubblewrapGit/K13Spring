package mybatis;

import lombok.Data;

@Data
public class ParameterDTO {
	private String user_id; 	// 사용자 아이디
	private String board_idx; 	// 게시판 일련번호
	//검색기능 추가
	private String searchField; // 검색할 필드명
	private String searchTxt; 	// 검색어
	// select 구간을 위한 멤버변수
	private int start; 			// select의 시작
	private int end; 			// 끝
	
	
}
