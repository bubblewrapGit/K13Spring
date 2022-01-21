package springboard.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import springboard.command.BbsCommandImpl;
import springboard.command.DeleteActionCommand;
import springboard.command.EditActionCommand;
import springboard.command.EditCommand;
import springboard.command.ListCommand;
import springboard.command.ViewCommand;
import springboard.command.WriteActionCommand;
import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;


@Controller
public class BbsController {

	@Autowired
	private JDBCTemplateDAO dao;
	
	// 모든 Command객체의 부모타입의 참조변수 생성
	BbsCommandImpl command = null;
	
	@Autowired
	ListCommand listCommand;
	
	@Autowired
	WriteActionCommand writeActionCommand;
	
	@Autowired
	ViewCommand viewCommand;
	
	@Autowired
	EditCommand editCommand;
	
	@Autowired
	DeleteActionCommand deleteActionCommand;
	
	@Autowired
	EditActionCommand editActionCommand;
	


	@RequestMapping("/bootSkin/listT.do")
	public String bootSkinlist(Model model, HttpServletRequest req) {
		model.addAttribute("req",req); // request객체 자체를 Model에 저장
		
		command = listCommand;
		command.execute(model);	// 해당 객체로 Model객체 자체를 전달
		return "BootSkin/listT";
	}
	@RequestMapping("/bootSkin/writeT.do")
	public String bootSkinwrite(Model model) {
		return "BootSkin/writeT";
	}
	
	// 전송방식이 post 임으로 value, method 까지 같이 기술해서 매핑
	@RequestMapping(value="/bootSkin/writeAction.do", method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {
		// request객체와 함꼐 Model에 저장
		model.addAttribute("req", req);
		model.addAttribute("springBbsDTO", springBbsDTO);

		command = writeActionCommand;
		command.execute(model);
		
		return "redirect:listT.do?nowPage=1";
		
	}
	
	
	// 글 내용보기
	@RequestMapping("/bootSkin/viewT.do")
	public String view(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {
		model.addAttribute("req",req);
		model.addAttribute("springBbsDTO",springBbsDTO);
		
		command = viewCommand;
		command.execute(model);
	
		return "BootSkin/viewT"; 
	}
	
	
	// 패스워드 검증페이지로 진입
	@RequestMapping("/bootSkin/password.do")
	public String password(Model model, HttpServletRequest req) {
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		
		return "BootSkin/password";
	}
	
	// 패스워드 검증
	@RequestMapping("/bootSkin/passwordAction.do")
	public String passwordAction(Model model, HttpServletRequest req, SpringBbsDTO springBbsDTO) {
		String modePage = null;
		
		// 폼값 받기
		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String pass = req.getParameter("pass");
		
		
		int rowExist = dao.password(idx, pass);
		
		if(rowExist<=0) {
			model.addAttribute("isCorrMsg", "패스워드가 일치하지 않습니다.");
			model.addAttribute("idx", idx);
			
			modePage = "BootSkin/password";
		}else {
			
			System.out.println("검증완료");
			
			if(mode.equals("edit")) {
				
				model.addAttribute("req", req);
				
				command = editCommand;
				command.execute(model);
				modePage = "BootSkin/editT";
				
			}else if(mode.equals("delete")) {
				
				model.addAttribute("req",req);
				
				command = deleteActionCommand;
				command.execute(model);
				
				model.addAttribute("nowPage", req.getParameter("nowPage"));
				modePage = "redirect:listT.do";
			}
		}
		return modePage;
	}
	
	
	// 수정 처리
	@RequestMapping("bootSkin/editAction.do")
	public String editAction(HttpServletRequest req, Model model, SpringBbsDTO springBbsDTO) {

		model.addAttribute("req",req);
		model.addAttribute("springBbsDTO", springBbsDTO);
		
		command = editActionCommand;
		command.execute(model);
		
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		
		return "redirect:viewT.do";
	}
	
}
