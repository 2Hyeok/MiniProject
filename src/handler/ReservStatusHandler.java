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
public class ReservStatusHandler implements CommandHandler{
	@RequestMapping("/reservstatus")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ReservDBBean rao = new ReservDBBean();
		List<ReservDto> select3 = rao.select3();
		request.setAttribute("select3", select3);
		
		List<ReservDto> select4 = rao.select4();
		request.setAttribute("select4", select4);
		
		return new ModelAndView("reservstatus");
	}

}
