package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservDeleteFormHandler implements CommandHandler {
	@RequestMapping("/reservdeleteForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String)request.getSession().getAttribute("memId");
		
		request.setAttribute("memId", id);
		return new ModelAndView("reservdeleteForm");
	}

}
