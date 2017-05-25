package code_project.DAO;

import code_project.Info.LoginInfo;
import code_project.db.AbstractDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Allows us to get articles from elsewhere in the code without worrying about SQL statements.
 */
public class LoginInfoDAO {

    public static List<String> getUsernameList(AbstractDB db) {
        List<String> usernameList = new ArrayList<>();
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT username FROM User_Info")) {
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

    public static LoginInfo getLoginInfo(AbstractDB db, String username) {
        LoginInfo loginInfo = null;
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM User_Info WHERE username = ?")) {
                p.setString(1, username);
                try (ResultSet r = p.executeQuery()) {
                    while (r.next()) {
                        loginInfo = loginInfoFromResultSet(r);
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return loginInfo;
    }

    public static void createLoginInfo(AbstractDB db, String username, byte[] password , byte[] salt) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("INSERT INTO User_Info (username, password, salt) VALUE (?,?,?);")) {
                p.setString(1, username);
                p.setBytes(2, password);
                p.setBytes(3, salt);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void updateLoginInfo(AbstractDB db, String username, byte[] password , byte[] salt) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE User_Info SET password = ?, salt = ? WHERE username = ?;")) {
                p.setBytes(1, password);
                p.setBytes(2, salt);
                p.setString(3, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private static LoginInfo loginInfoFromResultSet(ResultSet r) throws SQLException {
        return new LoginInfo(
                r.getString("username"),
                r.getBlob("password"),
                r.getBlob("salt"));
    }

}
