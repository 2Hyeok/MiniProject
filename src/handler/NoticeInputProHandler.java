package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.NoticeDao;
import hospital.NoticeDataBean;

@Controller
public class NoticeInputProHandler implements CommandHandler{
	
	@Resource
	private NoticeDao noticeDao;
	
	@RequestMapping("/noticeinputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		NoticeDataBean nto = new NoticeDataBean();
		
		nto.setNot_no(Integer.parseInt(request.getParameter("not_no")));
		nto.setFk_dr_id2(request.getParameter("fk_dr_id2"));
		nto.setNot_title(request.getParameter("not_title"));
		nto.setNot_write(request.getParameter("not_write").replace("\r\n", "<br>"));
		nto.setRef(Integer.parseInt(request.getParameter("ref")));
		nto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		nto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		nto.setNot_reg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = noticeDao.insertNotice(nto);
		
		request.setAttribute("result", result);
		
		
		return new ModelAndView("noticeinputPro");
	}
}
