package code_project.Servlet;

import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by txie936 on 30/05/2017.
 */
public class AlbumsChangeServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");


        if ((session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);

        }else if((session.getAttribute("status")) .equals("logout")){
            session.setAttribute("logoutMessage","You already logout!");
            request.getRequestDispatcher("Login").forward(request, response);

        }else if((session.getAttribute("status")) .equals("login")){





        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
}
