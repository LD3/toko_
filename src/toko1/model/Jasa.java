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
public class Jasa {
    private final String kode;
    private final String nama;
    private final int harga;
    private final byte potongan;

    public Jasa(String kode, String nama, int harga, byte potongan) {
        this.kode = kode;
        this.nama = nama;
        this.harga = harga;
        this.potongan=potongan;
    }

    public String getKode() {
        return kode;
    }

    public String getNama() {
        return nama;
    }

    public int getHarga() {
        return harga;
    }
    
}

