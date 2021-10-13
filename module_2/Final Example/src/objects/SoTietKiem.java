package objects;

public abstract class SoTietKiem {
    String maSoSo;
    String maKhachHang;
    String ngayMoSo;
    String thoiGianGui;
    String soTienGui;
    String laiSuat;

    public SoTietKiem() {
    }

    public SoTietKiem(String maSoSo, String maKhachHang,
                      String ngayMoSo, String thoiGianGui, String soTienGui, String laiSuat) {
        this.maSoSo = maSoSo;
        this.maKhachHang = maKhachHang;
        this.ngayMoSo = ngayMoSo;
        this.thoiGianGui = thoiGianGui;
        this.soTienGui = soTienGui;
        this.laiSuat = laiSuat;
    }

    @Override
    public String toString() {
        return "SoTietKiem{" +
                "maSoSo='" + maSoSo + '\'' +
                ", maKhachHang='" + maKhachHang + '\'' +
                ", ngayMoSo='" + ngayMoSo + '\'' +
                ", thoiGianGui='" + thoiGianGui + '\'' +
                ", soTienGui='" + soTienGui + '\'' +
                ", laiSuat='" + laiSuat + '\'' +
                '}';
    }
    public String getSoTietKiem(){
        return this.maSoSo +","+this.maKhachHang+","+this.ngayMoSo+","+this.thoiGianGui+","+
                this.soTienGui+","+this.laiSuat;
    }
}
