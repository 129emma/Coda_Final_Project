package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.Info.ArticleInfo;
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
public class Article extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
          MySQL DB=new MySQL();
        response.setContentType("text/html");
        if (((String) session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("login")){
            String articleID=request.getParameter("articleID");
            ArticleInfo articleInfo=ArticleInfoDAO.getArticleInfo(DB,(String)session.getAttribute("username"),articleID);
            request.setAttribute("article",articleInfo);
            session.setAttribute("articleID",articleID);
            request.getRequestDispatcher("ArticlePage.jsp").forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }

}
