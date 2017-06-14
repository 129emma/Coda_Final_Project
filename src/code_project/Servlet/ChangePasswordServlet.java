package code_project.Servlet;

import code_project.DAO.LoginInfoDAO;
import code_project.Info.LoginInfo;
import code_project.Security.LoginStatus;
import code_project.Security.Passwords;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;
import java.util.Random;

/**
 * Created by qpen546 on 2017/5/23.
 */
public class ChangePasswordServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private String username;
    private String password;
    private String newPassword;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private LoginInfo loginInfo;
    private HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        session = request.getSession(true);
        this.request = request;
        this.response = response;
        response.setContentType("text/html");
        Writer out = response.getWriter();
        username = (String) session.getAttribute("username");
        password = request.getParameter("password");
        newPassword = request.getParameter("newPassword");

        loginInfo = LoginInfoDAO.getLoginInfo(mySQL, username);
        if (!rightPassword()) {
            out.write("Fail: Wrong Password");
        } else if (rightPassword()){
            updatePassword();
            out.write("success");
        } else {
            out.write("Fail");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public boolean rightPassword() {
        return Passwords.isExpectedPassword(password.toCharArray(), loginInfo.getSalt(), loginInfo.getIterations(), loginInfo.getPassword());
    }

    public void updatePassword() throws ServletException, IOException {
        byte[] newSalt = Passwords.getNextSalt();
        int newIterations = new Random().nextInt(1000) + 100_000;
        byte[] newHashPassword = Passwords.hash(newPassword.toCharArray(), newSalt, newIterations);
        try {
            LoginInfoDAO.updateLoginInfo(mySQL, username, newHashPassword, newSalt, newIterations);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}


