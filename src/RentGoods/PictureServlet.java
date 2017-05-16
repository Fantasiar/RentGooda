package RentGoods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

/**
 * Created by LingHanchen on 17/5/17.
 */
public class PictureServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getRequestURI();//获取要执行的操作
        //获取数据库的地址，帐号，密码
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String password = getServletContext().getInitParameter("password");
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(DB_URL,root,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String pid = req.getParameter("id");
        String sql = "SELECT pic FROM pictures WHERE pid=?";
        ResultSet set = null;
        try {
            PreparedStatement pstat = connection.prepareStatement(sql);
            pstat.setString(1,pid);
            set = pstat.executeQuery();
            set.next();
            InputStream in = set.getBinaryStream("pic");
            byte data[] = new byte[in.available()];
            in.read(data);
            OutputStream out = resp.getOutputStream();
            out.write(data);
            out.flush();
            out.close();
            in.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
