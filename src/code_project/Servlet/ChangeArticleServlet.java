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

/**
 * Created by txie936 on 25/05/2017.
 */
public class ChangeArticleServlet extends HttpServlet{
    MySQL mySQL =new MySQL();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);


        response.setContentType("text/html");

         if(session.getAttribute("username")==null){

             request.getRequestDispatcher("Login").forward(request,response);

         }else if(request.getParameter("create")!=null){

             createArticle(request,response,session);

         }else if(request.getParameter("articleChange")!=null) {

             goToArticleChangePage(request,response,session);

         }else if(request.getParameter("action").equals("update")){


            updateArticle(request,response,session);

         }else if(request.getParameter("action").equals("delete")){
            deleteArticle(request,response,session);
         }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
private void createArticle(HttpServletRequest request,HttpServletResponse response,HttpSession session) {

    String title=request.getParameter("title");
    String content=request.getParameter("content");
    String tag=request.getParameter("tag");
    request.removeAttribute("create");

    try {
        ArticleInfoDAO.createArticleInfo(mySQL,title,content,ArticleInfoDAO.getCurrentTimeStamp(),tag,(String)session.getAttribute("username"));
        response.sendRedirect("Blog");
    }catch (Exception e){
        e.printStackTrace();
    }
}

    private void goToArticleChangePage(HttpServletRequest request,HttpServletResponse response,HttpSession session) {

        String articleID=request.getParameter("articleID");
        ArticleInfo articleInfo=ArticleInfoDAO.getArticleInfo(mySQL,(String)session.getAttribute("username"),articleID);
        request.setAttribute("article",articleInfo);
        request.removeAttribute("articleChange");
        try {
            request.getRequestDispatcher("ArticleChange.jsp").forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    private void updateArticle(HttpServletRequest request,HttpServletResponse response,HttpSession session) {

        String title=request.getParameter("title");
        String content=request.getParameter("content");
        String tag=request.getParameter("tag");
        request.removeAttribute("action");
        try{
            ArticleInfoDAO.updateArticleInfo(mySQL,request.getParameter("articleID"),content,title,ArticleInfoDAO.getCurrentTimeStamp(),tag,(String)session.getAttribute("username"));
            response.sendRedirect("Blog");;
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    private void deleteArticle(HttpServletRequest request,HttpServletResponse response,HttpSession session) {

        try {
            ArticleInfoDAO.deleteArticleInfo(mySQL,(String)session.getAttribute("username"),request.getParameter("articleID"));
            session.removeAttribute("action");
            response.sendRedirect("Blog");;
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    }
