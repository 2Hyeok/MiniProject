package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.NoticeDao;

@Controller
public class NoticeDeleteProHandler implements CommandHandler{
	
	@Resource
	private NoticeDao noticeDao;
	
	@RequestMapping("/noticedeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			int num = Integer.parseInt(request.getParameter("not_no"));//b_no라는 값을 폼프로에서 받아서 num으로 정의해준다.
			String id = request.getParameter("id");// deleteForm의 name=passwd의 값
			String pageNum = request.getParameter("pageNum");
	      
	      
			int resultCheck = noticeDao.check(num,id);//체크메소드를 사용하는데 글번호와 아이디를 넘겨준다.
	      
			request.setAttribute("resultCheck", resultCheck);
			request.setAttribute("pageNum", pageNum);
	      
		if (resultCheck !=0) {
	        int result = noticeDao.deleteNotice(num);
	        request.setAttribute("result", result);
		}
		
		return new ModelAndView("noticedeletePro");
	}
}
