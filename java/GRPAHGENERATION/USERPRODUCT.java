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
public class USERPRODUCT {

    DB gt = new DB();
    ResultSet rs, rs1, rs2;

   /* public String[] LUPdts(String[] Lurs,String[] pdts) throws SQLException {
        int ulnt = userlentgh(Lctn);
        String[] usr = new String[ulnt];
        int ptr = 0;
        rs = gt.Select("select * from users where City='" + Lctn + "' and TYPE!='Product_Distributor'");
        while (rs.next()) {
            usr[ptr] = rs.getString("F_Name");
            System.out.println(rs.getString("F_Name"));
            ptr++;
        }
        return usr;

    }

    private int userlentgh(String Lctn) throws SQLException {
        int llln = 0;
        rs1 = gt.Select("select count(*) from users where City='" + Lctn + "' and TYPE!='Product_Distributor'");
        if (rs1.next()) {
            llln = rs.getInt(1);
        }
        return llln;
    }*/
}
