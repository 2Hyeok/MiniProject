package hospital;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class BoardDBBean implements BoardDao {
	
	// 글 전체글갯수
		// 글 갯수 표시 부분
		public int getCount() {
			return SqlMapClient.getSession().selectOne("Hospital.getCount");
		}

		// 글쓰기
		// sql 을 3번 써줌
		public int insertArticle(BoardDataBean bto) {
			int b_no = bto.getB_no();
			int ref = bto.getRef();
			int re_step = bto.getRe_step();
			int re_level = bto.getRe_level();
	         
			String sql=null;
			if(b_no==0) {
				//제목글
				int count = getCount();
				if(count != 0) {
					// 글이 있는 경우
					int maxnum = SqlMapClient.getSession().selectOne("Hospital.maxNum");
					ref = maxnum+1;// 그룹화 아이디 = 글번호 최댓값 + 1, int로 넘김
				}
				re_step=0;
				re_level=0;
			}else {
				//답변글
				// map 으로 넘길 필요없이 넘기는 바구니안에 데이터가 다 들어있어 바구니를 통체로 던지면됨
				SqlMapClient.getSession().update("Hospital.updateReply", bto);// 바구니에서 꺼내오면 안된다.
				re_step ++;
				re_level ++;
			}
		
			// 반드시 넘기는것
			bto.setRef(b_no);
			bto.setRef(ref);
			bto.setRe_step(re_step);
			bto.setRe_level(re_level);
			
			// 글 등록
			return SqlMapClient.getSession().insert("Hospital.insertArticle", bto);
		}
		
		// list.jsp의 getArticles
		public List<BoardDataBean> getArticles(Map<String, Integer> map){
			return SqlMapClient.getSession().selectList("Hospital.getArticles", map);
		}
		
		
		// 글 보기
		public BoardDataBean getArticle(int num) {
			return SqlMapClient.getSession().selectOne("Hospital.getArticle", num);
		}
		
		// 조회수
		public void addCount(int num) {
			SqlMapClient.getSession().update("Hospital.addCount", num);
	   } 
		
		// 아이디 체크
		public int check(int num, String id) {
			BoardDataBean bto = getArticle(num);//글번호 확인하는 sql태그의 id로 넘겨주면서 num을 변수값으로 같이 넘긴다.

			int result = 0;
			
			if(bto.getFk_user_id1().equals(id)) {
				//databean의 bto에 담긴 아이디(fk_id)랑 넘어온 id(memid)와 equals(비교)하여 참이면 1 아니면 0으로 반환한다.
				result=1;
			} else {
				result = 0;
			}
			return result;
	   }
		
		public int check1(int num, String id) {
			BoardDataBean bto = getArticle(num);//글번호 확인하는 sql태그의 id로 넘겨주면서 num을 변수값으로 같이 넘긴다.

			int result = 0;
			
			if(bto.getFk_dr_id1().equals(id)) {
				//databean의 bto에 담긴 아이디(fk_id)랑 넘어온 id(memid)와 equals(비교)하여 참이면 1 아니면 0으로 반환한다.
				result=1;
			} else {
				result = 0;
			}
			return result;
	   }
		
		// 글 삭제
		public int deleteArticle(int num) {
			
			BoardDataBean bto = getArticle(num); // ref, re_step, re_level 값을 가져오지 못하고 num값을 가져오기 때문에 getArticle을 가져옴
			// 답글 유무 확인
			int count = SqlMapClient.getSession().selectOne("Hospital.checkReply", bto);
			
			if(count != 0) {
				// 답글이 있는경우
				return SqlMapClient.getSession().update("Hospital.delArticle", num);
				
			} else {
				// 답글이 없는경우
				SqlMapClient.getSession().update("Hospital.deleteReply", bto);
				
				// 삭제
				return SqlMapClient.getSession().delete("Hospital.deleteArticle", bto);
			}
		}
		
		// 글 수정
		public int modifyArticle(BoardDataBean bto) {
			return SqlMapClient.getSession().update("Hospital.modifyArticle", bto);
	   }
}
