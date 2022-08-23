package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardInputHandler implements CommandHandler{
	
	@RequestMapping("/boardinput")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int b_no = 0;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		if(request.getParameter("b_no") != null){
			// 답변글
			b_no = Integer.parseInt(request.getParameter("b_no"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
		
		request.setAttribute("b_no", b_no);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		
		return new ModelAndView("boardinput");
	}

}
