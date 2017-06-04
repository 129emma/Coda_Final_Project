package code_project.Servlet;

import code_project.DAO.*;
import code_project.Info.*;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by txie936 on 30/05/2017.
 */
public class AlbumsServlet extends HttpServlet {
    MySQL DB=new MySQL();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        HttpSession session = request.getSession(true);
        String username=(String)session.getAttribute("username");
        response.setContentType("text/html");

            List<AlbumsImageInfo> albumsImageInfoList= AlbumsImageDAO.getAlbumsImageList(DB,username);
            List<AlbumsVideoInfo> albumsVideoInfoList= AlbumsVideoDAO.getAlbumsImageList(DB,username);
            List<AlbumsAudioInfo> albumsAudioInfoList=AlbumsAudioDAO.getAlbumsAudioList(DB,username);

            request.setAttribute("albumsImageInfoList",albumsImageInfoList);
            request.setAttribute("albumsVideoInfoList",albumsVideoInfoList);
            request.setAttribute("albumsAudioInfoList",albumsAudioInfoList);

            request.getRequestDispatcher("Pages/AlbumsPage/Albums.jsp").forward(request, response);

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }


}
