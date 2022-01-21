package springboard.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import springboard.model.JDBCTemplateDAO;
import springboard.model.SpringBbsDTO;

@Service
public class DeleteActionCommand implements BbsCommandImpl{
	
	@Autowired
	JDBCTemplateDAO dao;
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		
		// 커맨트 객체를 통해 모든 폼값을 저장한 DTO를 가져온다.
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		
		//JDBCTemplateDAO dao = new JDBCTemplateDAO();
		/*
		 커맨드객체가 없다면!
		 폼값을 개별적으로 받아야 한다.
		 */
		// DTO객체를 DAO로 전달한다.
		dao.delete(idx, pass);
	}
}
