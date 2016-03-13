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
public class Barang {
    private final String kode;
    private final String nama;
    private final String provider;
    private final String jenis;
    private final int stok;
    private final int harga;
    private final byte potongan;
    
    public Barang(String kode, String nama, String provider, String jenis, int stok, int harga, byte potongan) {
        this.kode = kode;
        this.nama = nama;
        this.provider = provider;
        this.jenis = jenis;
        this.stok = stok;
        this.harga = harga;
        this.potongan = potongan;
    }

    public String getKode() {
        return kode;
    }

    public String getNama() {
        return nama;
    }

    public String getProvider() {
        return provider;
    }

    public String getJenis() {
        return jenis;
    }

    public int getStok() {
        return stok;
    }

    public int getHarga() {
        return harga;
    }

    public byte getPotongan() {
        return potongan;
    }
}

