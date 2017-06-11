package code_project.Servlet;

import code_project.DAO.UserInfoDAO;
import code_project.DAO.FollowInfoDAO;
import code_project.Info.UserInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
            case "getFollowInfo":
              getFollows(request,response);
              getFollowers(request,response);
                request.getRequestDispatcher("Pages/FollowAndFollowerPage/FollowAndFollower.jsp").forward(request,response);
                break;
//            case "getFollowers":
//           getFollowers(request,response);
//                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    private void checkFollowStatus(HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        if (username.equals(followUsername)) {

            response.getWriter().write("user");

        } else if (FollowInfoDAO.checkFollowStatus(mySQL, username, followUsername)) {
            response.getWriter().write("followed");
        } else {
            response.getWriter().write("unfollowed");
        }
    }

    private void follow(HttpServletResponse response) throws IOException {

        try {
            FollowInfoDAO.follow(mySQL, username, followUsername);

        } catch (SQLException e) {
            response.sendError(500, "Fail to talk to the database");
        }
    }


    private void unfollow(HttpServletResponse response) throws IOException {

        try {
            FollowInfoDAO.unfollow(mySQL, username, followUsername);
        } catch (SQLException e) {
            response.sendError(500, "Fail to talk to the database");
        }
    }

    private void getFollows(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
            try {
                List<String> followsNameList= FollowInfoDAO.getFollows(mySQL,username);
                List<UserInfo> followsList= UserInfoDAO.getUsersList(mySQL,followsNameList);
                request.setAttribute("followsList",followsList);
                request.setAttribute("followsNumber",followsList.size());

            }catch (SQLException e){
                e.printStackTrace();
            }
    }
    private void getFollowers(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        try {
            List<String> followersNameList= FollowInfoDAO.getFollowers(mySQL,username);
            List<UserInfo> followersList= UserInfoDAO.getUsersList(mySQL,followersNameList);
            request.setAttribute("followersList",followersList);
            request.setAttribute("followersNumber",followersList.size());
        }catch (SQLException e){
           e.printStackTrace();
        }
    }
}
