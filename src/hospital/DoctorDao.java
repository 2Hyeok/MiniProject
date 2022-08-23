package hospital;

import java.util.List;

public interface DoctorDao {
	public int drcheck(String id);
	public int drcheck(String id, String passwd);
	public DoctorDataBean getDoctor(String id);
	
	public List<DoctorDataBean> selectAlldoctor();
}
