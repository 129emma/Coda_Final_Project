package code_project.DAO;

import code_project.Info.AlbumsVideoInfo;
import code_project.db.AbstractDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by txie936 on 31/05/2017.
 */
public class AlbumsVideoDAO {


    public static List<AlbumsVideoInfo> getAlbumsImageList(AbstractDB db , String username) {

        List<AlbumsVideoInfo> AlbumsVideoInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM AlbumsVideo WHERE username=?")) {
                p.setString(1,username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        AlbumsVideoInfoList.add(AlbumsVideoInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return AlbumsVideoInfoList;
    }



    public static void createAlbumsVideoInfo(AbstractDB db, String username,String address,String fileName) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO AlbumsVideo(username,address,postTime,fileName) VALUES (?,?,?,?)")) {
                p.setString(1, username);
                p.setString(4,fileName);
                p.setString(2, address);
                p.setString(3, getCurrentTimeStamp());
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteAlbumsVideoInfo(AbstractDB db, String username,int id) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM AlbumsVideo WHERE username = ? AND id=?")) {
                p.setString(1, username);
                p.setInt(2, id);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }



    public static AlbumsVideoInfo getAlbumsVideoInfo(AbstractDB db, String username,String id) {

        AlbumsVideoInfo AlbumsVideoInfo= null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM AlbumsVideo WHERE username = ?AND id=?")) {
                p.setString(1, username);
                p.setString(2, id);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        AlbumsVideoInfo = AlbumsVideoInfoFromResultSet(r);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return AlbumsVideoInfo;
    }



    private static AlbumsVideoInfo  AlbumsVideoInfoFromResultSet(ResultSet r) throws SQLException {
        return new AlbumsVideoInfo(
                r.getInt("id"),
                r.getString("fileName"),
                r.getString("username"),
                r.getString("address"),
                r.getDate("postTime").toString()+" "+r.getTime("postTime").toString()
        );
    }



    private static String getCurrentTimeStamp() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
