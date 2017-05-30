package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.UserInfo;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by txie936 on 29/05/2017.
 */
public class UserProfileServlet extends HttpServlet {
       private MySQL DB=new MySQL();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        if ((session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if((session.getAttribute("status")) .equals("logout")){
            session.setAttribute("logoutMessage","You already logout!");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if((session.getAttribute("status")) .equals("login")){

            getUserProfile(request,response,session);

        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }



private void getUserProfile(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException, ServletException {

    UserInfo userProfile= UserInfoDAO.getUserInfo(DB,(String)session.getAttribute("username"));
    request.setAttribute("userProfile",userProfile);
    request.getRequestDispatcher("userProfile.jsp").forward(request, response);

}
}
