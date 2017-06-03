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



    public static List<ArticleInfo> getArticleInfoList(AbstractDB db ,String username,int number) {

        List<ArticleInfo> articleInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Article WHERE username=? LIMIT ?")) {
                p.setString(1,username);
                p.setInt(2,number);
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

    public static int getTotalArticleNumber(AbstractDB db){
        int totalArticleNumber = 0;
        try (Connection c = db.connection()) {
            try (Statement stmt = c.createStatement()) {
                try (ResultSet r = stmt.executeQuery("SELECT COUNT(*) FROM Article")) {
                    while (r.next()) {
                        totalArticleNumber = r.getInt(1);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return totalArticleNumber;
    }

    public static List<ArticleInfo> getSpotlightArticleInfoList(AbstractDB db ,int pageNumber) {

        List<ArticleInfo> articleInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Article ORDER BY articleID ASC LIMIT 10 OFFSET ?")) {
                p.setInt(1,pageNumber);
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



    public static void createArticleInfo(AbstractDB db, String title,String content, String postTime, String tags,String username ) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO Article(title,content,postTime,tags,username) VALUES (?,?,?,?,?);")) {
                p.setString(1, title);
                p.setString(2, content);
                p.setString(3, postTime);
                p.setString(4, tags);
                p.setString(5, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static ArticleInfo getArticleInfo(AbstractDB db,String articleID) {

        ArticleInfo articleInfo = null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM Article WHERE articleID=?")) {
                p.setString(1, articleID);
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

    public static void updateArticleInfo(AbstractDB db,String articleID,String content,String title, String postTime, String tags,String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE Article set content =?, title=?,postTime=?, tags=? WHERE username = ? AND articleID=?;")) {
                p.setString(1, content);
                p.setString(2, title);
                p.setString(3, postTime);
                p.setString(5, username);
                p.setString(4, tags);
                p.setString(6, articleID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteArticleInfo(AbstractDB db, String username,String articleID) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM Article WHERE username = ? AND articleID=?;")) {
                p.setString(1, username);
                p.setString(2, articleID);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static ArticleInfo ArticleInfoFromResultSet(ResultSet r) throws SQLException {
        return new ArticleInfo(
                r.getInt("articleID"),
                r.getString("title"),
                r.getString("content"),
                r.getDate("postTime").toString()+" "+r.getTime("postTime").toString(),
                r.getString("tags"),
                r.getString("username")
        );
    }

    public static String getCurrentTimeStamp() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}