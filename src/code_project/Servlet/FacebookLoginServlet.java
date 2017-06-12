package code_project.Servlet;

/**
 * Created by qpen546 on 11/06/2017.
 */
//public class FacebookLoginServlet extends HttpServlet{
//    private static final long serialVersionUID = 1L;
//    private String code="";
//
//    public void service(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//        code = req.getParameter("code");
//        if (code == null || code.equals("")) {
//            throw new RuntimeException(
//                    "ERROR: Didn't get code parameter in callback.");
//        }
//        FBConnection fbConnection = new FBConnection();
//        String accessToken = fbConnection.getAccessToken(code);
//
//        FBGraph fbGraph = new FBGraph(accessToken);
//        String graph = fbGraph.getFBGraph();
//        Map<String, String> fbProfileData = fbGraph.getGraphData(graph);
//        ServletOutputStream out = res.getOutputStream();
//        out.println("<h1>Facebook Login using Java</h1>");
//        out.println("<h2>Application Main Menu</h2>");
//        out.println("<div>Welcome "+fbProfileData.get("first_name"));
//        out.println("<div>Your Email: "+fbProfileData.get("email"));
//        out.println("<div>You are "+fbProfileData.get("gender"));
//    }
//    http://soupkodjou.com/authenticate-and-execute-facebook-graph-api-requests-from-a-java-servlet-step-by-step/
//}
