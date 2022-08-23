package hospital;

import java.util.List;
import java.util.Map;

public interface NoticeDao {
	public int getNcount();
	public int insertNotice(NoticeDataBean nto);
	public List<NoticeDataBean> getNotices(Map<String, Integer> map);
	public NoticeDataBean getNotice(int num);
	public int check(int num, String id);
	public int deleteNotice(int num);
	public void addNcount(int num);
}
