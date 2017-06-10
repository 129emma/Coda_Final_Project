package code_project.Servlet;

import code_project.DAO.LoginInfoDAO;
import code_project.db.MySQL;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Writer;
import java.security.GeneralSecurityException;
import java.sql.SQLException;
import java.util.Collections;

//import com.google.api.client.json.jackson2.JacksonFactory;


/**
 * Created by qpen546 on 10/06/2017.
 */
public class GoogleLoginServlet extends HttpServlet {
    private MySQL mySQL = new MySQL();
    private boolean emailVerified;
    private String email, name, pictureUrl, locale, familyName, givenName, username;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Writer out = response.getWriter();
        HttpSession session = request.getSession();
        String idTokenString = request.getParameter("idToken");
        if (idTokenString != null) {
            try {
                verifyIdToken(idTokenString);
                LoginInfoDAO.createLoginInfo(mySQL, username,pictureUrl,givenName,familyName,email);
                session.setAttribute("status","login");
                session.setAttribute("username",username);
                out.write("success");
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
                out.write("fail");
            } catch (SQLException e) {
                out.write("fail");
            }
        }else{
            out.write("fail");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    protected void verifyIdToken(String idTokenString) throws GeneralSecurityException, IOException {

        NetHttpTransport transport = new NetHttpTransport();
        JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
                .setAudience(Collections.singletonList("782826346139-b034vt93v6m8483o8m4jf2d94hdsbhq6.apps.googleusercontent.com"))
                // Or, if multiple clients access the backend:
                //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                .build();

// (Receive idTokenString by HTTPS POST)

        GoogleIdToken idToken = verifier.verify(idTokenString);
        if (idToken != null) {
            GoogleIdToken.Payload payload = idToken.getPayload();

            // Print user identifier
            String userId = payload.getSubject();
            System.out.println("User ID: " + userId);

            // Get profile information from payload
            email = payload.getEmail();
            emailVerified = Boolean.valueOf(payload.getEmailVerified());
            name = (String) payload.get("name");
            pictureUrl = (String) payload.get("picture");
            locale = (String) payload.get("locale");
            familyName = (String) payload.get("family_name");
            givenName = (String) payload.get("given_name");

            // Use or store profile information
            username = "!GoogleID" + userId;
        } else {
            System.out.println("Invalid ID token.");
        }
    }

    protected void createAccount(String idTokenString) throws SQLException {
        LoginInfoDAO.createLoginInfo(mySQL, username,pictureUrl,givenName,familyName,email);
    }
}
