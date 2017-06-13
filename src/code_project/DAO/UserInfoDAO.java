package code_project.DAO;

import code_project.Info.UserInfo;
import code_project.db.AbstractDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDAO {

    public static List<UserInfo> getUserInfoList(AbstractDB db) {

        List<UserInfo> userInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserInfo_beta_1")) {
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        userInfoList.add(userInfoFromResultSet(r));
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return userInfoList;

    }

    /**
     * Gets the {@link UserInfo} with the given id from the given {@link AbstractDB}.
     *
     * @param db
     * @return
     */

    public static UserInfo getUserInfo(AbstractDB db, String username) {
        UserInfo userInfo = null;
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserInfo_beta_1 WHERE username = ?")) {
                p.setString(1, username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        userInfo = userInfoFromResultSet(r);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    public static void updateUserInfo(AbstractDB db, String username,String firstName, String lastName, String email, String birthDate, String gender) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE UserInfo_beta_1 set firstName = ?, lastName=?, email=?, birthDate=?, gender = ? WHERE username = ?;")) {
                p.setString(1, firstName);
                p.setString(2, lastName);
                p.setString(3, email);
                p.setString(4, birthDate);
                p.setString(5, gender);
                p.setString(6, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void updateUserIcon(AbstractDB db, String avatar,String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE UserInfo_beta_1 set avatar=? WHERE username = ?;")) {
                p.setString(1, avatar);
                p.setString(2, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteUserInfo(AbstractDB db, String username) throws SQLException {
        try (Connection c = db.connection()) {
            try(PreparedStatement a=c.prepareStatement("DELETE FROM UserInfo_beta_1 WHERE username = ?")){
                a.setString(1,username);
                a.executeUpdate();
            }



        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

 public static List<UserInfo> getUsersList(AbstractDB db,List<String> usernameList)throws SQLException{
List<UserInfo> userList=new ArrayList<>();
     try (Connection c = db.connection()) {
         for(String name:usernameList){
             try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserInfo_beta_1 WHERE username = ?")) {
                 p.setString(1, name);
                 try (ResultSet r = p.executeQuery()) {
                     while (r.next()) {
                         UserInfo userInfo = userInfoFromResultSet(r);
                         userList.add(userInfo);
                     }
                 }
             }
         }
         } catch (ClassNotFoundException e) {
         e.printStackTrace();
     }

        return userList;
 }

    public static UserInfo userInfoFromResultSet(ResultSet r) throws SQLException {
        return new UserInfo(
                r.getString("username"),
                r.getString("firstName"),
                r.getString("lastName"),
                r.getString("email"),
                r.getString("birthDate"),
                r.getString("gender"),
                r.getString("avatar"));
    }

}
