package code_project.Servlet;

import code_project.Security.LoginStatus;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by pqsky on 2017/5/23.
 */
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");

        session.setAttribute("status","logout");
        session.setAttribute("logoutMessage","You are success to logout!");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
}
