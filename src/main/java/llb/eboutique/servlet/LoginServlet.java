package llb.eboutique.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import llb.eboutique.connexion.DbConnexion;
import llb.eboutique.dao.UserDao;
import llb.eboutique.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			try {
				 UserDao udao = new UserDao(DbConnexion.getConnection());
				 User user = udao.userLogin(email, password);
				 
				 if(user!= null) {
					 //out.print("utilisateur connecté");
					 request.getSession().setAttribute("auth", user);
					 response.sendRedirect("index.jsp");
				 }else {
					 out.print("echec du login");
				 }
					 
			
			} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			//out.print(email+password);
		}
	}

}
