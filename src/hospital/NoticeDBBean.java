package hospital;

import java.util.List;
import java.util.Map;

import mybatis.SqlMapClient;

public class NoticeDBBean implements NoticeDao {
	
	// 글 전체글갯수
		// 글 갯수 표시 부분
		public int getNcount() {
			return SqlMapClient.getSession().selectOne("Hospital.getNcount");
		}

		// 글쓰기
		// sql 을 3번 써줌
		public int insertNotice(NoticeDataBean nto) {
			int not_no=nto.getNot_no();
			int ref=nto.getRef();
			int re_step=nto.getRe_step();
			int re_level=nto.getRe_level();
	         
			String  sql=null;
			if(not_no==0) {
				//제목글
				int count = getNcount();
				if(count != 0) {
					// 글이 있는 경우
					int maxnot_no = SqlMapClient.getSession().selectOne("Hospital.maxNot_no");
					ref = maxnot_no+1;// 그룹화 아이디 = 글번호 최댓값 + 1, int로 넘김
				}
				re_step=0;
				re_level=0;
			}else {
				//답변글
				// map 으로 넘길 필요없이 넘기는 바구니안에 데이터가 다 들어있어 바구니를 통체로 던지면됨
				SqlMapClient.getSession().update("Hospital.updateReply", nto);// 바구니에서 꺼내오면 안된다.
				re_step ++;
				re_level ++;
			}
		
			// 반드시 넘기는것
			nto.setRef(ref);
			nto.setRe_step(re_step);
			nto.setRe_level(re_level);
			
			// 글 등록
			return SqlMapClient.getSession().insert("Hospital.insertNotice", nto);
		}
		
		
		
		
		// list.jsp의 getArticles
		public List<NoticeDataBean> getNotices(Map<String, Integer> map){
			return SqlMapClient.getSession().selectList("Hospital.getNotices", map);
		}
		
		
		// 글 보기
		public NoticeDataBean getNotice(int num) {
			return SqlMapClient.getSession().selectOne("Hospital.getNotice", num);
		}
		
		// 조회수
		public void addNcount(int num) {
			SqlMapClient.getSession().update("Hospital.addNcount", num);
	   }
	   
		// 비밀번호 체크
		public int check(int num, String id) {
			NoticeDataBean nto = getNotice(num);
			int result = 0;
			if(nto.getFk_dr_id2().equals(id)) {
				//databean의 nto에 담긴 아이디(fk_id)랑 넘어온 id(docid)와 equals(비교)하여 참이면 1 아니면 0으로 반환한다.
				result=1;
			}else {
				result=0;
			}
			return result;
	   }
	   
		// 글 삭제
		public int deleteNotice(int num) {

			
			NoticeDataBean nto = getNotice(num); // ref, re_step, re_level 값을 가져오지 못하고 num값을 가져오기 때문에 getArticle을 가져옴
			// 답글 유무 확인
			int count = SqlMapClient.getSession().selectOne("Hospital.checkReply", nto);
			
			if(count != 0) {
				// 답글이 있는경우
				return SqlMapClient.getSession().update("Hospital.delNotice", num);
				
			} else {
				// 답글이 없는경우
				SqlMapClient.getSession().update("Hospital.deleteReply", nto);
				
				// 삭제
				return SqlMapClient.getSession().delete("Hospital.deleteNotice", nto);
			}
		}

}
