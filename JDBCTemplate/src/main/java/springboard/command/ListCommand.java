package springboard.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;
import springboard.util.EnvFileReader;
import springboard.util.PagingUtil;

/*
 BbsCommandImpl 인터페이스를 구현했음으로 execute()는 반드시 오버라이딩 해야한다. 
 또한 해당 객체는 부모타입인 BbsCommandImpl로 참조할 수 있다.
 */
public class ListCommand implements BbsCommandImpl{
	
	@Override
	public void execute(Model model) {
		System.out.println("ListCommand > execute() 호출");
		
		/*
		컨트롤러에서 인자로 전달한 Model객체에는 request객체가 저장되어 있다.
		asMap()을 통해 Map컬렉션으로 변환한 후 모든 요청을 얻어온다.
		 */
		Map<String, Object> paramMap = model.asMap();
		// 현재 Object형으로 저장된 request객체를 원래의 형으로 형변환 해준다.
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		// DAO객체 생성
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		
		// 검색어 처리
		String addQueryString = "";
		// request 내장객체를 통해 폼값을 받아온다.
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchWord!=null) {
			// 컴색어가 있는 경우 쿼리스트링 추가
			addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
			
			// DAO로 전달할 데이터를 Map컬렉션에 저장
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		
		// 전체 레코드 수 카운트 하기
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		/******** 페이징 추가 코드 add **********/
		//EnvFileReader 객체를 통한 properties파일을 읽어온다.
		int pageSize = Integer.parseInt(EnvFileReader.getValue("SpringBbsInit.properties", "springBoard.pageSize"));
		int blockPage = Integer.parseInt(EnvFileReader.getValue("SpringBbsInit.properties", "springBoard.blockPage"));
		
		// 전체 페이지수를 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		// 현재 페이지번호. 첫진입일때는 무조건 1페이지로 지정
		int nowPage = req.getParameter("nowPage")==null ? 1 : 
			Integer.parseInt(req.getParameter("nowPage"));
		// 리스트에 출력할 게시물의 구간을 계산(select절의 between에 사용)
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		paramMap.put("start", start);
		paramMap.put("end", end);
		/******** 페이징 추가 코드 end **********/
		
	 
		// 실제 출력할 리스트 가져오기 -> select한 후 반환받음(페이징X)
		//ArrayList<SpringBbsDTO> listRows = dao.list(paramMap);
		
		// 페이징 적용된 쿼리문을 통한 select(페이징0)
		ArrayList<SpringBbsDTO> listRows = dao.listPage(paramMap);
		
		// 목록에 출력할 게시물의 가상번호 계산 후 부여하기
		int virtualNum = 0;
		int countNum = 0;
		
		for(SpringBbsDTO row : listRows) {
			// 전체게시물의 갯수에서 하나씩 차감하면서 가상번호를 부여한다.(페이징X)
			// virtualNum = totalRecordCount --;
			
			/******** 가상번호 계산 추가코드 add **********/
			virtualNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
			/******** 가상번호 계산 추가코드 end **********/
			
			// 가상번호를 setter를 통해 저장
			row.setVirtualNum(virtualNum);
		}
		
		
		// 위에서 처리한 목록의 모든 처리결과를 Model객체에 저장한다.
		model.addAttribute("listRows", listRows);
		/****** 페이징 처리 코드 add ********/
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/board/list.do?"+addQueryString);
		
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		/****** 페이징 처리 코드 end ********/
		
		// JdbcTemplate을 사용할 때는 자원반납은 하지 않는다.
		/*
		 프로그램이 시작되면 자동으로 DB와 연결되고
		 close하면 DB와 연결이 끈어져버린다.
		 Spring에서는 close를 사용하지 않는다.
		 Spring이 알아서 해준다.
		 */
		// dao.close();
	}
	
	
}
