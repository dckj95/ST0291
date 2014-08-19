package model;

public class Route {
	
	private String departCity;
	private String departCountry;
	private String arriveCity;
	private String arriveCountry;
	
	private int count;

	public Route(String departCity, String departCountry, String arriveCity,
			String arriveCountry, int count) {
		super();
		this.departCity = departCity;
		this.departCountry = departCountry;
		this.arriveCity = arriveCity;
		this.arriveCountry = arriveCountry;
		this.count = count;
	}

	public String getDepartCity() {
		return departCity;
	}

	public void setDepartCity(String departCity) {
		this.departCity = departCity;
	}

	public String getDepartCountry() {
		return departCountry;
	}

	public void setDepartCountry(String departCountry) {
		this.departCountry = departCountry;
	}

	public String getArriveCity() {
		return arriveCity;
	}

	public void setArriveCity(String arriveCity) {
		this.arriveCity = arriveCity;
	}

	public String getArriveCountry() {
		return arriveCountry;
	}

	public void setArriveCountry(String arriveCountry) {
		this.arriveCountry = arriveCountry;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
