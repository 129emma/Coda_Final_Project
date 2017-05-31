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

/*
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfoDAO {

    public static Map<Integer,CommentInfoList> getCommentInfoListOfAllArticle(AbstractDB db , List<ArticleInfo> articleInfoList) {
        Map<Integer,CommentInfoList> commentInfoListsOfAllArticle= new HashMap<>();
        for (ArticleInfo articleInfo : articleInfoList) {
            CommentInfoList commentInfoList= new CommentInfoList(getCommentInfoListByArticle(db,articleInfo.getArticleID()));
            commentInfoListsOfAllArticle.put(articleInfo.getArticleID(),commentInfoList);
        }
        return commentInfoListsOfAllArticle;
    }

    public static List<CommentInfo> getCommentInfoListByArticle(AbstractDB db , int articleID) {

        List<CommentInfo> CommentInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Comment WHERE articleID=?")) {
                p.setInt(1,articleID);
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

    public static void createCommentInfo(AbstractDB db, String content, String postTime, String username, String articleID ) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO Comment(content, postTime, username, articleID) VALUES (?,?,?,?);")) {
                p.setString(1, content);
                p.setString(2, postTime);
                p.setString(3, username);
                p.setString(4, articleID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static CommentInfo getCommentInfo(AbstractDB db, String commentID) {

        CommentInfo CommentInfo = null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Comment WHERE commentID = ?")) {
                p.setString(1, commentID);
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

    public static void updateCommentInfo(AbstractDB db,int commentID,String content, String postTime) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE Comment set content =?,postTime=? AND commentID=?;")) {
                p.setString(1, content);
                p.setString(2, postTime);
                p.setInt(3, commentID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteCommentInfo(AbstractDB db, int commentID) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM Comment WHERE CommentID=?;")) {
                p.setInt(1, commentID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static CommentInfo CommentInfoFromResultSet(ResultSet r) throws SQLException {
        return new CommentInfo(
                r.getInt("CommentID"),
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
