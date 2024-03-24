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
public class PRODUCTS {

    DB gt = new DB();
    ResultSet rs, rs1, rs2;

    public String[] LUPdts(String Ltion) throws SQLException {
        int ulnt = pdslnentgh(Ltion);
        String[] pdts = new String[ulnt];
        int ptr = 0;
        rs = gt.Select("select * from ptdvisuals where City='" + Ltion + "' and Vis_Types='Product'");
        while (rs.next()) {
            pdts[ptr] = rs.getString("Pdt_ID");
            System.out.println("PRODUVTS " + ptr + "\t" + rs.getString("Pdt_ID"));
            ptr++;
        }
        return pdts;
    }

    private int pdslnentgh(String Ltion) throws SQLException {
        int llln = 0;
        rs1 = gt.Select("select count(*) from ptdvisuals where City='" + Ltion + "' and Vis_Types='Product'");
        if (rs1.next()) {
            llln = rs1.getInt(1);
        }
        return llln;
    }

    public String[] LUPdtsRating(String[] Usrs, String[] Pdts, String LOC) throws SQLException {
        int ulnt = Pdts.length;
        int ul = Usrs.length;
        String[] pdts = new String[ulnt];
        String[] pdtslen = new String[ulnt];
        int ptr = 0, l = 0, ll = 0;
        int rt = 0, ot = 0;
        /*  for (l = 0; l < ulnt; l++) {
         for (ll = 0; ll < ul; ll++) {
         rs = gt.Select("select * from rating where ID='" + Pdts[l] + "'  and R_UserMail='" + Usrs[ll] + "'");
         if (rs.next()) {
         rt = rt + rs.getInt("Rate");
         pdts[ptr] = Pdts[l];
         System.out.println("---------------------- Hihger Rated Producrts \t" + Pdts[l]);
         ptr++;
         }else {
         rs = gt.Select("select * from rating where Post_ID='" + Pdts[l] + "'  and R_UserMail='" + Usrs[l] + "'");
         if (rs1.next()) {
         pdts[ptr] = Pdts[l];
         System.out.println(Pdts[l]);
         ptr++;
         }
         }
         }
         ot = rt / ul;
         pdtslen[l] = String.valueOf(ot);
         ot = 0;
         rt = 0;
         }
         /* rs = gt.Select("select * from rating where City='" + Ltion + "'  and Vis_Types='Product'");
         while (rs.next()) {
         pdts[ptr] = rs.getString("F_Name");
         System.out.println(rs.getString("F_Name"));
         ptr++;
         }*/
        rs = gt.Select("select distinct(Post_ID) from rating where City='" + LOC + "' order by ID desc");
        while (rs.next()) {
            //rt = rt + rs.getInt(1);
            pdts[ptr] = rs.getString(1);
            System.out.println("---------------------- Hihger Rated Producrts \t" + rs.getString("Post_ID"));
            ptr++;
        }
        return pdts;

    }

    /*  private int pdslnentgh(String Ltion) throws SQLException {
     int llln = 0;
     rs1 = gt.Select("select count(*) from ptdvisuals where City='" + Ltion + "' and Vis_Types='Product'");
     if (rs1.next()) {
     llln = rs.getInt(1);
     }
     return llln;
     }*/
}
