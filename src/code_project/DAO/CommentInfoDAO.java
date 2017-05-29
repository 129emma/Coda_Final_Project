package code_project.DAO;

import code_project.Info.ArticleInfo;
import code_project.Info.CommentInfo;
import code_project.Info.CommentInfoList;
import code_project.db.AbstractDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfoDAO {

    public static Map<Integer,CommentInfoList> getCommentInfoListOfAllArticle(AbstractDB db , List<ArticleInfo> articleInfoList) {
        Map<Integer,CommentInfoList> commentInfoListsOfAllArticle= new HashMap<>();
        for (ArticleInfo articleInfo : articleInfoList) {
            CommentInfoList commentInfoList= new CommentInfoList(getCommentInfoListByArticle(db,articleInfo.getArticle_ID()));
            commentInfoListsOfAllArticle.put(articleInfo.getArticle_ID(),commentInfoList);
        }
        return commentInfoListsOfAllArticle;
    }

    public static List<CommentInfo> getCommentInfoListByArticle(AbstractDB db , int article_ID) {

        List<CommentInfo> CommentInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Comment WHERE article_ID=?")) {
                p.setInt(1,article_ID);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        CommentInfoList.add(CommentInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return CommentInfoList;
    }

    public static List<CommentInfo> getCommentInfoListByUsername(AbstractDB db , String username) {

        List<CommentInfo> CommentInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Comment WHERE username=?")) {
                p.setString(1,username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        CommentInfoList.add(CommentInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return CommentInfoList;
    }

    public static void createCommentInfo(AbstractDB db, String content, String post_time, String username, String article_ID ) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO Comment(content, post_time, username, article_ID) VALUES (?,?,?,?);")) {
                p.setString(1, content);
                p.setString(2, post_time);
                p.setString(3, username);
                p.setString(4, article_ID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static CommentInfo getCommentInfo(AbstractDB db, String comment_ID) {

        CommentInfo CommentInfo = null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Comment WHERE comment_ID = ?")) {
                p.setString(1, comment_ID);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        CommentInfo = CommentInfoFromResultSet(r);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return CommentInfo;
    }

    public static void updateCommentInfo(AbstractDB db,int comment_ID,String content, String post_time) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE Comment set content =?,post_time=? AND comment_ID=?;")) {
                p.setString(1, content);
                p.setString(2, post_time);
                p.setInt(3, comment_ID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteCommentInfo(AbstractDB db, int Comment_ID) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM Comment WHERE Comment_ID=?;")) {
                p.setInt(1, Comment_ID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static CommentInfo CommentInfoFromResultSet(ResultSet r) throws SQLException {
        return new CommentInfo(
                r.getInt("Comment_ID"),
                r.getString("content"),
                r.getDate("postTime").toString()+" "+r.getTime("postTime").toString(),
                r.getString("username"),
                r.getInt("articleID")
        );
    }

    //Simplify to static method
    public static String getCurrentTimeStamp() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
