package handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDBBean;
import reserv.ReservDto;

@Controller
public class UserReservAllHandler implements CommandHandler{
	@RequestMapping("/userreservAll")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ReservDBBean rao = new ReservDBBean();
		List<ReservDto> select = rao.select();
		request.setAttribute("select", select);
		
		List<ReservDto> select2 = rao.select2();
		request.setAttribute("select2", select2);
		
		return new ModelAndView("userreservAll");
	}
}
