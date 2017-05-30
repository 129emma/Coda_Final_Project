package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.CommentInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.CommentInfoList;
import code_project.Info.UserInfo;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by qpen546 on 25/05/2017.
 */
public class BlogServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);

        response.setContentType("text/html");
        if ((session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if((session.getAttribute("status")) .equals("logout")){

            session.setAttribute("logoutMessage","You already logout!");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("login")){
            MySQL mySQL=new MySQL();
            List<ArticleInfo> articleInfoList= ArticleInfoDAO.getArticleInfoList(mySQL,(String)session.getAttribute("username"));
           // Map<Integer,CommentInfoList> commentInfoListOFAllArticle = CommentInfoDAO.getCommentInfoListOfAllArticle(mySQL,articleInfoList);

        }else if((session.getAttribute("status")) .equals("login")){

            MySQL DB=new MySQL();


            List<ArticleInfo> articleInfoList= ArticleInfoDAO.getArticleInfoList(DB,(String)session.getAttribute("username"));

            UserInfo userProfile= UserInfoDAO.getUserInfo(DB,(String)session.getAttribute("username"));

            request.setAttribute("userProfile",userProfile);

            request.setAttribute("articleList",articleInfoList);
//            request.setAttribute("commentInfoListOFAllArticle",commentInfoListOFAllArticle);

            request.getRequestDispatcher("Blog.jsp").forward(request, response);


        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
}