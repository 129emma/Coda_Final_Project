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
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by qpen546 on 23/05/2017.
 */
public class LoginServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private HttpSession session;
    private String status;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        session = request.getSession(true);
        if ((status = (String) session.getAttribute("status")) == null) status = "";

        String action;
        if ((action = request.getParameter("action")) == null) action = "";

        switch (action) {
            case "login":
                loginProcess(request, response);
                break;
            case "logout":
                logoutProcess(request, response);
                break;
            case "register":
                registerProcess(request, response);
                break;
            default:
                request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
        }
    }

    private void registerProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        switch (status) {
            case "login":
                response.sendRedirect("Blog");
                break;
            default:
                String username = request.getParameter("username");
                if (username == null) {
                    request.getRequestDispatcher("Pages/RegisterPage/Register.jsp").forward(request, response);
                    return;
                }

                String password = request.getParameter("password");
                byte[] salt = Passwords.getNextSalt();
                byte[] hashPassword = Passwords.hash(password.toCharArray(), salt, 5);
                try {
                    LoginInfoDAO.createLoginInfo(mySQL, username, hashPassword, salt, "Pages/AvatarEditPage/DefaultAvatar/pig.png");
                    request.setAttribute("message", "Success to create account");
                    request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
                } catch (SQLException e) {
                    request.setAttribute("message", "Username already exist, please pick another one");
                    request.getRequestDispatcher("Pages/RegisterPage/Register.jsp").forward(request, response);
                }
                break;
        }
    }

    private void logoutProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (status) {
            case "logout":
                request.setAttribute("message", "You already logout!");
                break;
            case "login":
                session.setAttribute("status", "logout");
                session.removeAttribute("username");
                request.setAttribute("message", "You are success to logout!");
                break;
            default:
                session.setAttribute("status", "logout");
                request.setAttribute("message", "You didn't login yet!");
                break;
        }
        request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
    }

    private void loginProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        switch (status) {
            case "login":
                response.sendRedirect("Blog?page=home");
                break;
            default:
                String username = request.getParameter("username");

                if(username== null){
                    request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
                    return;
                }

                String password = request.getParameter("password");

                LoginInfo loginInfo = LoginInfoDAO.getLoginInfo(mySQL, username);

                if (loginInfo == null) {
                    request.setAttribute("message", "Fail to login: username not exist");
                    request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
                    return;
                }

                if (Passwords.isExpectedPassword(password.toCharArray(), loginInfo.getSalt(), 5, loginInfo.getPassword())) {
                    session.setAttribute("status", "login");
                    session.setAttribute("username", username);
                    response.sendRedirect("Blog?page=home");
                } else {
                    request.setAttribute("message", "Fail to login: wrong password");
                    request.getRequestDispatcher("Pages/LoginPage/Login.jsp").forward(request, response);
                }
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

}
