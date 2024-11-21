package llb.eboutique.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import llb.eboutique.model.User;

public class UserDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public User userLogin(String email, String password) {
		User user = null;
		
		try {
			query = "select * from utilisateur where password=? and email=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, password);
			pst.setString(2, email);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
			}else {
                System.out.println("Aucun utilisateur trouvé");
            }
		}catch (Exception e) {
			//TODO M handle exception
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return user;
	}

}
