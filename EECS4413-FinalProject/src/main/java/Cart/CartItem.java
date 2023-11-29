package Cart;

import java.util.Map;

public class CartItem {
    public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getWarranty() {
		return warranty;
	}

	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}

	public String getWheels() {
		return wheels;
	}

	public void setWheels(String wheels) {
		this.wheels = wheels;
	}

	public int getFinalCost() {
		return finalCost;
	}

	public void setFinalCost(int finalCost) {
		this.finalCost = finalCost;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAddOnCost() {
		return addOnCost;
	}

	public void setAddOnCost(int addOnCost) {
		this.addOnCost = addOnCost;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public Map<String, Object> getCarDetails() {
		return carDetails;
	}

	public void setCarDetails(Map<String, Object> carDetails) {
		this.carDetails = carDetails;
	}
	
	public int getID() {
		return id;
	}

	public void setPID(int id) {
		this.id = id;
	}
	
	

	private String color;
    private String warranty;
    private String wheels;
    private int finalCost;
    private int price;
    private int addOnCost;
    private String make;
    private int id;
    private Map<String, Object> carDetails; 

    // Constructor
    public CartItem(int id, String make, int addOnCost, String color, String warranty, String wheels, int finalCost, int price, Map<String, Object> carDetails) {
        this.color = color;
        this.warranty = warranty;
        this.wheels = wheels;
        this.finalCost = finalCost;
        this.price = price;
        this.addOnCost=addOnCost;
        this.carDetails = carDetails;
        this.make=make;
        this.id=id;
    }


}
