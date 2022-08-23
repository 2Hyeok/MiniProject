package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeDeleteFormHandler implements CommandHandler{
	@RequestMapping("/noticedeleteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		  
		  int not_no = Integer.parseInt(request.getParameter("not_no"));
	      String id = request.getParameter("id");
	      String pageNum = request.getParameter("pageNum");
	      
	      request.setAttribute("not_no", not_no);//pro 넘긴다.
	      request.setAttribute("id", id);
	      request.setAttribute("pageNum", pageNum);
		return new ModelAndView("noticedeleteForm");
	}
}
