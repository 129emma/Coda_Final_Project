package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.UserInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by txie936 on 29/05/2017.
 */
public class UserProfileServlet extends HttpServlet {
       private MySQL DB=new MySQL();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
       String action=request.getParameter("profileAction");
         if(action==null){
           getUserProfile(request,response,session);
           }else {
             switch (action){
                 case "Update":
                     updateUserProfile(request,response,session);
                     break;
                 case "Delete":
                     deleteUserProfile(response,session);


             }
         }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }



private void getUserProfile(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException, ServletException {

    UserInfo userProfile= UserInfoDAO.getUserInfo(DB,(String)session.getAttribute("username"));
    List<String> iconList=AvatarEditServlet.iconList();
    request.setAttribute("iconList",iconList);
    request.setAttribute("userProfile",userProfile);
    request.getRequestDispatcher("Pages/UserProfilePage/EditProfilePage.jsp").forward(request, response);

}

    private void updateUserProfile(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException, ServletException{

        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String email=request.getParameter("email");
        String birthday=request.getParameter("birthday");
        String gender=request.getParameter("gender");

        try{
            UserInfoDAO.updateUserInfo(DB,(String)session.getAttribute("username"),firstname,lastname,email,birthday,gender);
        }catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("Profile");

    }

    private void deleteUserProfile( HttpServletResponse response,HttpSession session) throws IOException, ServletException{

        try {
            String username=(String)session.getAttribute("username");
            UserInfoDAO.deleteUserInfo(DB,username);
            ServletContext servletContext = getServletContext();
            String userFile = servletContext.getRealPath("/User-Info/" + username );
            File file = new File(userFile );
            deleteUserFile(file);
        }catch (Exception e){
            e.printStackTrace();
        }
        session.removeAttribute("profile");
        session.removeAttribute("username");
        session.setAttribute("status","logout");
        response.sendRedirect("Login");
    }


    private   void deleteUserFile(File myFile){
        if(myFile.exists()){
            File[] files = myFile.listFiles();
            if(null!=files){
                for(int i=0; i<files.length; i++) {
                    if(files[i].isDirectory()) {
                        deleteUserFile(files[i]);
                    }
                    else {
                        files[i].delete();
                    }
                }
            }
        }
        myFile.delete();
    }
}
