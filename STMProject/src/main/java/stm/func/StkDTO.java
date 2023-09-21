package stm.func;

import java.util.Date;
import java.util.Objects;

public class StkDTO {
	private String category;
	private String item_code;
	private String item_name;
	private String manufacturer;
	private int avg_price;
	private int min_stocks;
	private int cur_stocks;
	private String item_desc;
	
	public StkDTO() {
	}

	public StkDTO(String category, String item_code, String item_name, String manufacturer, int avg_price,
			int min_stocks, int cur_stocks, String item_desc) {
		super();
		this.category = category;
		this.item_code = item_code;
		this.item_name = item_name;
		this.manufacturer = manufacturer;
		this.avg_price = avg_price;
		this.min_stocks = min_stocks;
		this.cur_stocks = cur_stocks;
		this.item_desc = item_desc;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getAvg_price() {
		return avg_price;
	}

	public void setAvg_price(int avg_price) {
		this.avg_price = avg_price;
	}

	public int getMout_stocks() {
		return min_stocks;
	}

	public void setMout_stocks(int min_stocks) {
		this.min_stocks = min_stocks;
	}

	public int getCur_stocks() {
		return cur_stocks;
	}

	public void setCur_stocks(int cur_stocks) {
		this.cur_stocks = cur_stocks;
	}

	public String getItem_desc() {
		return item_desc;
	}

	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}

	
	
	@Override
	public int hashCode() {
		return Objects.hash(avg_price, category, cur_stocks, item_code, item_desc, item_name, manufacturer, min_stocks);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StkDTO other = (StkDTO) obj;
		return avg_price == other.avg_price && Objects.equals(category, other.category)
				&& cur_stocks == other.cur_stocks && Objects.equals(item_code, other.item_code)
				&& Objects.equals(item_desc, other.item_desc) && Objects.equals(item_name, other.item_name)
				&& Objects.equals(manufacturer, other.manufacturer) && min_stocks == other.min_stocks;
	}

	@Override
	public String toString() {
		return "StkDTO [category=" + category + ", item_code=" + item_code + ", item_name=" + item_name
				+ ", manufacturer=" + manufacturer + ", avg_price=" + avg_price + ", min_stocks=" + min_stocks
				+ ", cur_stocks=" + cur_stocks + ", item_desc=" + item_desc + "]";
	}

	
	
}
