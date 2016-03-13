/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package toko1.model;

/**
 *
 * @author LenX
 */
public class User {
    private String id;
    private String nama;
    private String telp;
    private boolean admin;
    private int gaji;

    public User(String id, String nama, String telp, boolean admin, int gaji) {
        this.id = id;
        this.nama = nama;
        this.telp = telp;
        this.admin = admin;
        this.gaji = gaji;
    }

    public String getId() {
        return id;
    }

    public String getNama() {
        return nama;
    }

    public String getTelp() {
        return telp;
    }

    public boolean isAdmin() {
        return admin;
    }

    public int getGaji() {
        return gaji;
    }
    
}
