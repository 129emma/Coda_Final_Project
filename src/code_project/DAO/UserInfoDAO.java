package code_project.DAO;

import code_project.Info.UserInfo;
import code_project.db.AbstractDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

public class UserInfoDAO {

    public static List<UserInfo> getUserInfoList(AbstractDB db) {

        List<UserInfo> userInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserInfo")) {
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
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM UserInfo WHERE username = ?")) {
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
            try (PreparedStatement p = c.prepareStatement("UPDATE UserInfo set firstName = ?, lastName=?, email=?, birthDate=?, gender = ? WHERE username = ?;")) {
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

    public static void updateUserIcon(AbstractDB db, String icon,String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE UserInfo set icon=? WHERE username = ?;")) {
                p.setString(1, icon);
                p.setString(2, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteUserInfo(AbstractDB db, String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM UserInfo WHERE username = ?;")) {
                p.setString(1, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    private static UserInfo userInfoFromResultSet(ResultSet r) throws SQLException {
        return new UserInfo(
                r.getString("username"),
                r.getString("firstName"),
                r.getString("lastName"),
                r.getString("email"),
                r.getString("birthDate"),
                r.getString("gender"),
                r.getString("icon"));

    }

}
