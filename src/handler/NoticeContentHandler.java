package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.NoticeDao;
import hospital.NoticeDataBean;

@Controller
public class NoticeContentHandler implements CommandHandler {
	
	@Resource
	private NoticeDao noticeDao;
	
	@RequestMapping("/noticecontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("not_no"));
		String pageNum = request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));

		NoticeDataBean nto = noticeDao.getNotice(num); //데이터를 가져다 바로 출력
		
		if(! nto.getFk_dr_id2().equals(request.getRemoteAddr()) ) {
			noticeDao.addNcount(num);
		}
		
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("nto", nto);
		
		return new ModelAndView("noticecontent");
	}
}
