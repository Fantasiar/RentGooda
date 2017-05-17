package RentGoods;

import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by LingHanchen on 17/5/6.
 */
public class FileUtils {
    //获取以当前时间为名字的文件名
    public static String getFilename(Part part) throws InterruptedException, IOException {
        String type = part.getHeader("content-disposition");
        type = type.substring(type.lastIndexOf("."), type.lastIndexOf("\""));
        String filename = DateUtils.getStringDate() + type;
        return filename;
    }
    //获取文件路径
    public static String getFilePath(String directory){
        return directory+DateUtils.getYear()+"/"+DateUtils.getMonth()+"/"+DateUtils.getDay()+"/";
    }
    //下载文件到对应路径
    public static void downloadFile(InputStream in,String rootpath,String filename) throws IOException {
        File file = new File(rootpath);
        if(!file.exists()){
            file.mkdirs();
        }
        file = new File(rootpath+filename);
        BufferedInputStream reader = new BufferedInputStream(in);
        FileOutputStream writer = new FileOutputStream(file);
        byte[] data = new byte[1024];
        int flag = reader.read(data,0,data.length);
        while (flag!=-1){
            writer.write(data);
            flag = reader.read(data,0,data.length);
        }
        writer.flush();
        reader.close();
        writer.close();
    }

    public static void downloadFile(InputStream in,String id,int main,String pid,String DB_URL,String root,String password) throws SQLException, IOException {
        Connection connection = DriverManager.getConnection(DB_URL,root,password);
        String add = "INSERT INTO pictures(id,main,pic,pid,picpath) VALUES (?,?,?,?,?)";
        PreparedStatement pstat = connection.prepareStatement(add);
        pstat.setString(1,id);
        pstat.setInt(2,main);
        pstat.setBinaryStream(3,in,in.available());
        pstat.setString(4,pid);
        pstat.setString(5,"/pic?id="+pid);
        pstat.execute();
        in.close();
        connection.close();
    }
    public static void downloadFile(InputStream in,String pid,String DB_URL,String root,String password) throws SQLException, IOException {
        Connection connection = DriverManager.getConnection(DB_URL,root,password);
        String add = "INSERT INTO pictures(main,pic,pid,picpath) VALUES (?,?,?,?)";
        PreparedStatement pstat = connection.prepareStatement(add);
        pstat.setInt(1,3);
        pstat.setBinaryStream(2,in,in.available());
        pstat.setString(3,pid);
        pstat.setString(4,"/pic?id="+pid);
        pstat.execute();
        in.close();
        connection.close();
    }

    public static void cutImage(String filepath,int x,int y,int height,int imgHeight,String pid) throws IOException, SQLException {
        File image = new File(filepath);
        String fileType = filepath.substring(filepath.lastIndexOf(".")+1);
        BufferedImage cutimage = ImageIO.read(image);
        int finalHeight = height*cutimage.getHeight()/imgHeight;
        int finalX = x*cutimage.getHeight()/imgHeight;
        int finalY = y*cutimage.getHeight()/imgHeight;
        if (finalHeight >= cutimage.getHeight()){
            finalHeight = cutimage.getHeight();
        }
        if (finalX >= cutimage.getWidth()){
            finalX = cutimage.getWidth();
        }
        if ((finalY >= cutimage.getHeight())){
            finalY = cutimage.getHeight();
        }
        cutimage = cutimage.getSubimage(finalX,finalY,finalHeight,finalHeight);
        image.delete();
        ImageIO.write(cutimage,fileType,image);
        String DB_URL = "jdbc:mysql://neu.sqwe.tk:3306/RentGood";
        String root = "neusc";
        String password = "neusc1505";
        FileInputStream inputStream = new FileInputStream(image);
        downloadFile(inputStream,pid,DB_URL,root,password);
        image.delete();
        inputStream.close();
    }
}
