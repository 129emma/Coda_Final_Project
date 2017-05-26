package code_project.DAO;

import code_project.Info.ArticleInfo;
import code_project.Info.LoginInfo;
import code_project.db.AbstractDB;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
/**
 * Created by txie936 on 25/05/2017.
 */
public class ArticleInfoDAO {




    public static List<ArticleInfo> getArticleInfoList(AbstractDB db ,String username) {

        List<ArticleInfo> articleInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Article WHERE username=?")) {
                p.setString(1,username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        articleInfoList.add(ArticleInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
         return articleInfoList;
    }



    public static void createArticleInfo(AbstractDB db, String article_ID, String title,String content, String post_time, String tags,String username ) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO Article VALUES (?,?,?,?,?,?);")) {
                p.setString(1, article_ID);
                p.setString(2, title);
                p.setString(3, content);
                p.setString(4, post_time);
                p.setString(5, tags);
                p.setString(6, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public static ArticleInfo getArticleInfo(AbstractDB db, String username,String article_ID) {

        ArticleInfo articleInfo = null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Article WHERE username = ?AND article_ID=?")) {
                p.setString(1, username);
                p.setString(2, article_ID);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        articleInfo = ArticleInfoFromResultSet(r);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return articleInfo;
    }

    public static void updateArticleInfo(AbstractDB db,String article_ID,String content,String title, String post_time, String tags,String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE Article set content =?, title=?,post_time=?, tags=? WHERE username = ? AND article_ID=?;")) {
                p.setString(1, content);
                p.setString(2, title);
                p.setString(3, post_time);
                p.setString(5, username);
                p.setString(4, tags);
                p.setString(6, article_ID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public static void deleteArticleInfo(AbstractDB db, String username,String article_ID) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM Article WHERE username = ? AND article_ID=?;")) {
                p.setString(1, username);
                p.setString(2, article_ID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    private static ArticleInfo ArticleInfoFromResultSet(ResultSet r) throws SQLException {
        return new ArticleInfo(
                r.getString("article_ID"),
                r.getString("title"),
                r.getString("content"),
                r.getString("post_time"),
                r.getString("tags"),
                r.getString("username")
                );
    }



    public static String getCurrentTimeStamp() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
    }
}
