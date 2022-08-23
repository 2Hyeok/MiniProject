package reserv;

import java.util.List;

import mybatis.SqlMapClient;

public class ReservDBBean implements ReservDao{
	
	public int insertReserv(ReservDto rto) {
		return SqlMapClient.getSession().insert("Reserv.insertReserv", rto);
	}
	
	public List<ReservDto> select() {
		return SqlMapClient.getSession().selectList("Reserv.select");
	}
	
	public List<ReservDto> select2() {
		return SqlMapClient.getSession().selectList("Reserv.select2");
	}
	
	public List<ReservDto> select3() {
		return SqlMapClient.getSession().selectList("Reserv.select3");
	}
	
	public List<ReservDto> select4() {
		return SqlMapClient.getSession().selectList("Reserv.select4");
	}
	
	public ReservDto getReserv(String id) { // 예약확인
		return SqlMapClient.getSession().selectOne("Reserv.getReserv", id);
	}
	
	public int check(String id) {
	      ReservDto rto = getReserv(id);//글번호 확인하는 sql태그의 id로 넘겨주면서 num을 변수값으로 같이 넘긴다.

	      int result = 0;
	      
	      if(rto.getUser_id().equals(id)) {
	         //databean의 bto에 담긴 아이디(fk_id)랑 넘어온 id(memid)와 equals(비교)하여 참이면 1 아니면 0으로 반환한다.
	         result=1;
	      } else {
	         result = 0;
	      }
	      return result;
	   }
	
	public int deleteReserv(String id) {
		return SqlMapClient.getSession().delete("Reserv.deleteReserv",id);
	}
	
	public int modifyresev(ReservDto rto) {
		return SqlMapClient.getSession().update("Reserv.modifyresev", rto);
	}
	
	public int reservcheck(String id) {
		return SqlMapClient.getSession().selectOne("Reserv.reservcheck", id);
	}
}
