package stm.func;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;

public class InStkDTO {
	private String inv_in_code;
	private String item_code;
	private String item_name;
	private String job_charger;
	private Date inv_in_date;
	private Date made_date;
	private int in_price;
	private int in_amount;
	
	
	public InStkDTO() {
	}

	public InStkDTO(String inv_in_code, String item_code, String item_name, String job_charger,
			Date inv_in_date, Date made_date, int in_price, int in_amount) {
		super();
		this.inv_in_code = inv_in_code;
		this.item_code = item_code;
		this.item_name = item_name;
		this.job_charger = job_charger;
		this.inv_in_date = inv_in_date;
		this.made_date = made_date;
		this.in_price = in_price;
		this.in_amount = in_amount;
	}


	public String getInv_in_code() {
		return inv_in_code;
	}

	public void setInv_in_code(String inv_in_code) {
		this.inv_in_code = inv_in_code;
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
	public Date getInv_in_date1() {
		return inv_in_date;
	}

	public void setInv_in_date1(Date inv_in_date) {
		this.inv_in_date = inv_in_date;
	}


	public String getInv_in_date() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		return formatter.format(inv_in_date);
	}

	public void setInv_in_date(String inv_in_date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		try {
			this.inv_in_date = formatter.parse(inv_in_date);
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
	
	public int getIn_price() {
		return in_price;
	}

	public void setIn_price(int in_price) {
		this.in_price = in_price;
	}

	public int getIn_amount() {
		return in_amount;
	}

	public void setIn_amount(int in_amount) {
		this.in_amount = in_amount;
	}


	@Override
	public int hashCode() {
		return Objects.hash(in_amount, inv_in_code, inv_in_date, item_code, item_name, job_charger, made_date, in_price);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InStkDTO other = (InStkDTO) obj;
		return in_amount == other.in_amount && Objects.equals(inv_in_code, other.inv_in_code)
				&& Objects.equals(inv_in_date, other.inv_in_date) && Objects.equals(item_code, other.item_code)
				&& Objects.equals(item_name, other.item_name) && Objects.equals(job_charger, other.job_charger)
				&& Objects.equals(made_date, other.made_date) && in_price == other.in_price;
	}

	@Override
	public String toString() {
		return "InStkDTO [inv_in_code=" + inv_in_code + ", item_code=" + item_code + ", item_name=" + item_name
				+ ", job_charger=" + job_charger + ", inv_in_date=" + inv_in_date + ", made_date=" + made_date
				+ ", in_price=" + in_price + ", in_amount=" + in_amount + ", tot_in_price="  + "]";
	}

}
