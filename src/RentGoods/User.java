package RentGoods;

/**
 * Created by Fantasia on 2017/4/26.
 */
public class User {
    private String userName;
    private String password;
    private String studentID;
    private String school;
    private String telephone;
    private String email;
    private String head;
    private int sex;
    private double credit;
    private String nickName;

    public User(){}

    public User(String userName, String password){
        this.userName = userName;
        this.password = password;
        nickName=userName;
        studentID = "";
        school = "";
        telephone = "";
        email = "";
        head = "";
        sex = 0;
        credit = 0;
    }

    public String getUserName(){
        return userName;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    double getCredit() {
        return credit;
    }

    void setCredit(double credit) {
        this.credit = credit;
    }

    public void addCredit(double value){
        this.credit += value;
    }

    public int getSex() {

        return sex;
    }

    void setSex(int sex) {
        this.sex = sex;
    }

    public String getHead() {

        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getEmail() {

        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {

        return telephone;
    }

    void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSchool() {

        return school;
    }

    void setSchool(String school) {
        this.school = school;
    }

    public String getStudentID() {

        return studentID;
    }

    void setStudentID(String studentID) {
        this.studentID = studentID;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    void setNickName(String nickname) {
        this.nickName = nickname;
    }

    public String getNickName() {

        return nickName;
    }
}
