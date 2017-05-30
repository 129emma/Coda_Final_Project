package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.LoginInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Security.Passwords;
import code_project.Info.LoginInfo;
import code_project.db.MySQL;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by qpen546 on 23/05/2017.
 */
public class LoginServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private String username;
    private String password;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);

        if (( session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        if ((session.getAttribute("status")).equals("login")) {
            response.sendRedirect("Blog");
        } else {
            username = request.getParameter("username");
            password = request.getParameter("password");
            if (username == null){
                session.setAttribute("loginMessage", "");
                session.setAttribute("logoutMessage", "");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            LoginInfo loginInfo = LoginInfoDAO.getLoginInfo(mySQL, username);
            if (loginInfo == null){
                session.setAttribute("loginMessage", "Fail to login: wrong username");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            if (Passwords.isExpectedPassword(password.toCharArray(), loginInfo.getSalt(), 5, loginInfo.getPassword())) {
                session.setAttribute("loginMessage", "");
                session.setAttribute("status", "login");
                session.setAttribute("username",username);
                request.getRequestDispatcher("Blog").forward(request, response);
            } else {
                session.setAttribute("loginMessage", "Fail to login: wrong password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

}
