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
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by qpen546 on 25/05/2017.
 */
public class ChangeUserProfileProcess extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        MySQL DB=new MySQL();

        response.setContentType("text/html");

        if(session.getAttribute("username")==null){
            response.sendRedirect("Login");
        }else if(request.getParameter("profile")==null){

            UserInfo userInfo=UserInfoDAO.getUserInfo(DB,(String)session.getAttribute("username"));
           request.setAttribute("userInfo",userInfo);
            request.getRequestDispatcher("UpdateProfile.jsp").forward(request, response);

        } else if(request.getParameter("profile").equals("update")){

            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String birthday=request.getParameter("birthday");
            String gender=request.getParameter("gender");
            request.removeAttribute("profile");

            try{
                UserInfoDAO.updateUserInfo(DB,(String)session.getAttribute("username"),firstname,lastname,email,birthday,gender);

            }catch(Exception e){
                e.printStackTrace();
            }
            response.sendRedirect("Profile");

        }else if(request.getParameter("profile").equals("delete")){
            try {
               UserInfoDAO.deleteUserInfo(DB,(String)session.getAttribute("articleID"));
            }catch (Exception e){
                e.printStackTrace();
            }
            session.removeAttribute("profile");
            session.removeAttribute("username");
            response.sendRedirect("Login");;
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

}
