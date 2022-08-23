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
public class HospitalModiViewHandler implements CommandHandler{
	
	@Resource
	private LogonDao logonDao;
	
	@RequestMapping( "/modiView" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		
		// 사용자의 아이디와 입력 비밀번호 확인 후 db체크로이동 값이맞으면 수정화면으로 변경
		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );	

		int result = logonDao.check( id, passwd );
			
		request.setAttribute( "result", result );
		
		if( result != 0 ) {
			LogonDataBean dto = logonDao.getUser( id );
			request.setAttribute( "dto", dto );
		}
		
		return new ModelAndView( "modiView" );
	}

}
