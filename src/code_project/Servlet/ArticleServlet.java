package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.CommentInfoDAO;
import code_project.DAO.UserInfoDAO;
import code_project.Info.ArticleInfo;
import code_project.Info.CommentInfo;
import code_project.Info.UserInfo;
import code_project.Security.LoginStatus;
import code_project.db.MySQL;
import org.json.simple.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by txie936 on 29/05/2017.
 */
public class ArticleServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LoginStatus.verifyStatus(request, response);

        response.setContentType("text/html");
        session = request.getSession(true);
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createArticle(request, response);
                break;
            case "preview":
                previewArticle(request, response);
                break;
            case "retrieve":
                retrieveArticle(request, response);
                break;
            case "delete":
                deleteArticle(request, response);
                break;
            case "edit":
                editArticle(request, response);
                break;
            case "update":
                updateArticle(request, response);
                break;
            case "reply":
                replyArticle(request, response);
                break;
            case "like":
                likeArticle(request, response);
                break;
            case "dislike":
                dislikeArticle(request, response);
                break;
        }
    }

    private void previewArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) session.getAttribute("username");
        String loadMoreArticle;
        int articleNumber = Integer.parseInt(request.getParameter("articleNumber"));
        int totalArticleNumber = ArticleInfoDAO.getTotalArticleNumber(mySQL)-1;
        if(articleNumber>=totalArticleNumber){
            articleNumber = totalArticleNumber;
            loadMoreArticle  = "<div class=\"text-center bg-danger\" id=\"loadArticleButton\">Load more articles</div>";
        }else{
            loadMoreArticle  = "<div class=\"text-center bg-primary\" id=\"loadArticleButton\">Load more articles</div>";
        }
        List<ArticleInfo> articleInfoList = ArticleInfoDAO.getArticleInfoList(mySQL, username, articleNumber);
        request.setAttribute("articleInfoList", articleInfoList);
        request.setAttribute("loadMoreArticle",loadMoreArticle);
        request.getRequestDispatcher("Pages/ArticleRetrieving/ArticlePreview.jsp").forward(request, response);
    }

    private void retrieveArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String articleID = request.getParameter("articleID");
        String username = (String) session.getAttribute("username");
        ArticleInfo articleInfo = ArticleInfoDAO.getArticleInfo(mySQL, articleID);
        articleInfo.setEditArticle(username);
        articleInfo.setDeleteArticle(username);
        retrieveComments(request, response);
        request.setAttribute("articleInfo", articleInfo);
        request.getRequestDispatcher("Pages/ArticlePage/Article.jsp").forward(request, response);
    }

    private void retrieveComments(HttpServletRequest request, HttpServletResponse response) {
        String articleID = request.getParameter("articleID");
        String username = (String) session.getAttribute("username");
        List<CommentInfo> commentInfoList = CommentInfoDAO.getCommentInfoListByArticle(mySQL, Integer.parseInt(articleID));
        if (commentInfoList != null) {
            for (CommentInfo commentInfo : commentInfoList) {
                commentInfo.setDeleteComment(username);
            }
        }
        request.setAttribute("commentInfoList", commentInfoList);
    }

    private void updateArticle(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String tag = request.getParameter("tag");
        try {
            ArticleInfoDAO.updateArticleInfo(mySQL, request.getParameter("articleID"), content, title, ArticleInfoDAO.getCurrentTimeStamp(), tag, (String) session.getAttribute("username"));
            response.sendRedirect("Blog");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editArticle(HttpServletRequest request, HttpServletResponse response) {
        String articleID = request.getParameter("articleID");
        ArticleInfo articleInfo = ArticleInfoDAO.getArticleInfo(mySQL, articleID);
        request.setAttribute("articleInfo", articleInfo);
        String hiddenElement = "<input type='hidden' name='articleID' value='" + articleID + "'>";
        String submitElement = "<input type='submit' name='action' value='update'/> ";
        String deleteElement = "<input type='submit' name='action' value='delete'/>";
        request.setAttribute("hiddenElement", hiddenElement);
        request.setAttribute("submitElement", submitElement);
        request.setAttribute("deleteElement", deleteElement);
        try {
            request.getRequestDispatcher("Pages/ArticleEditPage/ArticleEdit.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteArticle(HttpServletRequest request, HttpServletResponse response) {
        try {
            ArticleInfoDAO.deleteArticleInfo(mySQL, (String) session.getAttribute("username"), request.getParameter("articleID"));
            session.removeAttribute("action");
            response.sendRedirect("Blog");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void createArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String tag = request.getParameter("tag");

        if (content == null || content.isEmpty()) {
            String submitElement = "<input type='submit' name='action' value='create'/>";
            request.setAttribute("submitElement", submitElement);
            request.getRequestDispatcher("Pages/ArticleEditPage/ArticleEdit.jsp").forward(request, response);
            return;
        }


        try {
            ArticleInfoDAO.createArticleInfo(mySQL, title, content, ArticleInfoDAO.getCurrentTimeStamp(), tag, (String) session.getAttribute("username"));
            response.sendRedirect("Blog");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void dislikeArticle(HttpServletRequest request, HttpServletResponse response) {

    }

    private void likeArticle(HttpServletRequest request, HttpServletResponse response) {

    }

    private void replyArticle(HttpServletRequest request, HttpServletResponse response) {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }


}
