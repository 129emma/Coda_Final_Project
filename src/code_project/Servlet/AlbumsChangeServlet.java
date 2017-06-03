package code_project.Servlet;

import code_project.DAO.AlbumsImageDAO;
import code_project.DAO.AlbumsVideoDAO;
import code_project.Info.AlbumsVideoInfo;
import code_project.Info.ArticleInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by txie936 on 30/05/2017.
 */
public class AlbumsChangeServlet extends HttpServlet {
    MySQL mySQL = new MySQL();
    private static final long serialVersionUID = 1L;
    private String filePath;
    private int maxFileSize = 5120 * 5120;
    private int maxMemSize = 5120 * 5120;
    private File file;
    static String fileName;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        String username = (String) session.getAttribute("username");

            if(request.getParameter("action") != null) {
                switch (request.getParameter("action")){
                    case "deleteImage":
                        deleteAlbumsImage(request, response,username);

                        break;
                    case "deleteVideo":
                        deleteAlbumsVideo(request, response,username);
                        break;
                    case "createVideo":
                        addVideoToUserAlbums(request,response,username);
                        break;

                }
            }else {
                addImageToUserAlbums(request,response,username);
            }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    private void addVideoToUserAlbums(HttpServletRequest request,HttpServletResponse response, String username) throws IOException, ServletException {
        try {
            String content = "";
            String title = "";
            String tags = "";
            String videoAddress="";
           content=request.getParameter("articleContent");
           title=request.getParameter("articleTitle");
           tags=request.getParameter("articleTags");
           videoAddress =request.getParameter("videoAddress");

            AlbumsVideoDAO.createAlbumsVideoInfo(mySQL, username, videoAddress);


            request.setAttribute("information", "Success");

            ArticleInfo articleInfo=new ArticleInfo(title,content,tags);

            request.setAttribute("video",videoAddress);

            request.setAttribute("articleInfo",articleInfo);

            String submitElement = "<input type='submit' name='action' value='create'/>";
            request.setAttribute("submitElement", submitElement);

            request.getRequestDispatcher("Pages/ArticleEditPage/ArticleEdit.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("information", "Fail to upload the file, please try again");
        }
    }

private void deleteAlbumsImage(HttpServletRequest request,HttpServletResponse response,String username){
        try {
              String imageID=request.getParameter("albumsImageId");
            AlbumsImageDAO.deleteAlbumsImageInfo(mySQL,username,imageID);
            ServletContext servletContext = getServletContext();
           String imagePath = servletContext.getRealPath("/User-Info/" + username);
           File file=new File(imagePath+"/"+imageID+".jpg");
           Boolean result=file.delete();
            response.sendRedirect("Albums");
        }catch (Exception e){
            e.printStackTrace();
        }

}

    private void deleteAlbumsVideo(HttpServletRequest request,HttpServletResponse response,String username){
        try {
            AlbumsVideoDAO.deleteAlbumsVideoInfo(mySQL,username,request.getParameter("albumsVideoId"));
            response.sendRedirect("Albums");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
    private void addImageToUserAlbums(HttpServletRequest request,HttpServletResponse response, String username) throws IOException, ServletException {

        ServletContext servletContext = getServletContext();
        String fullFilePath = servletContext.getRealPath("/User-Info");

        //create User-Info folder
        File userInfoFolder = new File(fullFilePath);
        if (!userInfoFolder.exists()) {
            userInfoFolder.mkdir();
        }
        //create the user's own folder under User-Info folder
        File Userfolder = new File(fullFilePath + "/" + username);

        if (!Userfolder.exists()) {
            Userfolder.mkdir();
        }
        //get the user's folder path
        filePath = servletContext.getRealPath("/User-Info/" + username);

        //create directory
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("C:\\temp"));
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);
        try {
            createUserAlbumsImage(upload, request,filePath,username);
            request.getRequestDispatcher("Pages/ArticleEditPage/ArticleEdit.jsp").forward(request, response);
        }catch (Exception e){
            request.setAttribute("information", "Fail to upload the file, please try again");

        }
    }


    private void createUserAlbumsImage(ServletFileUpload upload, HttpServletRequest request, String filePath,String username) throws IOException, ServletException, FileUploadException,SQLException {

        String imageAddress = "";
        String content = "";
        String title = "";
        String tags = "";
        // Parse the request to get file items.
        List fileItems = upload.parseRequest(request);
        // Process the uploaded file items
        Iterator i = fileItems.iterator();
        //add file
        while (i.hasNext()) {
            FileItem fi = (FileItem) i.next();

            if (!fi.isFormField()) {
                String currentTime = getCurrentTimeStamp();

                fileName = fi.getName();
                file = new File(filePath + "/" + currentTime + ".jpg");
                try {
                    fi.write(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                BufferedImage AlbumImage = null;

                AlbumImage = ImageIO.read(new File(filePath + "/" + currentTime + ".jpg"));

                File outputfile = new File(filePath + "/" + currentTime + ".jpg");
                //check the size of the image
                if ((AlbumImage.getWidth() < 400) && (AlbumImage.getHeight() < 400)) {
                    //write the thumbnail
                    ImageIO.write(AlbumImage, "jpg", outputfile);

                } else {
                    Double width = (double) AlbumImage.getWidth();
                    Double height = (double) AlbumImage.getHeight();
                    double r = (height / width) * 200;
                    BufferedImage image = new BufferedImage(200, (int) r, BufferedImage.TYPE_INT_RGB);
                    image.createGraphics().drawImage(ImageIO.read(new File(filePath + "/" + currentTime + ".jpg")).getScaledInstance(200, (int) r, Image.SCALE_SMOOTH), 0, 0, null);
                    //write the thumbnail
                    ImageIO.write(image, "jpg", outputfile);

                }
                imageAddress = "<img style='margin:auto' src='User-Info/" + username + "/" + currentTime + ".jpg'>";
                AlbumsImageDAO.createAlbumsImageInfo(mySQL, username, imageAddress, currentTime);
            } else if (fi.isFormField()) {
                if (fi.getFieldName().equals("articleContent")) {
                    content = fi.getString();
                }else if(fi.getFieldName().equals("articleTitle")){
                    title=fi.getString();
                }else if(fi.getFieldName().equals("articleTags")){
                    tags=fi.getString();
                }
            }
        }
        ArticleInfo articleInfo = new ArticleInfo(title, content + imageAddress, tags);
        request.setAttribute("articleInfo", articleInfo);
        request.setAttribute("information", "Success");
        String submitElement = "<input type='submit' name='action' value='create'/>";
        request.setAttribute("submitElement", submitElement);
    }




    public void createVideo() throws Exception{


        File file = new File(".mp4");
        FileInputStream fin = new FileInputStream(file);
        byte b[] = new byte[(int)file.length()];
        fin.read(b);
        File nf = new File("D:/K.mp4");
        FileOutputStream fw = new FileOutputStream(nf);
        fw.write(b);
        fw.flush();
        fw.close();

    }
    public void createAudio() throws Exception{


        File file = new File(".mp3");

        FileInputStream fin = new FileInputStream(file);

        byte b[] = new byte[(int)file.length()];

        fin.read(b);

        File nf = new File("D:/K.mp3");

        FileOutputStream fw = new FileOutputStream(nf);

        fw.write(b);
        fw.flush();
        fw.close();

    }
    private static String getCurrentTimeStamp() {
        return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    }
}
