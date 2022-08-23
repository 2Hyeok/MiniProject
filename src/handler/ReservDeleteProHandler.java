package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;

@Controller
public class ReservDeleteProHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("/reservdeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("user_id");
		
		int resultCheck = reservDao.check(id);
		
		request.setAttribute("resultCheck", resultCheck);
		
		if(resultCheck != 0) {
			int result = reservDao.deleteReserv(id);
			request.setAttribute("result", result);
		}
		
		return new ModelAndView("reservdeletePro");
	}

}
