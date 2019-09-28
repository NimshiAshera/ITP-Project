package model;

public class Requests {
	
	int type;
    String name;
    int hotel;
    String date;
    int days;
    int capacity;
    int vehicle;
    int noofvehicle;
    int budget;
    String hall;
    
    public String getHall() {
		return hall;
	}
	public void setHall(String hall) {
		this.hall = hall;
	}
	
	
    public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHotel() {
		return hotel;
	}
	public void setHotel(int hotel) {
		this.hotel = hotel;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getVehicle() {
		return vehicle;
	}
	public void setVehicle(int vehicle) {
		this.vehicle = vehicle;
	}
	public int getNoofvehicle() {
		return noofvehicle;
	}
	public void setNoofvehicle(int noofvehicle) {
		this.noofvehicle = noofvehicle;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	
}
