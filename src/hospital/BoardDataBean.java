package hospital;

import java.sql.Timestamp;

public class BoardDataBean {
	private int b_no;
	private String b_title;
	private String b_write;
	private Timestamp b_reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String fk_user_id1;
	private String fk_dr_id1;
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_write() {
		return b_write;
	}
	public void setB_write(String b_write) {
		this.b_write = b_write;
	}
	public Timestamp getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(Timestamp b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getFk_user_id1() {
		return fk_user_id1;
	}
	public void setFk_user_id1(String fk_user_id1) {
		this.fk_user_id1 = fk_user_id1;
	}
	public String getFk_dr_id1() {
		return fk_dr_id1;
	}
	public void setFk_dr_id1(String fk_dr_id1) {
		this.fk_dr_id1 = fk_dr_id1;
	}
}
