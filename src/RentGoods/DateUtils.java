package RentGoods;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LingHanchen on 17/5/6.
 */
public class DateUtils {
    public static String getStringDate(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(new Date());
    }
    public static String getYear(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        return sdf.format(new Date());
    }
    public static String getMonth(){
        SimpleDateFormat sdf = new SimpleDateFormat("MM");
        return sdf.format(new Date());
    }
    public static String getDay(){
        SimpleDateFormat sdf = new SimpleDateFormat("dd");
        return sdf.format(new Date());
    }
}
