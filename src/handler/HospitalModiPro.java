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
public class HospitalModiPro implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping("modiPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		LogonDataBean dto = new LogonDataBean();
		
		// 로그인 유저의 비밀번호
		dto.setUser_passwd( request.getParameter( "user_passwd" ) );
		
		// 로그인 유저의 아이디
		dto.setUser_id( (String) request.getSession().getAttribute( "memId" ) );
		
		// 정보 수정
		String user_tel = null;
		String user_tel1 = request.getParameter( "user_tel1" );
		String user_tel2 = request.getParameter( "user_tel2" );
		String user_tel3 = request.getParameter( "user_tel3" );
		if( ! user_tel1.equals( "" ) && ! user_tel2.equals( "" ) && ! user_tel3.equals( "" ) ) {
			user_tel = user_tel1 + "-" + user_tel2 + "-" + user_tel3;
		}
		dto.setUser_tel( user_tel );
		
		dto.setUser_gender(request.getParameter("user_gender"));
		
		dto.setUser_dis(request.getParameter("user_dis"));
		
		dto.setUser_p_name(request.getParameter("user_p_name"));
		
		String user_p_tel =null;
		String user_p_tel1= request.getParameter("user_p_tel1");
		String user_p_tel2= request.getParameter("user_p_tel2");
		String user_p_tel3= request.getParameter("user_p_tel3");
		
		if(! user_p_tel1.equals("") && ! user_p_tel2.equals("") && ! user_p_tel3.equals("") ) {
			user_p_tel = user_p_tel1 + "-" + user_p_tel2 + "-" + user_p_tel3;
		}
		dto.setUser_p_tel(user_p_tel);
		
		int result = logonDao.modifyUser( dto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView("modiPro");
	}

}
