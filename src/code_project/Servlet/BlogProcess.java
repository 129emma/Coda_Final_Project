package code_project.Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by qpen546 on 25/05/2017.
 */
public class BlogProcess extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        if (((String) session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("logout")){
            session.setAttribute("logoutMessage","You already logout!");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("login")){
            request.getRequestDispatcher("Blog.jsp").forward(request, response);
        }
    }
}
