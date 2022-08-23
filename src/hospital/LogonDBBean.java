package hospital;

import java.util.List;

import mybatis.SqlMapClient;

public class LogonDBBean implements LogonDao {
	
	// 회원가입
	public int insertUser(LogonDataBean dto) {
		return SqlMapClient.getSession().insert("Hospital.insertUser", dto);
			
	}
	
	// 아이디 중복 체크
	public int check(String id) {
		return SqlMapClient.getSession().selectOne("Hospital.checkId", id);
	}
	
	// 로그인부분
	public int check(String id, String passwd) {
		int result = 0;
		int count = check(id);
		if(count == 1) {
			LogonDataBean dto = getUser(id);
			if(dto.getUser_passwd().equals(passwd)) {
				result = 1;
			} else {
				result = 0;
			}
		} else {
			result = -1;
		}
		return result;
	}
	
	public LogonDataBean getUser(String id) {
		return SqlMapClient.getSession().selectOne("Hospital.getUser",id);
	}
	
	// 정보변경
	public int modifyUser(LogonDataBean dto) {
		return SqlMapClient.getSession().update("Hospital.modifyUser",dto);
	}
	
	// 회원 탈퇴
	public int deleteUser(String id) {
		return SqlMapClient.getSession().delete("Hospital.deleteUser", id);
	}
	
	public List<LogonDataBean> selectAlluser() {
		return SqlMapClient.getSession().selectList("Hospital.userlist");
	}
}
