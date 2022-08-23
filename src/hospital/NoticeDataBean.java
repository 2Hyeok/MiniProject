package hospital;

import java.sql.Timestamp;

public class NoticeDataBean {
	private int not_no;
	private String not_title;
	private String not_write;
	private Timestamp not_reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String fk_dr_id2;

	public int getNot_no() {
		return not_no;
	}

	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}

	public String getNot_title() {
		return not_title;
	}

	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}

	public String getNot_write() {
		return not_write;
	}

	public void setNot_write(String not_write) {
		this.not_write = not_write;
	}

	public Timestamp getNot_reg_date() {
		return not_reg_date;
	}

	public void setNot_reg_date(Timestamp not_reg_date) {
		this.not_reg_date = not_reg_date;
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

	public String getFk_dr_id2() {
		return fk_dr_id2;
	}

	public void setFk_dr_id2(String fk_dr_id2) {
		this.fk_dr_id2 = fk_dr_id2;
	}
}