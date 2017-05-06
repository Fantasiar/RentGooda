package RentGoods;

/**
 * Created by Fantasia on 2017/4/26.
 */
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Fantasia on 2017/4/25.
 */
public class GoodsDAO {
    private Connection connection;
    private String DB_URL;
    private String User;
    private String password;

    public GoodsDAO(String DB_URL, String user, String password) {
        this.DB_URL = DB_URL;
        User = user;
        this.password = password;
    }

    public void getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(DB_URL,User,password);
    }
    public void closeConnection() throws SQLException {
        connection.close();
    }

    public void addGoods(Goods goods) throws SQLException {
        String sql = "insert into goodsInfo(id,name,type,fineness,description,ownerId,dateChanged) values(?,?,?,?,?,?,now())";
        PreparedStatement ps=connection.prepareStatement(sql);
        ps.setString(1,goods.getId());
        ps.setString(2,goods.getName());
        ps.setString(3,goods.getType());
        ps.setString(4,goods.getFineness());
        ps.setString(5,goods.getDescription());
        ps.setString(6,goods.getOwnerId());
        ps.execute();
        for(String path : goods.getPictures()){
            String updatePic = "insert into pictures(picpath,id,main) values(?,?,?)";
            PreparedStatement pspic = connection.prepareStatement(updatePic);
            pspic.setString(1,path);
            pspic.setString(2,goods.getId());
            pspic.setInt(3,0);
            pspic.execute();
        }
    }

    public ArrayList<Goods> getGoods(int number) throws SQLException {
        ArrayList<Goods> goods = new ArrayList<>();
        String getinfo = "select name,id from goodsInfo order by dateChanged limit ?";
        PreparedStatement preparedStatement = connection.prepareStatement(getinfo);
        preparedStatement.setInt(1,number);
        ResultSet set = preparedStatement.executeQuery();
        while (set.next()){
            Goods item = new Goods();
            item.setName(set.getString("name"));
            item.setPictures(getPictures(set.getString("id")));
            goods.add(item);
        }
        return goods;
    }

    public ArrayList<String> getPictures(String id) throws SQLException {
        ArrayList<String> pictures = new ArrayList<>();
        String getPics = "select picpath from pictures where id=? and main='0' ";
        PreparedStatement pst = connection.prepareStatement(getPics);
        pst.setString(1,id);
        ResultSet set = pst.executeQuery();
        while (set.next()){
            pictures.add(set.getString("picpath"));
        }
        return pictures;
    }
}
