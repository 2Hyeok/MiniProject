package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.DoctorDao;

@Controller
public class DrLoginProHandler implements CommandHandler{
	
	@Resource
	private DoctorDao doctorDao;
	
	@RequestMapping("/drloginPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		int result = doctorDao.drcheck(id, passwd); // 변수 생성후 이렇게 만들어줌
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		
		return new ModelAndView("drloginPro");
	}
}
