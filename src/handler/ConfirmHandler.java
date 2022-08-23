package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.LogonDao;

@Controller
public class ConfirmHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/confirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 아이디 중복확인
		String id = request.getParameter("id");
		
		int result = logonDao.check(id);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return new ModelAndView("confirm");
	}
}
