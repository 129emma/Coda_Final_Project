package DAO;

import db.AbstractDB;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Allows us to get articles from elsewhere in the code without worrying about SQL statements.
 */
public class UserInfoDAO {

    /**
     * Gets all {@link UserInfo}s from the given {@link AbstractDB}.
     * @param db
     * @return
     */
    public static List<UserInfo> getUserInfoList(AbstractDB db) {

        List<UserInfo> userInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM dblab18_ex02_userinfo")) {
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
     * @param db
     * @return
     */
    public static List<String> getUsernameList(AbstractDB db) {

        List<String> usernameList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT username FROM dblab18_ex02_userinfo")) {


                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        usernameList.add(r.getString("username"));
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return usernameList;
    }

    public static UserInfo getUserInfo(AbstractDB db, String username) {

        UserInfo userInfo = null;

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM dblab18_ex02_userinfo WHERE username = ?")) {
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

    public static void createUserInfo(AbstractDB db, String firstName, String lastName, String username, String email ) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO dblab18_ex02_userinfo VALUES (?, ?, ?, ?);")) {

                p.setString(1, firstName);
                p.setString(2, lastName);
                p.setString(3, username);
                p.setString(4, email);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteUserInfo(AbstractDB db, String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE FROM dblab18_ex02_userinfo WHERE username = ?;")) {
                p.setString(1, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    /**
     * Extract a {@link UserInfo} object from a given {@link ResultSet}
     *
     * @param r The {@link ResultSet} to extract a {@link UserInfo} from
     * @return A valid {@link UserInfo} object, representing a row from the {@link ResultSet}
     * @throws SQLException Generated in the case of an out-of-bounds column index, or for an invalid {@link ResultSet}
     */
    private static UserInfo userInfoFromResultSet(ResultSet r) throws SQLException {
        return new UserInfo(
                r.getString("firstName"),
                r.getString("lastName"),
                r.getString("username"),
                r.getString("email"));
    }

}
