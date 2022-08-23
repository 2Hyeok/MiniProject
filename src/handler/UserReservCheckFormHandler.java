package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;
import reserv.ReservDto;

@Controller
public class UserReservCheckFormHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("/userreservcheck")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String)request.getSession().getAttribute("memId");

		ReservDto rto = reservDao.getReserv(id);
		
		request.setAttribute("rto", rto);
		
		return new ModelAndView("userreservcheck");
	}

}
