package handler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hospital.BoardDao;
import hospital.BoardDataBean;

@Controller
public class BoardReplyModifyViewHandler implements CommandHandler{
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/boardreplymodifyView")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("b_no"));
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");

		int result = boardDao.check1(num, id);
		
		request.setAttribute("b_no", num);//
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		if(result != 0) {
			BoardDataBean bto = boardDao.getArticle(num);
			request.setAttribute("bto", bto);
		}
		
		return new ModelAndView("boardreplymodifyView");
	}
}
