/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package GRPAHGENERATION;

import DATA.DB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author alaguraj
 */
public class RMDPDTS {

    DB db = new DB();
    ResultSet rs, rs1;
    USERLOCATION ul = new USERLOCATION();
    USERUSER uu = new USERUSER();
    PRODUCTS pp = new PRODUCTS();
    USERPRODUCT upt = new USERPRODUCT();
    ArrayList<String> rating = new ArrayList<String>();

    public String[] RecomPrdts(String location, String Name) throws SQLException {
        int ty = 0, ty1 = 0, ty2 = 0;
        String[] lusrs = ul.UsrsOnLocation(location);               
        //String[] usrusr = uu.UsrRelation(Name, lusrs);
        String[] pdts = pp.LUPdts(location);               
        String[] ptrating = pp.LUPdtsRating(lusrs, pdts,location);               
        // String[] usrpdt = upt.LUPdts(lusrs, pdts);

        return ptrating;
    }
}
