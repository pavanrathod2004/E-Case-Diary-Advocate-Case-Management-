import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/welcome-page")
public class WelcomePage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.print("<head>");
           out.print("<title>this is the Welcome Page</title>");
        out.print("</head>");
        out.print("<body>");
            out.print("<center>");
                out.print("<form action='validation-page'>");
                    out.print("Enter Your Name : <input type='text' name='name'>");
                    out.print("<br>");
                    out.print("Enter Your Password : <input type='password' name='password'");
                    out.print("<br>");
                    out.print("<br>");
                    out.print("<button type='submit' >submit</button>");
                out.print("</form>");
            out.print("</center>");
        out.print("</body>");

    }
}
