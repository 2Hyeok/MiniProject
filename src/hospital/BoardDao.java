package hospital;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	public int getCount(); // 글갯수 표시
	public List<BoardDataBean> getArticles(Map<String, Integer> map); // 시작과 끝
	
	public int insertArticle(BoardDataBean bto); // 글쓰기
	
	public BoardDataBean getArticle(int num); // 글 읽기
	public void addCount(int num); // 조회수
	public int check(int num, String id); // 비밀번호 확인
	public int check1(int num, String id);
	
	public int modifyArticle(BoardDataBean bto); // 글 수정
	
	public int deleteArticle(int num); // 글 삭제
}
