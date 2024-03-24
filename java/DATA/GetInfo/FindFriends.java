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
public class FindFriends {

    DB tru = new DB();
    ResultSet rs1, rs2, rs3, rs4, rs5;
    int olen, llen;

//Total USer Lists
    public int overusrtot(String uname) throws SQLException {
        rs1 = tru.Select("select count(*) from users where TYPE='Normal_User'and Mail_ID!='" + uname + "'");
        if (rs1.next()) {
            olen = rs1.getInt(1);
        }
        return olen;
    }

//Total USer Lists
    public int frrequest(String uname) throws SQLException {
        rs1 = tru.Select("select count(*) from friends where RE_TUMail='" + uname + "' and Status='Pending'");
        if (rs1.next()) {
            llen = rs1.getInt(1);
        }
        return llen;
    }

//USer mail id from request table
    public String requmail(String fdi) throws SQLException {
        String nnnma = "";
        rs1 = tru.Select("select * from friends where ID='" + fdi + "'");
        if (rs1.next()) {
            nnnma = rs1.getString("RE_FUMail");
        }
        return nnnma;
    }
    
//USer Name from request table
    public String requname(String fdi) throws SQLException {
        String nnnma1 = "";
        rs1 = tru.Select("select * from friends where ID='" + fdi + "'");
        if (rs1.next()) {
            nnnma1 = rs1.getString("RE_FUName");
        }
        return nnnma1;
    }   
}
