package code_project.DAO;

import code_project.Info.UserInfo;
import code_project.db.AbstractDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by txie936 on 8/06/2017.
 */
public class UserRelationshipDAO {


    public static void follow(AbstractDB db,String followerUsername,String followUsername) throws SQLException{

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT IGNORE INTO UserRelationship (follower, follow) VALUE (?,?);")) {
                p.setString(1, followerUsername);
                p.setString(2, followUsername);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public static void unfollow(AbstractDB db,String followerUsername,String followUsername) throws SQLException {

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM UserRelationship WHERE follower=? AND follow=?")) {
                p.setString(1, followerUsername);
                p.setString(2, followUsername);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }


    public static List<UserInfo> getFollows(AbstractDB db, String username){
        List<UserInfo> followsList = new ArrayList<>();
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserRelationship WHERE follower=?")) {
                p.setString(1,username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        followsList.add(UserInfoDAO.userInfoFromResultSet(r));
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return followsList;
    }


    public static Boolean checkFollowStatus(AbstractDB db, String username,String followUsername){
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserRelationship WHERE follower=? AND follow=?")) {
                p.setString(1,username);
                p.setString(2,followUsername);
                try (ResultSet r = p.executeQuery()) {
                   if(r.next()){
                        return true;
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<UserInfo> getFollowers(AbstractDB db, String username){

        List<UserInfo> followersList = new ArrayList<>();
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserRelationship WHERE follow=?")) {
                p.setString(1,username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                       followersList.add(UserInfoDAO.userInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return followersList;
    }
}
