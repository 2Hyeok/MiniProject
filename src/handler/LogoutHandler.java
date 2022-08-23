package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutHandler implements CommandHandler {
	@RequestMapping("/logout")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 로그아웃
		request.getSession().removeAttribute("memId");
		
		return new ModelAndView("hospital");
	}

}
