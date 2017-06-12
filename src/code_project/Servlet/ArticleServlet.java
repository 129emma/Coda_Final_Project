package code_project.Servlet;

import code_project.DAO.ArticleInfoDAO;
import code_project.DAO.CommentInfoDAO;
import code_project.DAO.LikeInfoDAO;
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
import java.sql.SQLException;
import java.util.ArrayList;
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
            case "checkLikeStatus":
                checkLikeStatus(request, response);
                break;
            case "getLikeNum":
                getLikeNum(request, response);
                break;
        }
    }

    private void previewArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) session.getAttribute("username");
        List<ArticleInfo> articleInfoList = new ArrayList<>();
        String page = (String) request.getParameter("page");
        int articleNumber = Integer.parseInt(request.getParameter("articleNumber"));
        int totalArticleNumber = 0;
        if(page!=null){
            switch(page){
                case "home":
                    totalArticleNumber = ArticleInfoDAO.getTotalArticleNumber(mySQL,username);
                    articleNumber = Math.min(totalArticleNumber,articleNumber);
                    articleInfoList = ArticleInfoDAO.getArticleInfoList(mySQL, username, articleNumber);
                    break;
                case "spotlight":
                    totalArticleNumber = ArticleInfoDAO.getTotalArticleNumber(mySQL);
                    articleNumber = Math.min(totalArticleNumber,articleNumber);
                    articleInfoList = ArticleInfoDAO.getSpotlightArticleInfoList(mySQL, articleNumber);
                    break;
            }
        }
        request.setAttribute("articleInfoList", articleInfoList);
        request.getRequestDispatcher("Pages/ArticlePreviewPage/ArticlePreview.jsp").forward(request, response);
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
                commentInfo.setReplyComment(username);
                commentInfo.setEditComment(username);
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
        String username = (String)session.getAttribute("username");

        if (content == null || content.isEmpty()) {
            String submitElement = "<input type='submit' name='action' value='create'/>";
            request.setAttribute("submitElement", submitElement);
            request.getRequestDispatcher("Pages/ArticleEditPage/ArticleEdit.jsp").forward(request, response);
            return;
        }


        try {
            UserInfo userInfo = UserInfoDAO.getUserInfo(mySQL,username);
            String userAvatar = userInfo.getAvatar();
            ArticleInfoDAO.createArticleInfo(mySQL, title, content, ArticleInfoDAO.getCurrentTimeStamp(), tag, username,userAvatar);
            response.sendRedirect("Blog");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void dislikeArticle (HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            LikeInfoDAO.cancelLike(mySQL, request.getParameter("articleID"), (String) session.getAttribute("username"));

        } catch (SQLException e) {
            response.sendError(500, "Failed to connect to database");
        }
    }

    private void likeArticle (HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            LikeInfoDAO.like(mySQL, request.getParameter("articleID"), (String) session.getAttribute("username"));

        } catch (SQLException e) {
            response.sendError(500, "Failed to connect to database");
        }
    }

    private void checkLikeStatus (HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
        try {
            if (LikeInfoDAO.checkLikeStatus(mySQL, request.getParameter("articleID"), (String) session.getAttribute("username"))) {
                response.getWriter().write("liked");
            } else {
                response.getWriter().write("notLiked");
            }
        } catch (SQLException e) {
            response.sendError(500, "Failed to connect to database");
        }

    }

    private void getLikeNum (HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            long numOfLikes = LikeInfoDAO.getLikeNum(mySQL, request.getParameter("articleID"));
            response.getWriter().write(String.valueOf(numOfLikes));
        } catch (SQLException e) {
            response.sendError(500, "Failed to connect to database");
        }
    }

    private void replyArticle(HttpServletRequest request, HttpServletResponse response) {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }
}
