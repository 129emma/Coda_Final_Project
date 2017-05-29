package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.UserInfo;
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
public class ChangeIcon extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private boolean isMultipart;
    private String filePath;
    private int maxFileSize=5120*5120;
    private int maxMemSize=5120*5120;
    private File file;
    static String fileName;
    MySQL DB=new MySQL();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        String username=(String)session.getAttribute("username");

        ServletContext servletContext=getServletContext();
        filePath=servletContext.getRealPath("/User-Info");
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        //create directory
        PrintWriter out = response.getWriter( );
        if( !isMultipart ){
            out.println("<html>");
            out.println("<head>");
            out.println("<title>User-Icon upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
            return;
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("C:\\temp"));
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );

        try{
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            HttpSession id=request.getSession(true);


            File Iconfolder = new File(filePath);
            if (!Iconfolder.exists()) {
                Iconfolder.mkdir();
            }

            File Userfolder = new File(filePath + "/" + username);
            if (!Userfolder.exists()) {
                Userfolder.mkdir();
            }

            filePath = servletContext.getRealPath("/User-Info/" + username);
            //add file
            while ( i.hasNext () )
            {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () )
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
                            UserInfoDAO.updateUserIcon(DB,"/User-Info/" + username+"/icon.jpg",username);
                        }catch (IOException e){
                            e.printStackTrace();
                        }
                    }

                    UserInfo userInfo=UserInfoDAO.getUserInfo(DB,username);
                     request.setAttribute("userInfo",userInfo);
                    request.getRequestDispatcher("UpdateProfile.jsp").forward(request,response);

                }
            }

        }catch(Exception ex) {
            System.out.println(ex);
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        String username=(String)session.getAttribute("username");

        if(request.getParameter("ChangeIcon")!=null){

            UserInfo userInfo=UserInfoDAO.getUserInfo(DB,username);

            List<String> iconList=iconList();
            request.setAttribute("iconList",iconList);

            request.setAttribute("userInfo",userInfo);
            request.getRequestDispatcher("changeIcon.jsp").forward(request,response);

        }

    }

protected List<String> iconList(){
        List<String> iconList=new ArrayList<>();
        iconList.add("Local-IconImages/Desert.jpg");
    iconList.add("Local-IconImages/Kiwi.png");
    iconList.add("Local-IconImages/Mouse.png");
    iconList.add("Local-IconImages/pig.png");
        return iconList;
    }
}
