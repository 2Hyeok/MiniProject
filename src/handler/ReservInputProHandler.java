package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;
import reserv.ReservDto;

@Controller
public class ReservInputProHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("/reservPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		ReservDto rto = new ReservDto();
		rto.setRe_num(Integer.parseInt(request.getParameter("re_num")));
		rto.setUser_id(request.getParameter("user_name"));
		rto.setUser_id(request.getParameter("user_id"));
		rto.setDr_id(request.getParameter("dr_id"));
		rto.setDr_major(request.getParameter("dr_major"));
		rto.setDr_name(request.getParameter("dr_name"));
		rto.setRe_date(request.getParameter("re_date"));
		rto.setRe_time(request.getParameter("re_time"));
		rto.setRe_col(request.getParameter("re_col"));
		rto.setRe_reg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = reservDao.insertReserv(rto);
		request.setAttribute("result", result);
		
		return new ModelAndView("reservPro");
	}

}
