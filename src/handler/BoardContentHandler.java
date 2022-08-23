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
public class BoardContentHandler implements CommandHandler{
	
	@Resource
	private BoardDao boardDao;
	
	@RequestMapping("/boardcontent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("b_no"));
		String pageNum = request.getParameter("pageNum");
		int number = Integer.parseInt(request.getParameter("number"));
		
		BoardDataBean bto = boardDao.getArticle(num); //데이터를 가져다 바로 출력
		
		boardDao.addCount(num); // 조회수 추가
		
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bto", bto);
		
		return new ModelAndView("boardcontent");
	}
}
