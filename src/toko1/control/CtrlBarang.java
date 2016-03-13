/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package toko1.control;

import java.sql.SQLException;
import java.util.ArrayList;
import l_d.control.Database;
import toko1.model.Barang;

/**
 *
 * @author LenX
 */
public class CtrlBarang {
    private ArrayList<Barang> obj;
    
    private CtrlBarang(String where){
        java.sql.ResultSet r = Database.executeQuery("SELECT * FROM barang WHERE "+where);
        obj=new ArrayList<>();
        try {
            if(r.first()){
                obj.add(new Barang(r.getString("kode"),r.getString("nama"),r.getString("provider"),r.getString("jenis"),r.getInt("stok"),r.getInt("stok"), r.getByte("potongan")));
            }
        } catch (SQLException ex) {
            new l_d.dialog.ErrorLog(null, ex, true);
        }
    }
    
    public int size(){
        return obj.size();
    }
    
    public Barang get(int at){
        return obj.get(at);
    }
    
    public void remove(int at){
        obj.remove(at);
    }
    
    public static CtrlBarang get(String where){
        CtrlBarang c=new CtrlBarang(where);
        return (c.size()>0)?c:null;
    }
}
