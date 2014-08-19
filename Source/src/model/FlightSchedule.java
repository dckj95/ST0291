package model;

public class FlightSchedule {
	
	private int fsID;
	private int aircraftID;
	
	private String depart;
	private String departCode;
	private String departCity;
	private String departCountry;
	private String departDate;
	private String departTime;
	private String arrive;
	private String arriveCode;
	private String arriveCity;
	private String arriveCountry;
	private String arriveDate;
	private String arriveTime;
	private double economyCost;
	private double businessCost;
	private double firstCost;
	private String flightTime;
	
	private String model;
	private String flightNum;
	private int economyCap;
	private int businessCap;
	private int firstCap;
	private int totalCap;
	private String economyImage;
	private String businessImage;
	private String firstImage;
	
	public FlightSchedule(int fsID, int aircraftID, String depart,
			String departCode, String departCity, String departCountry,
			String departDate, String departTime, String arrive,
			String arriveCode, String arriveCity, String arriveCountry,
			String arriveDate, String arriveTime, double economyCost,
			double businessCost, double firstCost, String flightTime,
			String model, String flightNum, int economyCap, int businessCap,
			int firstCap, int totalCap, String economyImage,
			String businessImage, String firstImage) {
		super();
		this.fsID = fsID;
		this.aircraftID = aircraftID;
		this.depart = depart;
		this.departCode = departCode;
		this.departCity = departCity;
		this.departCountry = departCountry;
		this.departDate = departDate;
		this.departTime = departTime;
		this.arrive = arrive;
		this.arriveCode = arriveCode;
		this.arriveCity = arriveCity;
		this.arriveCountry = arriveCountry;
		this.arriveDate = arriveDate;
		this.arriveTime = arriveTime;
		this.economyCost = economyCost;
		this.businessCost = businessCost;
		this.firstCost = firstCost;
		this.flightTime = flightTime;
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

	public int getFsID() {
		return fsID;
	}

	public void setFsID(int fsID) {
		this.fsID = fsID;
	}

	public int getAircraftID() {
		return aircraftID;
	}

	public void setAircraftID(int aircraftID) {
		this.aircraftID = aircraftID;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getDepartCode() {
		return departCode;
	}

	public void setDepartCode(String departCode) {
		this.departCode = departCode;
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

	public String getDepartDate() {
		return departDate;
	}

	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}

	public String getDepartTime() {
		return departTime;
	}

	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}

	public String getArrive() {
		return arrive;
	}

	public void setArrive(String arrive) {
		this.arrive = arrive;
	}

	public String getArriveCode() {
		return arriveCode;
	}

	public void setArriveCode(String arriveCode) {
		this.arriveCode = arriveCode;
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

	public String getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}

	public String getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}

	public double getEconomyCost() {
		return economyCost;
	}

	public void setEconomyCost(double economyCost) {
		this.economyCost = economyCost;
	}

	public double getBusinessCost() {
		return businessCost;
	}

	public void setBusinessCost(double businessCost) {
		this.businessCost = businessCost;
	}

	public double getFirstCost() {
		return firstCost;
	}

	public void setFirstCost(double firstCost) {
		this.firstCost = firstCost;
	}

	public String getFlightTime() {
		return flightTime;
	}

	public void setFlightTime(String flightTime) {
		this.flightTime = flightTime;
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
