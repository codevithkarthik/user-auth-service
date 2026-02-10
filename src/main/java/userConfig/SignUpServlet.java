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
import org.mindrot.jbcrypt.BCrypt;


@WebServlet("/signup")
public class SignUpServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username=req.getParameter("username");
		String mobile=req.getParameter("mobile");
		String password=req.getParameter("password");
		String hashedpassword=BCrypt.hashpw(password, BCrypt.gensalt());

		//mobile number validation
		if(mobile==null || mobile.length()!=10) {
			req.setAttribute("error", "Mobile number Must be 10 digits");
			req.getRequestDispatcher("index.jsp").forward(req, resp);
			return;
		}
		if (!mobile.matches("\\d{10}")) {
		    req.setAttribute("error", "Invalid mobile number");
		    req.getRequestDispatcher("index.jsp").forward(req, resp);
		    return;
		}


		boolean userExists=checkUserExists(mobile);
		if(userExists) {
			req.setAttribute("error","Mobile number already registered. Please login.");
	        req.getRequestDispatcher("index.jsp").forward(req, resp);
		}else {
			saveUser(username,mobile,hashedpassword);
			req.setAttribute("username", username);
			req.getRequestDispatcher("welcome.jsp").forward(req, resp);
		}
	}

	//checking whether user exists or not, if yes back to index.jsp with message
	private boolean checkUserExists(String mobile) {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("app");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		Users user=em.find(Users.class, mobile);
		if(user!=null) {
			return true;
		}
		return false;
	}

	//if not create a user record in db
	private void saveUser(String username, String mobile, String hashedpassword) {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("app");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		Users user=new Users(username,mobile,hashedpassword);
		em.persist(user);
		et.commit();
	}
}