package stm.func;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Objects;

public class InOutStkDTO {
	private String dist;
	private String inv_code;
	private String item_code;
	private String item_name;
	private String job_charger;
	private String inv_date;
	private String made_date;
	private int price;
	private int amount;
	private String inv_desc;
	private int tot_price;
	
	
	public InOutStkDTO() {
	}

	public InOutStkDTO(String dist, String inv_code, String item_code, String item_name, String job_charger,
			String inv_date, String made_date, int price, int amount, int tot_price, String inv_desc) {
		super();
		this.dist = dist;
		this.inv_code = inv_code;
		this.item_code = item_code;
		this.item_name = item_name;
		this.job_charger = job_charger;
		this.inv_date = inv_date;
		this.made_date = made_date;
		this.price = price;
		this.amount = amount;
		this.tot_price = tot_price;
		this.inv_desc = inv_desc;
	}
	

	
	public int getTot_price() {
		return tot_price;
	}

	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}

	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public String getInv_code() {
		return inv_code;
	}

	public void setInv_code(String inv_code) {
		this.inv_code = inv_code;
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
	public String getInv_date() {
		return inv_date;
	}

	public void setInv_date(String inv_date) {
		this.inv_date = inv_date;
	}


//	public String getInv_date() {
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
//		return formatter.format(inv_date);
//	}

//	public void setInv_date(String inv_date) {
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
//		try {
//			this.inv_date = formatter.parse(inv_date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
	
	public String getMade_date() {
		return made_date;
	}

	public void setMade_date(String made_date) {
		this.made_date = made_date;
	}
	
	 // Define a function to format a number with commas
    public String formatNumberWithCommas(int number) {
        return String.format("%,d", number);
    }
	
		// 자신이 원하는 형태로 출력하기 위해 get에서 데이터타입을 다시 String으로 변경
//	public String getMade_date() {
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
//		return formatter.format(made_date);
//	}
//
//	public void setMade_date(String made_date) {
//		// String -> Date
//		// yyyy-MM-dd
//
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
//		try {
//			this.made_date = formatter.parse(made_date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
///////////////////////// 여기까지 //////////////////////////
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public String getInv_desc() {
		return inv_desc;
	}

	public void setInv_desc(String inv_desc) {
		this.inv_desc = inv_desc;
	}

	@Override
	public int hashCode() {
		return Objects.hash(amount, dist, inv_code, inv_date, inv_desc, item_code, item_name, job_charger, made_date,
				price);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		InOutStkDTO other = (InOutStkDTO) obj;
		return amount == other.amount && Objects.equals(dist, other.dist) && Objects.equals(inv_code, other.inv_code)
				&& Objects.equals(inv_date, other.inv_date) && Objects.equals(inv_desc, other.inv_desc)
				&& Objects.equals(item_code, other.item_code) && Objects.equals(item_name, other.item_name)
				&& Objects.equals(job_charger, other.job_charger) && Objects.equals(made_date, other.made_date)
				&& price == other.price;
	}

	@Override
	public String toString() {
		return "InOutStkDTO [dist=" + dist + ", inv_code=" + inv_code + ", item_code=" + item_code + ", item_name="
				+ item_name + ", job_charger=" + job_charger + ", inv_date=" + inv_date + ", made_date=" + made_date
				+ ", price=" + price + ", amount=" + amount + ", inv_desc=" + inv_desc + "]";
	}



}
