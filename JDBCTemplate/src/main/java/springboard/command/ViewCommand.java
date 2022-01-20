package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

public class ViewCommand implements BbsCommandImpl{
	
	@Override
	public void execute(Model model) {

		// 요청 일괄 받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		// 폼값 받기
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		
		// DAO, DTO 객체 생성 및 상세보기 처리를 위한 메서드 호출
		JDBCTemplateDAO dao = new JDBCTemplateDAO();
		SpringBbsDTO dto = new SpringBbsDTO();
		dto = dao.view(idx);
		
		// 내용에 관련된 텍스트는 줄바꿈처리를 해야한다.
		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
		
		// 뷰쪽으로 전달을 위해 model에 넣어준다.
		model.addAttribute("viewRow", dto);
		model.addAttribute("nowPage", nowPage);
		
	}

}
