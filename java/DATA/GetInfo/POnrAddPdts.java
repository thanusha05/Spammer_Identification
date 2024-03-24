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
public class POnrAddPdts {

    DB db = new DB();
    ResultSet rs, rsa, rsb, rsc, rsd, rse, rsf;

//ShoName Getting
    public String shopname(String umail) throws SQLException {
        String snamepo = "";
        rsf = db.Select("select * from storedetls where SH_RUMail='" + umail + "'");
        if (rsf.next()) {
            snamepo = rsf.getString("SH_Name");
        }
        return snamepo;

    }

//Shop ID Getting
    public String shopID(String umail) throws SQLException {
        String sisop = "";
        rsf = db.Select("select * from storedetls where SH_RUMail='" + umail + "'");
        if (rsf.next()) {
            sisop = rsf.getString("ID");
        }
        return sisop;

    }

    //Product ID Getting
    public int PrdtsID() throws SQLException {
        int p1 = 0, p2 = 0;
        rsf = db.Select("select max(ID) from products");
        if (rsf.next()) {
            p1 = rsf.getInt(1);
        } else {
            p1 = 1;
        }
        p2 = p1 + 1;
        return p2;

    }

    //Method For Posts Length
    public int produtlen(String umail) throws SQLException {
        int pstlen = 0;
        rsa = db.Select("select count(*) from products where U_MailID='" + umail + "'");
        if (rsa.last()) {
            pstlen = rsa.getInt(1);
        }
        return pstlen;
    }

    //Method For Posts ID
    public String produtpstid() throws SQLException {
        String pdtlen = "";
        int flen = 0;
        rsa = db.Select("select max(ID) from ptdvisuals");
        if (rsa.last()) {
            flen = rsa.getInt(1);
        }
        flen = flen + 1;
        pdtlen = Integer.toString(flen);
        return pdtlen;
    }
}
