/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package toko1.control;

import java.sql.SQLException;
import java.util.ArrayList;
import l_d.control.Database;
import toko1.model.Provider;
/**
 *
 * @author LenX
 */
public class CtrlProvider {
        private ArrayList<Provider> obj;
    
    private CtrlProvider(String where){
        java.sql.ResultSet r = Database.executeQuery("SELECT * FROM barang WHERE "+where);
        obj=new ArrayList<>();
        try {
            if(r.first()){
                obj.add(new Provider(r.getString("nama"),r.getString("telp")));
            }
        } catch (SQLException ex) {
            new l_d.dialog.ErrorLog(null, ex, true);
        }
    }
    
    public int size(){
        return obj.size();
    }
    
    public Provider get(int at){
        return obj.get(at);
    }
    
    public void remove(int at){
        obj.remove(at);
    }
    
    public static CtrlProvider get(String where){
        CtrlProvider c=new CtrlProvider(where);
        return (c.size()>0)?c:null;
    }
}
