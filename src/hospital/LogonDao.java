package hospital;

import java.util.List;

public interface LogonDao {
	public int insertUser(LogonDataBean dto); // 회원가입
	public int check(String id); // 아이디 중복 체크
	public int check(String id, String passwd); // 로그인 아이디 비밀번호
	public LogonDataBean getUser(String id); // 아이디 체크
	public int modifyUser(LogonDataBean dto); // 정보변경
	public int deleteUser(String id); // 회원 탈퇴
	
	public List<LogonDataBean> selectAlluser();
}
