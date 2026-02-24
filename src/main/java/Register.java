import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/register_data")
public class Register extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String uname = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        Connection con = null;
        PreparedStatement ps= null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advocatedata", "root", "Pass@123");

            PreparedStatement selectmail = con.prepareStatement("select  * from advocates where email=?");
            selectmail.setString(1, email);
            ResultSet setOfEmail = selectmail.executeQuery();

            if (setOfEmail.next()) {
                        req.setAttribute("error","this email alredy used");
                RequestDispatcher dis = req.getRequestDispatcher("register.jsp");
                dis.forward(req,resp);
            }else {
                ps = con.prepareStatement("insert into  advocates(username,email,password,phone) values(?,?,?,?)");
                ps.setString(1, uname);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, phone);

                int countRecord = ps.executeUpdate();
                if (countRecord > 0) {
                    resp.sendRedirect("index.jsp");
                } else {
                    resp.sendRedirect("error.jsp");
                }
            }
            }catch(Exception e){
                e.printStackTrace();
            }
        finally{
                try {
                    if (ps != null)
                        ps.close();
                    if (con != null)
                        con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


    }
}
