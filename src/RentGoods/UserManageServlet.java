package RentGoods;

import org.json.simple.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Set;

/**
 * Created by LingHanchen on 2017/4/21.
 */
@MultipartConfig
public class UserManageServlet extends HttpServlet{
    //处理POST方法
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        //获取数据库连接、账户、密码
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String root_password = getServletContext().getInitParameter("password");
        //获取执行的方法
        String method = req.getRequestURI();
        String username = null;
        String password = null;
        User user = null;
        PrintWriter writer = null;
        UserDAO dao = new UserDAO(DB_URL,root,root_password);
        try {
            dao.getConnection();    //建立数据库连接
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        switch (method){
            case "/login":
                //获取post内容
                username = req.getParameter("UserName");
                password = req.getParameter("Password");
                user = new User(username,password);
                writer = resp.getWriter();
                try {
                    if (dao.login(user)){
                        HttpSession session = req.getSession();
                        //添加属性到session
                        session.setAttribute("User",user);
                        writer.print("success");
                    }else {
                        writer.print("wrong");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                break;

                //注册
            case "/register":
                //获取POST内容
                username = req.getParameter("username");
                password = req.getParameter("password");
                user = new User(username,password);
                writer = resp.getWriter();
                try {
                    dao.signup(user);
                    req.getSession().setAttribute("User",user);
                    writer.print("success");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
                //个人信息管理
            case "/checkUser":
                username = req.getParameter("username");
                writer = resp.getWriter();
                try {
                    if (dao.checkUser(username)){
                        writer.print("true");
                    }else {
                        writer.print("false");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/UserInfoManage":
                user = (User) req.getSession().getAttribute("User");
                if (user==null){
                    resp.sendRedirect("/signin");
                    return;
                }
                //提取post信息
                user = (User)req.getSession().getAttribute("User");
                user.setStudentID(req.getParameter("studentid"));
                user.setSchool(req.getParameter("school"));
                user.setTelephone(req.getParameter("telephone"));
                user.setEmail(req.getParameter("email"));
                user.setSex(Integer.parseInt(req.getParameter("sex")));
                user.setNickName(req.getParameter("nickname"));
                try {
                    //将信息发往数据库更新
                    dao.changeUserInfo(user);
                    writer = resp.getWriter();
                    writer.print("Success");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/uploadHead":
                //获取当前登陆用户信息
                user = (User) req.getSession().getAttribute("User");
                if (user==null){
                    resp.sendRedirect("/signin");
                    return;
                }
                //获取图片裁剪情况
                int x=0,y=0,width=0,height=0,imgWidth=0,imgHeight=0;
                try {
                    x = Integer.parseInt(req.getParameter("x"));
                    y = Integer.parseInt(req.getParameter("y"));
                    height = Integer.parseInt(req.getParameter("height"));
                    imgHeight = Integer.parseInt(req.getParameter("imgHeight"));
                }catch (Exception e){
                    e.printStackTrace();
                }
                //获取文件名、根路径、文件绝对路径等
                Part image = req.getPart("file");
                String rootpath = getServletContext().getInitParameter("rootpath");
                String partpath = FileUtils.getFilePath(getServletContext().getInitParameter("Picspath"));
                try {
                    IDUtils idUtils = new IDUtils(1000);
                    String pid = String.valueOf(idUtils.generate());
                    String filename = FileUtils.getFilename(image);
                    //下载文件
                    FileUtils.downloadFile(image.getInputStream(),rootpath+partpath,filename);
                    if(x!=0||y!=0||width!=0||height!=0){
                        FileUtils.cutImage(rootpath+partpath+filename,x,y,height,imgHeight,pid);
                    }
                    user.setHead("/pic?id="+pid);
                    dao.uploadHead(user);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/changePassword":
                user = (User)req.getSession().getAttribute("User");
                String oldPassword = req.getParameter("old");
                String newPassword = req.getParameter("new");
                writer = resp.getWriter();
                if(user.getPassword().equals(oldPassword)){
                    user.setPassword(newPassword);
                    try {
                        dao.updatePassword(user);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    writer.print("success");
                }else {
                    writer.print("oldError");
                }
                break;
            default:

        }
        try {
            dao.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //处理GET方法
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        //获取数据库连接
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String root_password = getServletContext().getInitParameter("password");
        UserDAO dao = new UserDAO(DB_URL,root,root_password);
        //获取执行的动作
        String method = req.getRequestURI();
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("User");
        //验证是否登陆
        if (user == null){
            resp.sendRedirect("/signin");
            return;
        }
        try {
            dao.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        switch (method){
            //请求个人中心
            case "/UserInfo":
                try {
                    dao.getUserInfo(user);
                    dao.closeConnection();
                    session.setAttribute("User",user);
                    req.getRequestDispatcher("/pages/changeUserInfo.jsp").forward(req,resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/getUserChatInfo":
                String who = req.getParameter("who");
                try {
                    User chat = dao.getUserChatInfo(who);
                    JSONObject json = new JSONObject();
                    json.put("nickname",chat.getNickName());
                    json.put("head",chat.getHead());
                    PrintWriter writer = resp.getWriter();
                    writer.print(json.toJSONString());
                    break;
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            case "/getUserHead":
                try {
                    dao.getUserHead(user);
                    req.getSession().setAttribute("User",user);
                    req.getRequestDispatcher("/pages/uploadHead.jsp").forward(req,resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/UserManage":
                try {
                    dao.getUserHead(user);
                    session.setAttribute("User",user);
                    req.getRequestDispatcher("/pages/userhome.jsp").forward(req,resp);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
        try {
            dao.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
