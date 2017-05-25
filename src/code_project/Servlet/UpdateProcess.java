package code_project.Servlet;

import code_project.DAO.LoginInfoDAO;
import code_project.Security.Passwords;
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
 * Created by pqsky on 2017/5/23.
 */
public class UpdateProcess extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private String username;
    private String password;
    private String newPassword;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private LoginInfo loginInfo;
    private HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        session = request.getSession(true);
        this.request = request;
        this.response = response;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String status = (String) session.getAttribute("status");
        if (status == null) {
            forwardWithMessage("status","Login", "logout");
        }

        if (status.equals("logout")) {
            response.sendRedirect("login");
        } else {
            username = request.getParameter("username");
            password = request.getParameter("password");
            newPassword = request.getParameter("newPassword");
            if (username == null) {
                session.setAttribute("updateMessage", "");
                request.getRequestDispatcher("Update.jsp").forward(request, response);
            }
            loginInfo = LoginInfoDAO.getLoginInfo(mySQL, username);
            if (loginInfo == null || !rightUsername()) {
                forwardWithMessage("updateMessage","Update.jsp","Fail to update: wrong username");
            }else if (rightPassword()) {
                updatePassword();
                forwardWithMessage("updateMessage","Update.jsp","You are successful to change the password!");
            } else {
                forwardWithMessage("updateMessage","Update.jsp","Fail to update: wrong password");
            }
        }
    }

    public void forwardWithMessage(String attribute,String dispatcher,String message) throws ServletException, IOException {
        session.setAttribute(attribute, message);
        request.getRequestDispatcher(dispatcher).forward(request, response);
    }

    public boolean rightUsername() {
        return username.equals(session.getAttribute("username"));
    }

    public boolean rightPassword() {
        return Passwords.isExpectedPassword(password.toCharArray(), loginInfo.getSalt(), 5, loginInfo.getPassword());
    }

    public void updatePassword() throws ServletException, IOException {
        byte[] newSalt = Passwords.getNextSalt();
        byte[] newHashPassword = Passwords.hash(newPassword.toCharArray(), newSalt, 5);
        try {
            LoginInfoDAO.updateLoginInfo(mySQL, username, newHashPassword, newSalt);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}


