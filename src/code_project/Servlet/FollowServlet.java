package code_project.Servlet;

import code_project.DAO.UserRelationshipDAO;
import code_project.Security.LoginStatus;
import code_project.db.AbstractDB;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by txie936 on 8/06/2017.
 */
public class FollowServlet extends HttpServlet {

    private MySQL mySQL = new MySQL();
    String username;
    String action;
    String followUsername;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        HttpSession session = request.getSession();
        username = (String) session.getAttribute("username");
        action = request.getParameter("action");
        followUsername = request.getParameter("followUsername");
        switch (action) {
            case "checkFollowStatus":
                checkFollowStatus(response);
                break;
            case "follow":
                follow(response);
                break;
            case "unfollow":
                unfollow(response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    private void checkFollowStatus(HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        if (username.equals(followUsername)) {

            response.getWriter().write("user");

        } else if (UserRelationshipDAO.checkFollowStatus(mySQL, username, followUsername)) {
            response.getWriter().write("followed");
        } else {
            response.getWriter().write("unfollowed");
        }
    }

    private void follow(HttpServletResponse response) throws IOException {

        try {
            UserRelationshipDAO.follow(mySQL, username, followUsername);

        } catch (SQLException e) {
            response.sendError(500, "Fail to talk to the database");
        }
    }

    private void unfollow(HttpServletResponse response) throws IOException {

        try {
            UserRelationshipDAO.unfollow(mySQL, username, followUsername);
        } catch (SQLException e) {
            response.sendError(500, "Fail to talk to the database");
        }
    }
}
