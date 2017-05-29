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
import java.sql.Date;

/**
 * Created by txie936 on 25/05/2017.
 */
public class ChangeArticleProcess extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        MySQL DB = new MySQL();

        response.setContentType("text/html");

        if (session.getAttribute("username") == null) {

            request.getRequestDispatcher("Login").forward(request, response);

        } else if (request.getParameter("create") != null) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String tag = request.getParameter("tag");
            try {
                ArticleInfoDAO.createArticleInfo(DB, (String) session.getAttribute("articleID"), title, content, ArticleInfoDAO.getCurrentTimeStamp(), tag, (String) session.getAttribute("username"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.removeAttribute("articleID");
            request.removeAttribute("create");
            response.sendRedirect("Blog");

        } else if (request.getParameter("articleChange") != null) {
            String articleID = request.getParameter("articleID");
            ArticleInfo articleInfo = ArticleInfoDAO.getArticleInfo(DB, (String) session.getAttribute("username"), articleID);
            request.setAttribute("article", articleInfo);
            session.setAttribute("articleID", articleID);
            request.removeAttribute("articleChange");
            request.getRequestDispatcher("ArticleChange.jsp").forward(request, response);

        } else if (request.getParameter("action").equals("update")) {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String tag = request.getParameter("tag");
            request.removeAttribute("action");
            try {
                ArticleInfoDAO.updateArticleInfo(DB, (String) session.getAttribute("articleID"), content, title, ArticleInfoDAO.getCurrentTimeStamp(), tag, (String) session.getAttribute("username"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("Blog");
            ;

        } else if (request.getParameter("action").equals("delete")) {
            try {
                ArticleInfoDAO.deleteArticleInfo(DB, (String) session.getAttribute("username"), (String) session.getAttribute("articleID"));
            } catch (Exception e) {
                e.printStackTrace();
            }
            session.removeAttribute("action");
            session.removeAttribute("articleID");
            response.sendRedirect("Blog");
            ;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

}
