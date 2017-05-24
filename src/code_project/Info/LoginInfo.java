package code_project.Info;

import java.sql.Blob;
import java.sql.SQLException;

/**
 * Represents an article, which has a title and a body of text.
 */
public class LoginInfo {

    private String username;
    private byte[] password,salt;

    public LoginInfo(String username, Blob password, Blob salt) throws SQLException {
        this.username = username;
        this.password = password.getBytes(1,(int) password.length());
        this.salt = salt.getBytes(1, (int) salt.length());

    }

    public String getUsername() {
        return username;
    }

    public byte[] getPassword() {
        return password;
    }

    public byte[] getSalt() { return salt; }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(byte[] password) {
        this.password = password;
    }
}