/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package GRPAHGENERATION;

import DATA.DB;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author alaguraj
 */
public class USERLOCATION {

    DB gt = new DB();
    ResultSet rs, rs1, rs2;
    int llln = 0;

    public String[] UsrsOnLocation(String Lctn) throws SQLException {

        int ulnt = userlentgh(Lctn);
        String[] usr = new String[ulnt];
        int ptr = 0;
        rs = gt.Select("select * from users where City='" + Lctn + "' and TYPE!='Product_Distributor'");
        while (rs.next()) {
            usr[ptr] = rs.getString("Mail_ID");
            System.out.println(rs.getString("Mail_ID"));
            ptr++;
        }
        return usr;

    }

    private int userlentgh(String Lctn) throws SQLException {

        rs1 = gt.Select("select count(*) from users where City='" + Lctn + "' and TYPE!='Product_Distributor'");
        if (rs1.next()) {
            llln = Integer.parseInt(rs1.getString(1));
        }
        return llln;
    }
}
