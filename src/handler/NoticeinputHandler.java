package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeinputHandler implements CommandHandler {
	@RequestMapping("/noticeinput")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int not_no = 0;
		int ref = 0;
		int re_step = 0;
		int re_level = 0;
		if(request.getParameter("num") != null){
			// 답변글
			not_no = Integer.parseInt(request.getParameter("not_no"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
		
		request.setAttribute("not_no", not_no);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
		
		return new ModelAndView("noticeinput");
	}
}
