package handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.DoctorDBBean;
import hospital.DoctorDataBean;
import hospital.LogonDBBean;
import hospital.LogonDataBean;

@Controller
public class UserInterFaceHandler implements CommandHandler{
	@RequestMapping("/userInterface")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		LogonDBBean dao = new LogonDBBean();
		List<LogonDataBean> userlist = dao.selectAlluser();
		request.setAttribute("userlist", userlist);
		
		DoctorDBBean aao = new DoctorDBBean();
		List<DoctorDataBean> doctorlist = aao.selectAlldoctor();
		request.setAttribute("doctorlist", doctorlist);
		
		return new ModelAndView("userInterface");
	}
}
