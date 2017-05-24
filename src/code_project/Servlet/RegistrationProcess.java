package code_project.Servlet;

import code_project.DAO.LoginInfoDAO;
import code_project.DAO.Passwords;
import code_project.Info.LoginInfo;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by qpen546 on 23/05/2017.
 */
public class RegistrationProcess extends HttpServlet{
    private MySQL mySQL = new MySQL();
    private String username;
    private String password;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String sessionID = session.getId();

        if (((String) session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
        }

        if(((String) session.getAttribute("status")).equals("login")){
            response.sendRedirect("Content.jsp");
        }else{
            username = request.getParameter("username");
            if(username == null){
                session.setAttribute("RegisterMessage","");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
            }
            password = request.getParameter("password");
            byte[] salt= Passwords.getNextSalt();
            byte[] hashPassword = Passwords.hash(password.toCharArray(),salt,5);
            try {
                LoginInfoDAO.createLoginInfo(mySQL, username, hashPassword, salt);
                LoginInfo loginInfo = LoginInfoDAO.getLoginInfo(mySQL,username);
                out.println("<p>Your username: "+loginInfo.getUsername()+"<br/>Your Password: "+password+"</p>");
                out.println("<a href=\"Login\"><p>Login</p></a>");
            }catch(SQLException e){
                session.setAttribute("RegisterMessage","Username already exist, please pick another one");
                request.getRequestDispatcher("Registration.jsp").forward(request, response);
            }
        }
    }

}
