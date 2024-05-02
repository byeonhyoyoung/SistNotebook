package spring.mvc.shop;

public class ShopDto {

	private String sang; //form name과 같게해줘야함
	private int price;
	private String color;
	private String guipday;
	
	
	public String getSang() {
		return sang;
	}
	public void setSang(String sang) {
		this.sang = sang;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getGuipday() {
		return guipday;
	}
	public void setGuipday(String guipday) {
		this.guipday = guipday;
	}
	
	
}
