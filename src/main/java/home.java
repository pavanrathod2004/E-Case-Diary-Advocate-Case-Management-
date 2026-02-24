import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/home-page")
public class home extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String uname = req.getParameter("name");
        String pass = req.getParameter("password");
        String email = (String) req.getAttribute("email");
        out.print("<h2>Hello this is Home Page </h2>");
        out.print("<h2>"+uname+"</h2>");
        out.print("<h2>"+email+"</h2>");


    }
}
