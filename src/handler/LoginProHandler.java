package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.LogonDao;

@Controller
public class LoginProHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/loginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 입력한 아이디 비밀번호가 디비에 저장된 정보와 일치하는지 체크
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		int result = logonDao.check(id, passwd);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return new ModelAndView("loginPro");
	}
}
