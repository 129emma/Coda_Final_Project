package code_project.Servlet;

import code_project.DAO.CommentInfoDAO;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if (action.equals("create")) {
            createCommentInfo(request,response);
        }
        request.getRequestDispatcher("ArticlePage.jsp").forward(request, response);
    }

    protected void createCommentInfo(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String article_ID = request.getParameter("article_ID");
        String content = request.getParameter("content");
        String post_time = CommentInfoDAO.getCurrentTimeStamp();
        try {
            CommentInfoDAO.createCommentInfo(mySQL, content, post_time, username, article_ID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
