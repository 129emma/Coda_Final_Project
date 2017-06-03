package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.UserInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by txie936 on 29/05/2017.
 */
public class AvatarEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String filePath;
    private int maxFileSize=5120*5120;
    private int maxMemSize=5120*5120;
    private File file;
    static String fileName;
    MySQL DB=new MySQL();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request,response);
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        String username=(String)session.getAttribute("username");

        LoginStatus.verifyStatus(request, response);

        //get User-Info path
        ServletContext servletContext=getServletContext();
        String fullFilePath=servletContext.getRealPath("/User-Info");

        String localIconFilePath=servletContext.getRealPath("/");

        response.setContentType("text/html");

     //create User-Info folder
        File Iconfolder = new File(fullFilePath);

        if (!Iconfolder.exists()) {
            Iconfolder.mkdir();
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
            upload.setSizeMax( maxFileSize );


            createUserIcon(upload,request,filePath,localIconFilePath);


            try {
                UserInfoDAO.updateUserIcon(DB,"User-Info/" + username+"/icon.jpg",username);
            }catch (Exception e){
                e.printStackTrace();
            }
            UserInfo userInfo=UserInfoDAO.getUserInfo(DB,username);
            request.setAttribute("userInfo",userInfo);
            request.getRequestDispatcher("Pages/UpdateProfilePage/UpdateProfile.jsp").forward(request,response);

    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        String username=(String)session.getAttribute("username");
        if (((String) session.getAttribute("status")) == null) {
            session.setAttribute("status","logout");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("logout")){
            session.setAttribute("logoutMessage","You already logout!");
            request.getRequestDispatcher("Login").forward(request, response);
        }else if(((String) session.getAttribute("status")) .equals("login")){
            if(request.getParameter("ChangeIcon")!=null){
                UserInfo userInfo=UserInfoDAO.getUserInfo(DB,username);
                List<String> iconList=iconList();
                request.setAttribute("iconList",iconList);
                request.setAttribute("userInfo",userInfo);
                request.getRequestDispatcher("Pages/AvatarEditPage/AvatarEdit.jsp").forward(request,response);
            }
        }
    }

protected List<String> iconList(){
        List<String> iconList=new ArrayList<>();
        iconList.add("Pages/AvatarEditPage/DefaultAvatar/Desert.jpg");
        iconList.add("Pages/AvatarEditPage/DefaultAvatar/Kiwi.png");
        iconList.add("Pages/AvatarEditPage/DefaultAvatar/Mouse.png");
        iconList.add("Pages/AvatarEditPage/DefaultAvatar/pig.png");
        return iconList;
    }
private void createUserIcon(ServletFileUpload upload,HttpServletRequest request,String filePath,String localIconFilePath){

    List<String> iconList=iconList();
    try{
        // Parse the request to get file items.
        List fileItems = upload.parseRequest(request);
        // Process the uploaded file items
        Iterator i = fileItems.iterator();
        //add file
        while ( i.hasNext () )
        {
            FileItem fi = (FileItem)i.next();
            if(fi.getFieldName().equals("result")){

                //use local image as user icon
                if(iconList.contains(fi.getString())){
                    //get local icon's  path
                    String localIconPath= fi.getString();
                    BufferedImage icon=null;
                    try {
                        //read the local image
                        icon= ImageIO.read(new File(localIconFilePath+ localIconPath));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    File outputfile=new File(filePath+"/icon.jpg");
                    //write the image to the user's icon
                    ImageIO.write(icon,"jpg",outputfile);
                    break;
                }
                //if the file is from the user
            }else if ( !fi.isFormField () )
            {
                fileName = fi.getName();
                file = new File( filePath +"/icon.jpg") ;
                fi.write(file);
                BufferedImage icon=null;
                try {
                    icon= ImageIO.read(new File(filePath+"/icon.jpg"));
                } catch (IOException e) {
                    e.printStackTrace();
                    return;
                }
                File outputfile=new File(filePath+"/icon.jpg");
                //check the size of the image
                if((icon.getWidth()<400)&&(icon.getHeight()<400)){
                    //write the thumbnail
                    ImageIO.write(icon,"jpg",outputfile);
                }else {
                    Double width=(double)icon.getWidth();
                    Double height=(double)icon.getHeight();
                    double r=(height/width)*200;
                    try {
                        BufferedImage image = new BufferedImage(200, (int)r, BufferedImage.TYPE_INT_RGB);
                        image.createGraphics().drawImage(ImageIO.read(new File(filePath+"/icon.jpg")).getScaledInstance(200, (int)r, Image.SCALE_SMOOTH),0,0,null);
                        //write the thumbnail
                        ImageIO.write(image,"jpg",outputfile);

                    }catch (IOException e){
                        e.printStackTrace();
                    }
                }
            }
        }

    }catch(Exception ex) {
        System.out.println(ex);
    }

}
}
