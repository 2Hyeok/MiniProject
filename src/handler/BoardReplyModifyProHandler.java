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
public class BoardReplyModifyProHandler implements CommandHandler{
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/boardreplymodifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		BoardDataBean bto = new BoardDataBean();
		
		bto.setB_title(request.getParameter("b_title"));
		bto.setB_write(request.getParameter("b_write"));
		bto.setB_no(Integer.parseInt(request.getParameter("b_no")));
		
		String pageNum = request.getParameter("pageNum");

		int result = boardDao.modifyArticle(bto);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return new ModelAndView("boardreplymodifyPro");
	}
}
