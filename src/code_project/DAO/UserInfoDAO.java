package code_project.DAO;

import code_project.Info.UserInfo;
import code_project.db.AbstractDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

/**
 * Allows us to get articles from elsewhere in the code without worrying about SQL statements.
 */
public class UserInfoDAO {

    /**
     * Gets all {@link UserInfo}s from the given {@link AbstractDB}.
     *
     * @param db
     * @return
     */
    public static List<UserInfo> getUserInfoList(AbstractDB db) {

        List<UserInfo> userInfoList = new ArrayList<>();

        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM User_Info")) {
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
            try (PreparedStatement p = c.prepareStatement("SELECT * FROM User_Info WHERE username = ?")) {
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

    public static void updateUserInfo(AbstractDB db, String username,String firstName, String lastName, String email, String birth_date, String gender, String icon) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("UPDATE User_Info set firstName = ?, lastName=?, email=?, birth_date=?, gender = ?, icon=? WHERE username = ?;")) {
                p.setString(1, firstName);
                p.setString(2, lastName);
                p.setString(3, email);
                p.setString(4, birth_date);
                p.setString(5, gender);
                p.setString(6, icon);
                 p.setString(7, username);
                p.executeUpdate();
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void deleteUserInfo(AbstractDB db, String username) throws SQLException {
        try (Connection c = db.connection()) {
            try (PreparedStatement p = c.prepareStatement("DELETE * FROM User_Info WHERE username = ?;")) {
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
                r.getString("username"),
                r.getString("firstName"),
                r.getString("lastName"),
                r.getString("email"),
                r.getString("birth_date"),
                r.getString("gender"),
                r.getString("icon"));

    }

}
