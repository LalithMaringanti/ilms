package com.ilms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.ilms.model.User;

public class ApplicationDAO 
{
    private Connection con=null;	
    private String dbClassString = "com.mysql.cj.jdbc.Driver";
    private ResultSet rs=null;
  public ApplicationDAO() throws SQLException, ClassNotFoundException
  {
	  Class.forName(dbClassString); 
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarymanagementsystem","root","lalith");
  }
  
  public User getUserByEmailAndPassword(String email,String password) throws SQLException
  {
	  User loginUser = new User();
	    PreparedStatement pstmt;
	   
	try 
	{
		pstmt = con.prepareStatement("select * from user where (email_id=?) and (user_password=?)");
		pstmt.setString(1,email);
	    pstmt.setString(2,password);
	    rs = pstmt.executeQuery();
	    if(rs.next())
	    {
	    	loginUser.setUid(rs.getInt("user_id"));
	    	loginUser.setUserName(rs.getString("user_name"));
	    	loginUser.setEmailAddress(rs.getString("email_id"));
	    	loginUser.setCredits(rs.getInt("credits"));
	    	loginUser.setMobileNumber(rs.getString("contact_number"));
	    	loginUser.setPostalAddress(rs.getString("postal_address"));
	    	loginUser.setRole(rs.getString("use_role"));
	    }
	    else
	    {
	    	loginUser = null ;
	    }
	    pstmt.close();
	}
	catch (SQLException e) 
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally
	{
		if(rs!=null)
			 rs.close();
		if(con!=null)
		{
			con.close();
		}
	}
	 return loginUser; 
  }
  
  public int registerUser(User userObject) throws SQLException
  {
	  int result = 0;
	  try
	  {
		  if(!(checkIfUserExistsAlready(userObject)))
		  {
			  String insertUserQuery = "insert into user "+" (user_name,email_id,user_password,use_role,postal_address,contact_number,credits) values "+" (?,?,?,?,?,?,?);"; 
			  PreparedStatement pstmt = con.prepareStatement(insertUserQuery);
			  pstmt.setString(1, userObject.getUserName());
			  pstmt.setString(2, userObject.getEmailAddress());
			  pstmt.setString(3, userObject.getPassword());
			  pstmt.setString(4, userObject.getRole());
			  pstmt.setString(5, userObject.getPostalAddress());
			  pstmt.setString(6, userObject.getMobileNumber());
			  pstmt.setInt(7, 0);
			  int numberOfRowsAffected = pstmt.executeUpdate();
			  if(numberOfRowsAffected==1)
				  result = 1;
			  pstmt.close(); 
		  }
		  else
			  result= -1;
		  
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  finally
	  {
		  if(con!=null)
			{
				con.close();
			}  
	  }
	  return result;
  }
  
  /*
   * The method checkIfUserExistsAlready return true if user already existed and false if user is not existed
   */
  private boolean checkIfUserExistsAlready(User userObject) throws SQLException
  {
	  boolean result = false;
	  PreparedStatement pstmt;
	  try
	  {
		  pstmt = con.prepareStatement("select * from user where (email_id=?) and (contact_number=?)");
			pstmt.setString(1,userObject.getEmailAddress());
		    pstmt.setString(2,userObject.getMobileNumber());
		    rs = pstmt.executeQuery();
		    if(rs.next())
		    {
		    	result = true;
		    }
		    pstmt.close();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return result;
  }
}
