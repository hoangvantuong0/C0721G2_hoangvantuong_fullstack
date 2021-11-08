package bean;

public class MatBang {
    private String maMatBang;
    private int dienTich;
    private TrangThai maTrangThai;
    private int tang;
    private LoaiVanPhong maLoaiVanPhong;
    private int giaChoThue;
    private String ngayBatDau;
    private String ngayKetThuc;

    public MatBang() {

    }

    public MatBang(String maMatBang, int dienTich, TrangThai maTrangThai, int tang,
                   LoaiVanPhong maLoaiVanPhong, int giaChoThue, String ngayBatDau, String ngayKetThuc) {
        this.maMatBang = maMatBang;
        this.dienTich = dienTich;
        this.maTrangThai = maTrangThai;
        this.tang = tang;
        this.maLoaiVanPhong = maLoaiVanPhong;
        this.giaChoThue = giaChoThue;
        this.ngayBatDau = ngayBatDau;
        this.ngayKetThuc = ngayKetThuc;
    }

    public String getMaMatBang() {
        return maMatBang;
    }

    public void setMaMatBang(String maMatBang) {
        this.maMatBang = maMatBang;
    }

    public int getDienTich() {
        return dienTich;
    }

    public void setDienTich(int dienTich) {
        this.dienTich = dienTich;
    }

    public TrangThai getMaTrangThai() {
        return maTrangThai;
    }

    public void setMaTrangThai(TrangThai maTrangThai) {
        this.maTrangThai = maTrangThai;
    }

    public int getTang() {
        return tang;
    }

    public void setTang(int tang) {
        this.tang = tang;
    }

    public LoaiVanPhong getMaLoaiVanPhong() {
        return maLoaiVanPhong;
    }

    public void setMaLoaiVanPhong(LoaiVanPhong maLoaiVanPhong) {
        this.maLoaiVanPhong = maLoaiVanPhong;
    }

    public int getGiaChoThue() {
        return giaChoThue;
    }

    public void setGiaChoThue(int giaChoThue) {
        this.giaChoThue = giaChoThue;
    }

    public String getNgayBatDau() {
        return ngayBatDau;
    }

    public void setNgayBatDau(String ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }

    public String getNgayKetThuc() {
        return ngayKetThuc;
    }

    public void setNgayKetThuc(String ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }
}