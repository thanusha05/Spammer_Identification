/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package GRPAHGENERATION;

/**
 *
 * @author alaguraj
 */
import DATA.DB;
import static GRPAHGENERATION.BipartiteGraphs.check;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Queue;

public class USERUSER {

    DB gt = new DB();
    ResultSet rs, rs1, rs2;

    public String[] UsrRelation(String User, String[] LUsrs) throws SQLException {
        int ulnt = userlentgh(User);
        String[] usr = new String[ulnt];
        int ptr = 0, l = 0, ln = LUsrs.length;
        for (l = 0; l < ln; l++) {
            rs = gt.Select("select * from friends where RE_FUMail='" + User + "' and RE_TUMail='" + LUsrs[l] + "' and Status='Accept''");
            if (rs.next()) {
                usr[ptr] = LUsrs[l];
                System.out.println(LUsrs[l]);
                ptr++;
            } else {
                rs2 = gt.Select("select * from friends where RE_TUMail='" + User + "' and RE_FUMail='" + LUsrs[l] + "' and Status='Accept''");
                if (rs2.next()) {
                    usr[ptr] = LUsrs[l];
                    System.out.println(LUsrs[l]);
                    ptr++;
                }
            }
        }
        return usr;
    }

    private int userlentgh(String User) throws SQLException {
        int llln = 0;
        rs1 = gt.Select("select count(*) from users where TYPE!='Product_Distributor'");
        if (rs1.next()) {
            llln = Integer.parseInt(rs1.getString(1));
        }
        return llln;

    }
}
