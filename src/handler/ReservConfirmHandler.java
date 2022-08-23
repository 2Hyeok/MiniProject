package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reserv.ReservDao;

@Controller
public class ReservConfirmHandler implements CommandHandler{
	
	@Resource
	private ReservDao reservDao;
	
	@RequestMapping("/reservconfirm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = (String) request.getSession().getAttribute( "memId" );
		
		String re_date = request.getParameter("re_date");
		String re_time = request.getParameter("re_time");
		String dr_id = request.getParameter("dr_id");
		String re_col = request.getParameter("re_col");
		
		int re_num = 0;
		int result = reservDao.reservcheck(id);
		
		
		request.setAttribute("result", result);
		request.setAttribute("user_id", id);
		request.setAttribute("re_num", re_num);
		request.setAttribute("re_date", re_date);
		request.setAttribute("re_time", re_time);
		request.setAttribute("re_col", re_col);
		request.setAttribute("dr_id", dr_id);
		
		return new ModelAndView("reservconfirm");
	}

}
