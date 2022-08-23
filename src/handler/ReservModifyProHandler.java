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
public class ReservModifyProHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("/reservmodifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		ReservDto rto = new ReservDto();
		
		rto.setUser_id(request.getParameter("user_id"));
		rto.setRe_date(request.getParameter("re_date"));
		rto.setRe_time(request.getParameter("re_time"));
		rto.setDr_id(request.getParameter("dr_id"));
		rto.setRe_col(request.getParameter("re_col"));
		
		int result = reservDao.modifyresev(rto);
		
		request.setAttribute("result", result);
		return new ModelAndView("reservmodifyPro");
	}
}
