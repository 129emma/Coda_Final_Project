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
        String action="";
        if(request.getParameter("action")!=null){
            action=request.getParameter("action");
            switch (action){
                case "loadUserImage":
                    List<AlbumsImageInfo> albumsImageInfoList= AlbumsImageDAO.getAlbumsImageList(DB,username);
                    request.setAttribute("albumsImageInfoList",albumsImageInfoList);
                    break;
                case "loadUserVideo":
                    List<AlbumsVideoInfo> albumsVideoInfoList= AlbumsVideoDAO.getAlbumsVideoList(DB,username);
                    request.setAttribute("albumsVideoInfoList",albumsVideoInfoList);
                    break;
                case "loadUserAudio":
                    List<AlbumsAudioInfo> albumsAudioInfoList=AlbumsAudioDAO.getAlbumsAudioList(DB,username);
                    request.setAttribute("albumsAudioInfoList",albumsAudioInfoList);
                    break;
                case "loadUserYoutube":
                    List<AlbumsVideoInfo> albumsYoutubeList=AlbumsVideoDAO.getYoutubeList(DB,username);
                    request.setAttribute("albumsYoutubeList",albumsYoutubeList);
                    break;
                case "loadOtherUserImage":
                    break;
                case "loadOtherUserVideo":
                    break;
                case "loadOtherUserAudio":
                    break;
                case "loadOtherUserYoutube":
                    break;
            }
            request.getRequestDispatcher("Pages/AlbumsPage/AlbumsInfo.jsp").forward(request, response);

        }else {
            request.getRequestDispatcher("Pages/AlbumsPage/Albums.jsp").forward(request, response);
        }


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }


}
