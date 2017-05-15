package RentGoods;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by haoyun on 2017/4/26.
 */
@MultipartConfig
public class GoodsManageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");  //设置编码格式
        String method = req.getRequestURI();//获取要执行的操作
        //获取数据库的地址，帐号，密码
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String password = getServletContext().getInitParameter("password");
        //声明数据库对象
        GoodsDAO goodsDAO = new GoodsDAO(DB_URL, root, password);
        try {
            goodsDAO.getConnection();   //连接数据库
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        switch (method) {
            case "/addGoods":
                try {
                    IDUtils idUtils = new IDUtils(1000);
                    String id = String.valueOf(idUtils.generate());  //唯一ID生存
                    //获取post内容
                    String name = req.getParameter("name");
                    String type = req.getParameter("type");
                    String fineness = req.getParameter("fineness");
                    String description = req.getParameter("description");
//                    String owner = ((User)req.getSession().getAttribute("User")).getUserName();
                    String phone = req.getParameter("phone");
                    Goods item = new Goods(id, name, type, fineness, description, "root", 0);
                    //接受图片
                    Collection<Part> parts = req.getParts();
                    ArrayList<String> picpaths = new ArrayList<String>();
                    //接收文件
                    for (Part part : parts) {
                        if (!part.getName().equals("photo")) {
                            continue;
                        } else {
                            String filename = FileUtils.getFilename(part);  //获取文件名
                            String partpath = FileUtils.getFilePath(getServletContext().getInitParameter("Picspath"));
                            FileUtils.downloadFile(part.getInputStream(), getServletContext().getInitParameter("rootpath") + partpath, filename);
                            picpaths.add(partpath + filename);
                        }
                    }
                    item.setPictures(picpaths);
                    goodsDAO.addGoods(item);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
        try {
            goodsDAO.closeConnection(); //关闭数据库连接
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");  //设置编码格式
        String method = req.getRequestURI();    //获取get路径
        //获取数据库的连接、帐号、密码
        String DB_URL = getServletContext().getInitParameter("DB_URL");
        String root = getServletContext().getInitParameter("username");
        String password = getServletContext().getInitParameter("password");
        GoodsDAO goodsDAO = new GoodsDAO(DB_URL, root, password);
        try {
            goodsDAO.getConnection();   //建立数据库连接
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //请求主页，这里面需要给主页返回四个list，轮播图以后再说
        if (method.equals("/home")) {
            try {
                ArrayList<Goods> book = goodsDAO.getGoodsByType(8,"book");
                ArrayList<Goods> sport = goodsDAO.getGoodsByType(8,"sport");
                ArrayList<Goods> IT = goodsDAO.getGoodsByType(8,"IT");

                req.setAttribute("book", book);    //添加HttpServletRequest属性
                req.setAttribute("sport", sport);    //添加HttpServletRequest属性
                req.setAttribute("IT", IT);    //添加HttpServletRequest属性
                //转发请求到jsp文件
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/index.jsp");
                requestDispatcher.forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //获取特定ID的商品
        if (method.startsWith("/showItem")) {
            String id = req.getParameter("id");
            try {
                Goods good = goodsDAO.getGood(id);
                req.setAttribute("item", good);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/item.jsp");
                requestDispatcher.forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(method.startsWith("Search")){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/pages/shop.jsp");
            requestDispatcher.forward(req, resp);

        }
        if(method.startsWith("/Query")){
            String keyword=req.getParameter("keyword");
            String sortMethod=req.getParameter("sortMethod");
            int currentNum=Integer.parseInt(req.getParameter("currentNum"));
            int NumInAPage=Integer.parseInt(req.getParameter("NumInAPage"));

            try {
                ArrayList<Goods> goods=goodsDAO.Search(keyword,sortMethod);
                int end=goods.size()<currentNum+NumInAPage?goods.size()-1:currentNum+NumInAPage-1;
                String json="{\"info\":{\"allNum\":"+goods.size()+",\"end\":"+end+"},";

                String goodsJSON="\"goods\":[";
                for (int i=currentNum;i<end;i++){
                    Goods tmp=goods.get(i);
                    goodsJSON+="{\"id\":\""+tmp.getId()+"\","+"\"cover\":\""+tmp.getPictures().get(0)+"\",\"name\":\""+tmp.getName()+"\",+\"price\":"+Double.toString(tmp.getPrice())+"},";
                }
                goodsJSON=goodsJSON.substring(0,goodsJSON.length()-1);
                goodsJSON+="]";
                json=json+goodsJSON+"}";
                resp.setContentType("application/json; charset=utf-8");
                PrintWriter out=resp.getWriter();
                out.write(json);
                out.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
