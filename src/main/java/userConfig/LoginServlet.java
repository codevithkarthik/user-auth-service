package userConfig;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mobile=req.getParameter("mobile");
		String password=req.getParameter("password");

		boolean userExists=checkUserExists(mobile,password);
		if(userExists) {
			// CREATE SESSION
            HttpSession session = req.getSession(true);
            session.setAttribute("user", mobile);
			resp.sendRedirect("welcome.jsp");
		}else {
			req.setAttribute("error", "Invalid Login Credentials");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

	////checking whether user exists or not with mobile and hash based password
	private boolean checkUserExists(String mobile,String password) {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("app");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		Users user=em.find(Users.class, mobile);

		if(user!=null && BCrypt.checkpw(password, user.getPassword())) {
			return true;
		}
		return false;

	}
}