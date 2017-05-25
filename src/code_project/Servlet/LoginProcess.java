package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.LoginInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Security.Passwords;
import code_project.Info.LoginInfo;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by qpen546 on 23/05/2017.
 */
public class LoginProcess extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private String username;
    private String password;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);

        if (((String) session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }



        if (((String) session.getAttribute("status")).equals("login")) {
            ArticleInfo articleInfo=ArticleInfoDAO.getArticleInfo(mySQL,(String)session.getAttribute("username"),"156");
            request.setAttribute("title",articleInfo.getTitle());
            request.setAttribute("content",articleInfo.getContent());
            request.setAttribute("id",articleInfo.getArticle_ID());
            response.sendRedirect("Blog.jsp");
        } else {
            username = request.getParameter("username");
            password = request.getParameter("password");
            if (username == null){
                session.setAttribute("loginMessage", "");
                session.setAttribute("logoutMessage", "");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            LoginInfo loginInfo = LoginInfoDAO.getLoginInfo(mySQL, username);
            if (loginInfo == null){
                session.setAttribute("loginMessage", "Fail to login: wrong username");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            if (Passwords.isExpectedPassword(password.toCharArray(), loginInfo.getSalt(), 5, loginInfo.getPassword())) {
                session.setAttribute("loginMessage", "");
                session.setAttribute("status", "login");
                session.setAttribute("username",username);
                ArticleInfo articleInfo=ArticleInfoDAO.getArticleInfo(mySQL,(String)session.getAttribute("username"),"156");
                request.setAttribute("title",articleInfo.getTitle());
                request.setAttribute("content",articleInfo.getContent());
                request.setAttribute("id",articleInfo.getArticle_ID());
                request.getRequestDispatcher("Blog").forward(request, response);
            } else {
                session.setAttribute("loginMessage", "Fail to login: wrong password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }
    }

}
