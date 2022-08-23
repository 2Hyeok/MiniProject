package handler;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.BoardDao;
import hospital.BoardDataBean;

@Controller
public class BoardInputProHandler implements CommandHandler {
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/boardinputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		BoardDataBean bto = new BoardDataBean();
		
		bto.setFk_user_id1(request.getParameter("fk_user_id1"));
		bto.setFk_dr_id1(request.getParameter("fk_dr_id1"));
		bto.setB_title(request.getParameter("b_title"));
		bto.setB_write(request.getParameter("b_write"));
		bto.setB_no(Integer.parseInt(request.getParameter("b_no")));
		bto.setRef(Integer.parseInt(request.getParameter("ref")));
		bto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		bto.setB_reg_date(new Timestamp(System.currentTimeMillis()));
		
		
		int result = boardDao.insertArticle(bto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("boardinputPro");
	}
}
