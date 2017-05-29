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
    static String imageName;
    static String fileName;
    static String caption;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html");

        ServletContext servletContext=getServletContext();
        filePath=servletContext.getRealPath("/Uploaded-Photos");
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        //create directory
        PrintWriter out = response.getWriter( );
        if( !isMultipart ){
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Enhanced Servlet upload</title>");
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
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            //create session
            HttpSession id=request.getSession(true);
            File folder = new File(filePath + "/" + id);
            if (!folder.exists()) {
                folder.mkdir();
            }

            filePath = servletContext.getRealPath("/Uploaded-Photos/" + id);
            //add file
            while ( i.hasNext () )
            {
                FileItem fi = (FileItem)i.next();
                //add text file
                if(fi.getFieldName().equals("caption")){
                    File text=new File(filePath+"/"+id+".txt");
                    BufferedWriter writer=new BufferedWriter(new FileWriter(text));
                    caption=fi.getString();
                    id.setAttribute("caption",caption);
                    writer.write(caption);
                    fi.write(text);
                    writer.close();
                    out.print("<p>Caption: "+ fi.getString()+"</p>");
                }

                if ( !fi.isFormField () )
                {
                    // Get the uploaded file parameters
                    //String fieldName = fi.getFieldName();
                    fileName = fi.getName();
                    //String contentType = fi.getContentType();
                    //boolean isInMemory = fi.isInMemory();
                    //long sizeInBytes = fi.getSize();
                    // Write the file
                    imageName=fileName.substring(0,fileName.indexOf("."));
                    if( fileName.lastIndexOf("\\") >= 0 ){
                        file = new File( filePath +"/fullsize_"+
                                fileName.substring( fileName.lastIndexOf("\\"))) ;
                    }else{
                        file = new File( filePath +"/fullsize_"+
                                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                    }

                    fi.write(file);
                    BufferedImage thumbnail=null;
                    try {
                        thumbnail= ImageIO.read(new File(filePath+"/fullsize_"+fileName));

                    } catch (IOException e) {
                        e.printStackTrace();
                        return;
                    }
                    File outputfile=new File(filePath+"/"+imageName+"_thumbnail.png");
                    //check the size of the image
                    if((thumbnail.getWidth()<400)&&(thumbnail.getHeight()<400)){
                        //write the thumbnail
                        ImageIO.write(thumbnail,"png",outputfile);
                    }else {
                        Double width=(double)thumbnail.getWidth();
                        Double height=(double)thumbnail.getHeight();
                        double r=(height/width)*200;
                        try {
                            BufferedImage image = new BufferedImage(200, (int)r, BufferedImage.TYPE_INT_RGB);
                            image.createGraphics().drawImage(ImageIO.read(new File(filePath+"/fullsize_"+fileName)).getScaledInstance(200, (int)r, Image.SCALE_SMOOTH),0,0,null);
                            //write the thumbnail
                            ImageIO.write(image,"png",outputfile);

                        }catch (IOException e){
                            e.printStackTrace();
                        }
                    }
                    out.println("<a href='/Uploaded-Photos/"+id+"/fullsize_"+fileName+"'><img src='/Uploaded-Photos/"+id+"/"+imageName+"_thumbnail.png'></a><br>");
                    //out.println("Uploaded Filename: " + fileName + "<br>");

                    id.setAttribute("fileName",fileName);
                    id.setAttribute("imageName",imageName);


                }
            }
            out.println("</body>");
            out.println("</html>");
        }catch(Exception ex) {
            System.out.println(ex);
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
        response.setContentType("text/html");
        ServletContext servletContext=getServletContext();
        String filePath=servletContext.getRealPath("/Uploaded-Photos");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>Display image</title>");
        out.println("</head>");
        out.println("<body>");
        HttpSession id= request.getSession(false);
        File file=new File(filePath+"/"+id);
        if(!file.exists()){
            response.sendRedirect("/ex03.html");

        }else {
            out.println("Thumbnail image:<br><img src='/Uploaded-Photos/"+id+"/"+id.getAttribute("imageName")+"_thumbnail.png'><br>"+"Caption:"+id.getAttribute("caption")+
                    "<br><br>Full-size image:<br><img src='/Uploaded-Photos/"+id+"/fullsize_"+id.getAttribute("fileName")+"'><br>"
            );
        }
        out.println("</body>");
        out.println("</html>");

    }


}
