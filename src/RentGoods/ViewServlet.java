package RentGoods;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by haoyun on 2017/4/26.
 */
public class ViewServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码格式
        req.setCharacterEncoding("UTF-8");
        //获取数据库连接、帐号、密码
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String password = getServletContext().getInitParameter("password");
        //获取请求路径
        String get = req.getRequestURI();
        RequestDispatcher requestDispatcher = null;
        //转发请求到对应路径
        switch (get){
            case "/signin":
                requestDispatcher = req.getRequestDispatcher("/pages/login.jsp");
                requestDispatcher.forward(req,resp);
                break;
            case "/publish":
                requestDispatcher = req.getRequestDispatcher("/pages/addGoods.jsp");
                requestDispatcher.forward(req,resp);
                break;
            case "/getPassChange":
                User user = (User) req.getSession().getAttribute("User");
                if (user==null){
                    resp.sendRedirect("/signin");
                    return;
                }
                req.getRequestDispatcher("/pages/updatePasswordSimple.jsp").forward(req,resp);
                break;
            case "/logout":
                req.getSession().removeAttribute("User");
                resp.sendRedirect("/");
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
