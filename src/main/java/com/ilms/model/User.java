package com.ilms.model;

public class User 
{
  private int uid=0;
  private String userName="";
  private String emailAddress="";
  private String mobileNumber="";
  private String role="";
  private int credits=0;
  private String postalAddress="";
  private String password="";
  
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getPostalAddress() {
	return postalAddress;
}
public void setPostalAddress(String postalAddress) {
	this.postalAddress = postalAddress;
}
public int getUid() {
	return this.uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmailAddress() {
	return emailAddress;
}
public void setEmailAddress(String emailAddress) {
	this.emailAddress = emailAddress;
}
public String getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(String mobileNumber) {
	this.mobileNumber = mobileNumber;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public int getCredits() {
	return credits;
}
public void setCredits(int credits) {
	this.credits = credits;
}
  
}
