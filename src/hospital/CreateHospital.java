package hospital;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import reserv.ReservDBBean;
import reserv.ReservDao;

@Configuration
public class CreateHospital {
	// 유저
	@Bean
	public LogonDao logonDao() { // dataSource를 넣어주어야함
		return new LogonDBBean();
	}
	
	// QnA
	@Bean
	public BoardDao boardDao() {
		return new BoardDBBean();
	}
	
	// 의사
	@Bean
	public DoctorDao doctorDao() {
		return new DoctorDBBean();
	}
	
	// 공지
	@Bean
	public NoticeDao noticeDao() {
		return new NoticeDBBean();
	}
	
	@Bean
	public ReservDao reservDao() {
		return new ReservDBBean();
	}
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/hospital/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}
