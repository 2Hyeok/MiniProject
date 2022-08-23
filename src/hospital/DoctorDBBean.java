package hospital;

import java.util.List;

import mybatis.SqlMapClient;

public class DoctorDBBean implements DoctorDao {
	
	public int drcheck(String id) {
		return SqlMapClient.getSession().selectOne("Hospital.drId", id);
	}
	
	public int drcheck(String id, String passwd) {
		int result = 0;
		int count = drcheck(id);
		if(count == 1) {
			DoctorDataBean ato = getDoctor(id);
			if(ato.getDr_passwd().equals(passwd)) {
				result = 1;
			} else {
				result = 0;
			}
		} else {
			result = -1;
		}
		return result;
	}
	
	public DoctorDataBean getDoctor(String id) {
		return SqlMapClient.getSession().selectOne("Hospital.getDoctor", id);
	}
	
	public List<DoctorDataBean> selectAlldoctor() {
		return SqlMapClient.getSession().selectList("Hospital.doctorlist");
	}
}
