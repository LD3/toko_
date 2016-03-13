/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package toko1.model.table;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import l_d.control.Database;
import toko1.model.Barang;

/**
 *
 * @author LenX
 */
public class ModelCariBarang extends javax.swing.table.DefaultTableModel {
    public ModelCariBarang(){
        super(new String[]{"Nama","Provider","Jenis","Harga","Stok"},0);
    }
    @Override
    public boolean isCellEditable(int row, int column){
        return false;
    }
    public void addRow(Barang b){
        java.sql.ResultSet r=Database.executeQuery("SELECT nama FROM provider WHERE telp=\'"+b.getProvider()+"\'");
        try {
            if(r.first())
                addRow(new Object[]{b.getNama(),r.getString(1),b.getJenis(),b.getHarga(),b.getPotongan()});
        } catch (SQLException ex) {
            new l_d.dialog.ErrorLog(null,ex,true);
        }
    }
}
