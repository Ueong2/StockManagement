package stm.func;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;

public class OutStkListDTO {
	private String inv_out_code;
	private String item_code;
	private String item_name;
	private String job_charger;
	private Date inv_out_date;
	private Date made_date;
	private int out_price;
	private int out_amount;
	
	
	public OutStkListDTO() {
	}

	public OutStkListDTO(String inv_out_code, String item_code, String item_name, String job_charger,
			Date inv_out_date, Date made_date, int out_price, int out_amount) {
		super();
		this.inv_out_code = inv_out_code;
		this.item_code = item_code;
		this.item_name = item_name;
		this.job_charger = job_charger;
		this.inv_out_date = inv_out_date;
		this.made_date = made_date;
		this.out_price = out_price;
		this.out_amount = out_amount;
	}


	public String getInv_out_code() {
		return inv_out_code;
	}

	public void setInv_out_code(String inv_out_code) {
		this.inv_out_code = inv_out_code;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getJob_charger() {
		return job_charger;
	}

	public void setJob_charger(String job_charger) {
		this.job_charger = job_charger;
	}

	
///////////////////////// 여기서부터 //////////////////////////
	public Date getInv_out_date1() {
		return inv_out_date;
	}

	public void setInv_out_date1(Date inv_out_date) {
		this.inv_out_date = inv_out_date;
	}


	public String getInv_out_date() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		return formatter.format(inv_out_date);
	}

	public void setInv_out_date(String inv_out_date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		try {
			this.inv_out_date = formatter.parse(inv_out_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Date getMade_date1() {
		return made_date;
	}

	public void setMade_date1(Date made_date) {
		this.made_date = made_date;
	}
	
		// 자신이 원하는 형태로 출력하기 위해 get에서 데이터타입을 다시 String으로 변경
	public String getMade_date() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		return formatter.format(made_date);
	}

	public void setMade_date(String made_date) {
		// String -> Date
		// yyyy-MM-dd

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		try {
			this.made_date = formatter.parse(made_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
///////////////////////// 여기까지 //////////////////////////
	
	public int getOut_price() {
		return out_price;
	}

	public void setOut_price(int out_price) {
		this.out_price = out_price;
	}

	public int getOut_amount() {
		return out_amount;
	}

	public void setOut_amount(int out_amount) {
		this.out_amount = out_amount;
	}


	@Override
	public int hashCode() {
		return Objects.hash(out_amount, inv_out_code, inv_out_date, item_code, item_name, job_charger, made_date, out_price);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OutStkListDTO other = (OutStkListDTO) obj;
		return out_amount == other.out_amount && Objects.equals(inv_out_code, other.inv_out_code)
				&& Objects.equals(inv_out_date, other.inv_out_date) && Objects.equals(item_code, other.item_code)
				&& Objects.equals(item_name, other.item_name) && Objects.equals(job_charger, other.job_charger)
				&& Objects.equals(made_date, other.made_date) && out_price == other.out_price;
	}

	@Override
	public String toString() {
		return "OutStkListDTO [inv_out_code=" + inv_out_code + ", item_code=" + item_code + ", item_name=" + item_name
				+ ", job_charger=" + job_charger + ", inv_out_date=" + inv_out_date + ", made_date=" + made_date
				+ ", out_price=" + out_price + ", out_amount=" + out_amount + ", tot_out_price="  + "]";
	}

}
