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
public class GaipProHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao; // 싱글톤으로 생성
	
	@RequestMapping("/gaipPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		// 회원가입
		// 기입한 정보를 db에 저장할 수 있도록
		LogonDataBean dto = new LogonDataBean();
		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_passwd(request.getParameter("user_passwd"));
		dto.setUser_name(request.getParameter("user_name"));
		
		String user_tel = null;
		String user_tel1 = request.getParameter("user_tel1");
		String user_tel2 = request.getParameter("user_tel2");
		String user_tel3 = request.getParameter("user_tel3");
		
		if( ! user_tel2.equals("") && ! user_tel3.equals("")) {
			user_tel = user_tel1 + "-" + user_tel2 + "-" + user_tel3;
		}
		dto.setUser_tel(user_tel);
		
		dto.setUser_gender(request.getParameter("user_gender"));
		dto.setUser_dis(request.getParameter("user_dis"));
		
		
		String user_p_tel = null;
		String user_p_tel1 = request.getParameter("user_p_tel1");
		String user_p_tel2 = request.getParameter("user_p_tel2");
		String user_p_tel3 = request.getParameter("user_p_tel3");
		
		if( ! user_p_tel2.equals("") && ! user_p_tel3.equals("")) {
			user_p_tel = user_p_tel1 + "-" + user_p_tel2 + "-" + user_p_tel3;
		}
		dto.setUser_p_tel(user_p_tel);
		
		dto.setUser_p_name(request.getParameter("user_p_name"));
		dto.setUser_accountnum(request.getParameter("user_accountnum"));
		
		int result = logonDao.insertUser(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("gaipPro");
	}
}
