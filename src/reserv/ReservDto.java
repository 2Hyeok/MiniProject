package reserv;

import java.sql.Timestamp;

public class ReservDto {
	private int re_num;
	private String re_date;
	private String re_time;
	private Timestamp re_reg_date;
	private String re_col;

	private String user_id;
	private String user_name;

	private String dr_id;
	private String dr_major;
	private String dr_name;
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getRe_time() {
		return re_time;
	}
	public void setRe_time(String re_time) {
		this.re_time = re_time;
	}
	public Timestamp getRe_reg_date() {
		return re_reg_date;
	}
	public void setRe_reg_date(Timestamp re_reg_date) {
		this.re_reg_date = re_reg_date;
	}
	public String getRe_col() {
		return re_col;
	}
	public void setRe_col(String re_col) {
		this.re_col = re_col;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDr_id() {
		return dr_id;
	}
	public void setDr_id(String dr_id) {
		this.dr_id = dr_id;
	}
	public String getDr_major() {
		return dr_major;
	}
	public void setDr_major(String dr_major) {
		this.dr_major = dr_major;
	}
	public String getDr_name() {
		return dr_name;
	}
	public void setDr_name(String dr_name) {
		this.dr_name = dr_name;
	}
	
}