package model;

public class Booking {
	
	private int bookingID;
	private int fsID;
	private int paymentID;
	private String custTitle;
	private String custFirstName;
	private String custLastName;
	private String custEmail;
	private String custPhone;
	private int economy;
	private int business;
	private int first;
	private int child;
	
	private String depart;
	private String departCode;
	private String departCity;
	private String departCountry;
	private String arrive;
	private String arriveCode;
	private String arriveCity;
	private String arriveCountry;
	private double economyCost;
	private double businessCost;
	private double firstCost;
	
	private String cardType;
	private String cardNo;
	private String cardExpiry;
	
	public Booking(int bookingID, int fsID, int paymentID, String custTitle,
			String custFirstName, String custLastName, String custEmail,
			String custPhone, int economy, int business, int first, int child,
			String depart, String departCode, String departCity,
			String departCountry, String arrive, String arriveCode,
			String arriveCity, String arriveCountry, double economyCost,
			double businessCost, double firstCost, String cardType, String cardNo,
			String cardExpiry) {
		super();
		this.bookingID = bookingID;
		this.fsID = fsID;
		this.paymentID = paymentID;
		this.custTitle = custTitle;
		this.custFirstName = custFirstName;
		this.custLastName = custLastName;
		this.custEmail = custEmail;
		this.custPhone = custPhone;
		this.economy = economy;
		this.business = business;
		this.first = first;
		this.child = child;
		this.depart = depart;
		this.departCode = departCode;
		this.departCity = departCity;
		this.departCountry = departCountry;
		this.arrive = arrive;
		this.arriveCode = arriveCode;
		this.arriveCity = arriveCity;
		this.arriveCountry = arriveCountry;
		this.economyCost = economyCost;
		this.businessCost = businessCost;
		this.firstCost = firstCost;
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.cardExpiry = cardExpiry;
	}

	public int getBookingID() {
		return bookingID;
	}

	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}

	public int getFsID() {
		return fsID;
	}

	public void setFsID(int fsID) {
		this.fsID = fsID;
	}

	public int getPaymentID() {
		return paymentID;
	}

	public void setPaymentID(int paymentID) {
		this.paymentID = paymentID;
	}

	public String getCustTitle() {
		return custTitle;
	}

	public void setCustTitle(String custTitle) {
		this.custTitle = custTitle;
	}

	public String getCustFirstName() {
		return custFirstName;
	}

	public void setCustFirstName(String custFirstName) {
		this.custFirstName = custFirstName;
	}

	public String getCustLastName() {
		return custLastName;
	}

	public void setCustLastName(String custLastName) {
		this.custLastName = custLastName;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public int getEconomy() {
		return economy;
	}

	public void setEconomy(int economy) {
		this.economy = economy;
	}

	public int getBusiness() {
		return business;
	}

	public void setBusiness(int business) {
		this.business = business;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
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

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardExpiry() {
		return cardExpiry;
	}

	public void setCardExpiry(String cardExpiry) {
		this.cardExpiry = cardExpiry;
	}
	
}
