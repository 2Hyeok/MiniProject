package reserv;

import java.util.List;

public interface ReservDao {
	public int insertReserv(ReservDto rto); // 예약 넣기
	
	public List<ReservDto> select();
	public List<ReservDto> select2();
	public List<ReservDto> select3();
	public List<ReservDto> select4();
	
	public ReservDto getReserv(String id); // 예약 보기
	public int deleteReserv(String id); // 예약 삭제
	public int check(String id);
	
	public int modifyresev(ReservDto rto); // 정보 수정
	
	public int reservcheck(String id);
}
