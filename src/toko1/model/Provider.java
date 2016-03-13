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
public class Provider {
    private final String nama;
    private final String telp;

    public String getNama() {
        return nama;
    }

    public String getTelp() {
        return telp;
    }

    public Provider(String nama, String telp) {
        this.nama = nama;
        this.telp = telp;
    }
    
}
