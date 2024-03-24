/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DATA.GetInfo;

import DATA.DB;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author alaguraj
 */
public class MnubarDet {

    DB df = new DB();
    ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6;
    int unoti, uumsg, unoti1, uumsg1;
    String uname, uname1, uname2, uname3, uname4, uname5, uid;

//Method For Checking Notifications Are There Or Not for Single User
    public int cntnotific(String umail) throws SQLException {
        rs = df.Select("select count(*) from notification where T_UMID='" + umail + "' and D_UView='No'");
        if (rs.next()) {
            unoti = rs.getInt(1);
        }
        return unoti;

    }

//Method For Checking Messages Are There Or Not for Single User
    public int cntmessage(String umail) throws SQLException {
        rs = df.Select("select count(*) from chat where T_UMail='" + umail + "' and T_VSts='No'");
        if (rs.next()) {
            uumsg = rs.getInt(1);
        }
        return uumsg;

    }

//Method For Getting Single UserName
    public String username(String umail) throws SQLException {
        rs = df.Select("select * from users where Mail_ID='" + umail + "'");
        if (rs.next()) {
            System.out.println("frm mnu"+umail);
            uname1 = rs.getString("F_Name");
            uname2 = rs.getString("L_Name");
        }
        uname3 = uname1.concat(" " + uname2);
        return uname3;
    }

    //Method For Getting Single UserName
    public String latilangude(String umail) throws SQLException {
        rs = df.Select("select * from users where Mail_ID='" + umail + "'");
        if (rs.next()) {
            uname1 = rs.getString("Lat_Longtude");
        }
        return uname1;
    }

//Method For Getting Single User  ID
    public String userID(String umail) throws SQLException {
        rs = df.Select("select * from users where Mail_ID='" + umail + "'");
        if (rs.next()) {
            uid = rs.getString("ID");
        }
        return uid;
    }

//Method For Getting Single User Friends List
    public int fredlenth(String umail) throws SQLException {
        int frmax = 0;
        rs6 = df.Select("select count(*) from friends where (RE_FUMail='" + umail + "' OR RE_TUMail='" + umail + "') and Status='Accept'");
        if (rs6.next()) {
            frmax = rs6.getInt(1);
        }
        return frmax;
    }

//Method For Getting Product ID
    public String postid() throws SQLException {
        String sfnl = "";
        rs6 = df.Select("select * from ptdvisuals");
        if (rs6.last()) {
            sfnl = rs6.getString("ID");
        }
        return sfnl;
    }

//Method For Posts Length
    public int postlen() throws SQLException {
        int pstlen = 0;
        rs2 = df.Select("select count(*) from ptdvisuals");
        if (rs2.last()) {
            pstlen = rs2.getInt(1);
        }
        return pstlen;
    }

//Products Length identifying
    public int productlen() throws SQLException {
        int pstlen = 0;
        rs2 = df.Select("select count(*) from ptdvisuals where Vis_Types='Product'");
        if (rs2.last()) {
            pstlen = rs2.getInt(1);
        }
        return pstlen;
    }

//Method For identifying friends list based length
    public int frndslen(String cumail) throws SQLException {
        int flen = frmmefrnds(cumail);
        int tlen = tomefrnds(cumail);
        int flen1 = flen + tlen;
        return flen1;
    }

    private int frmmefrnds(String cumail) throws SQLException {
        int lln = 0;
        ResultSet ygh = df.Select("select count(*) from friends where RE_FUMail='" + cumail + "' and Status='Accept'");
        if (ygh.next()) {
            lln = ygh.getInt(1);
        }
        return lln;
    }

    private int tomefrnds(String cumail) throws SQLException {
        int lln = 0;
        ResultSet ygh = df.Select("select count(*) from friends where RE_TUMail='" + cumail + "' and Status='Accept'");
        if (ygh.next()) {
            lln = ygh.getInt(1);
        }
        return lln;
    }

    //Events Length identifying
    public int eventlen(String LAt) throws SQLException {
        int pstlen = 0;
        rs2 = df.Select("select count(*) from event where City='" + LAt + "'");
        if (rs2.last()) {
            pstlen = rs2.getInt(1);
            System.out.println("------------------------------\t Event Length is \t"+pstlen);
        }
        return pstlen;
    }
}
