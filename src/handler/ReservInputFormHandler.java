package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.LogonDao;
import hospital.LogonDataBean;

@Controller
public class ReservInputFormHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("/reserv")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = (String) request.getSession().getAttribute( "memId" );
		LogonDataBean dto = logonDao.getUser(id);
		request.setAttribute( "dto", dto );

		int re_num = 0;
		
		request.setAttribute("re_num", re_num);
		
		return new ModelAndView("reserv");
	}
}
