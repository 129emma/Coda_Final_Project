package code_project.Security;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by qpen546 on 31/05/2017.
 */
public class LoginStatus {
    private LoginStatus() {
    }

    public static void verifyStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String status;
        if((status = (String) session.getAttribute("status"))==null){status="";}
        switch (status) {
            case "login":
                return;
            case "logout":
               response.sendRedirect("Login");
                break;
            default:
                session.setAttribute("status", "logout");
                request.getRequestDispatcher("Login").forward(request, response);
        }
    }
}
