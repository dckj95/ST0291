package model;

public class Aircraft {
	
	private int aircraftID;
	private String model;
	private String flightNum;
	private int economyCap;
	private int businessCap;
	private int firstCap;
	private int totalCap;
	private String economyImage;
	private String businessImage;
	private String firstImage;
	
	public Aircraft(int aircraftID, String model, String flightNum,
			int economyCap, int businessCap, int firstCap, int totalCap,
			String economyImage, String businessImage, String firstImage) {
		super();
		this.aircraftID = aircraftID;
		this.model = model;
		this.flightNum = flightNum;
		this.economyCap = economyCap;
		this.businessCap = businessCap;
		this.firstCap = firstCap;
		this.totalCap = totalCap;
		this.economyImage = economyImage;
		this.businessImage = businessImage;
		this.firstImage = firstImage;
	}

	public int getAircraftID() {
		return aircraftID;
	}

	public void setAircraftID(int aircraftID) {
		this.aircraftID = aircraftID;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getFlightNum() {
		return flightNum;
	}

	public void setFlightNum(String flightNum) {
		this.flightNum = flightNum;
	}

	public int getEconomyCap() {
		return economyCap;
	}

	public void setEconomyCap(int economyCap) {
		this.economyCap = economyCap;
	}

	public int getBusinessCap() {
		return businessCap;
	}

	public void setBusinessCap(int businessCap) {
		this.businessCap = businessCap;
	}

	public int getFirstCap() {
		return firstCap;
	}

	public void setFirstCap(int firstCap) {
		this.firstCap = firstCap;
	}

	public int getTotalCap() {
		return totalCap;
	}

	public void setTotalCap(int totalCap) {
		this.totalCap = totalCap;
	}

	public String getEconomyImage() {
		return economyImage;
	}

	public void setEconomyImage(String economyImage) {
		this.economyImage = economyImage;
	}

	public String getBusinessImage() {
		return businessImage;
	}

	public void setBusinessImage(String businessImage) {
		this.businessImage = businessImage;
	}

	public String getFirstImage() {
		return firstImage;
	}

	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}

}
