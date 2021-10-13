package objects;

public class SoCoThoiHan extends SoTietKiem {
    String kyHan;

    public SoCoThoiHan(String kyHan) {
        this.kyHan = kyHan;
    }

    public SoCoThoiHan(String maSoSo, String maKhachHang, String ngayMoSo, String thoiGianGui,
                       String soTienGui, String laiSuat, String kyHan) {
        super(maSoSo, maKhachHang, ngayMoSo, thoiGianGui, soTienGui, laiSuat);
        this.kyHan = kyHan;
    }

    public String getKyHan() {
        return kyHan;
    }

    public void setKyHan(String kyHan) {
        this.kyHan = kyHan;
    }

    @Override
    public String toString() {
        return "SoCoThoiHan{" +
                "kyHan='" + kyHan + '\'' +
                ", maSoSo='" + maSoSo + '\'' +
                ", maKhachHang='" + maKhachHang + '\'' +
                ", ngayMoSo='" + ngayMoSo + '\'' +
                ", thoiGianGui='" + thoiGianGui + '\'' +
                ", soTienGui='" + soTienGui + '\'' +
                ", laiSuat='" + laiSuat + '\'' +
                '}';
    }

    public String getSoCoThoiHan() {
        return this.kyHan + "," + this.maSoSo + "," + this.maKhachHang + "," + this.ngayMoSo + "," +
                this.thoiGianGui + "," + this.soTienGui + "," + this.laiSuat;
    }
}
