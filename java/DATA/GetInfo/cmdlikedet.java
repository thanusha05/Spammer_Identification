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
public class cmdlikedet {

    DB dd = new DB();
    ResultSet rs, rs1, rs2, rs3, rs4, rs5, rs6, rs7, rs8;
    int cltcnt, cmntlenl;

//Total Like For Evry Posts
    public int sinlikes(String psid) throws SQLException {
        rs8 = dd.Select("Select  count(*) from likes where Post_ID='" + psid + "' and ULORUL='Like'");
        if (rs8.next()) {
            cltcnt = rs8.getInt(1);
        } else {
            cltcnt = 0;
        }
        return cltcnt;
    }

//Total Comments For Evry Posts
    public int sincmmnts(String psid) throws SQLException {
        rs7 = dd.Select("Select count(*) from comments where Post_ID='" + psid + "'");
        if (rs7.next()) {
            cmntlenl = rs7.getInt(1);
        } else {
            cmntlenl = 0;
        }
        return cmntlenl;
    }

    //Total Likes
    public int ttllikes(String psid) throws SQLException {
        rs7 = dd.Select("Select count(*) from comments where Post_ID='" + psid + "'");
        if (rs7.next()) {
            cmntlenl = rs7.getInt(1);
        } else {
            cmntlenl = 0;
        }
        return cmntlenl;
    }

//Post Visual FileName
    public String filenames(String psid) throws SQLException {
        String fffname = "";
        rs7 = dd.Select("Select * from ptdvisuals where ID='" + psid + "'");
        if (rs7.next()) {
            fffname = rs7.getString("F_Name");
        }
        return fffname;
    }
    
//Post Visual File Type
    public String fileType(String psid) throws SQLException {
        String ffftype = "";
        rs5 = dd.Select("Select * from ptdvisuals where ID='" + psid + "'");
        if (rs5.next()) {
            ffftype = rs5.getString("Vis_Types");
        }
        return ffftype;
    }  
    
//Total Ratings For Evry Posts
    public int ratingpdt(String psid) throws SQLException {
        rs7 = dd.Select("Select Avg(Rate) from rating where Post_ID='" + psid + "'");
        if (rs7.next()) {
            cmntlenl = rs7.getInt(1);
        } else {
            cmntlenl = 0;
        }
        return cmntlenl;
    }    
}
