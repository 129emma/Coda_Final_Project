package code_project.Servlet;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;

import com.google.api.client.extensions.servlet.auth.oauth2.AbstractAuthorizationCodeServlet;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.javanet.NetHttpTransport;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;

/**
 * Created by qpen546 on 7/06/2017.
 */
public class GoogleAuthorizationCodeServlet extends AbstractAuthorizationCodeServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // do stuff
    }

    @Override
    protected String getRedirectUri(HttpServletRequest req) throws ServletException, IOException {
        GenericUrl url = new GenericUrl(req.getRequestURL().toString());
        url.setRawPath("/oauth2callback");
        return url.build();
    }

    @Override
    protected AuthorizationCodeFlow initializeFlow() throws IOException {
        return null;
//        new GoogleAuthorizationCodeFlow.Builder(
//                new NetHttpTransport(), JacksonFactory.getDefaultInstance(),
//                "[[ENTER YOUR CLIENT ID]]", "[[ENTER YOUR CLIENT SECRET]]",
//                Collections.singleton(CalendarScopes.CALENDAR)).setDataStoreFactory(
//                DATA_STORE_FACTORY).setAccessType("offline").build();
    }

    @Override
    protected String getUserId(HttpServletRequest req) throws ServletException, IOException {
        // return user ID
        return null;
    }
}

