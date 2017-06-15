package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.UserInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;
import org.json.simple.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by qpen546 on 25/05/2017.
 */
public class BlogServlet extends HttpServlet {
    MySQL mySQL = new MySQL();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);

        response.setContentType("text/html");
        session = request.getSession(true);

        String username = (String) session.getAttribute("username");
        UserInfo userInfo = UserInfoDAO.getUserInfo(mySQL, (String) session.getAttribute("username"));
        request.setAttribute("userInfo", userInfo);

        String page = request.getParameter("page");
        if (page == null) {
            retrieveHomePage(request, response);
        } else {
            switch (page) {
                case "home":
                    retrieveHomePage(request, response);
                    return;
                case "spotlight":
                    retrieveSpotlightPage(request, response);
                    return;
                case "user":
                    retrieveUserPage(request, response);
                    return;
                case "tags":
                    retrieveTagsPage(request, response);
                    return;
                default:
                    retrieveHomePage(request, response);
            }
        }
    }

    private void retrieveTagsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tags= request.getParameter("tags");
        request.setAttribute("page", "tags");
        request.setAttribute("tags", tags);
        request.getRequestDispatcher("Pages/BlogPage/Blog.jsp").forward(request, response);
    }

    private void retrieveUserPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String targetUser= request.getParameter("targetUser");
        request.setAttribute("page", "user");
        request.setAttribute("targetUser", targetUser);
        request.getRequestDispatcher("Pages/BlogPage/Blog.jsp").forward(request, response);
    }

    private void retrieveSpotlightPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "spotlight");
        request.getRequestDispatcher("Pages/BlogPage/Blog.jsp").forward(request, response);
    }

    private void retrieveHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("page", "home");
        request.getRequestDispatcher("Pages/BlogPage/Blog.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}
