package dao;

import java.util.ArrayList;

import model.OwnerK;

public interface Iowner {

	public static final OwnerK ownerK = OwnerK.getOwnerK(Iowner.class.getName());
	
	public void addCustomer(OwnerK customer);
	
	public OwnerK getCustomerByName(String username);
	
	public ArrayList<OwnerK> addCustomer();
	
	public OwnerK updateDriver(String userName, OwnerK ownerK);
	
	public void removeCustomer(String userName);
	
}
