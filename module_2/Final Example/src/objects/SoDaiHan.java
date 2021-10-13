package objects;

public class SoDaiHan extends SoTietKiem {
    String uuDai;
    String kyHan;

    public SoDaiHan() {
    }

    public SoDaiHan(String uuDai, String kyHan) {
        this.uuDai = uuDai;
        this.kyHan = kyHan;
    }

    public SoDaiHan(String maSoSo, String maKhachHang, String ngayMoSo, String thoiGianGui,
                    String soTienGui, String laiSuat, String uuDai, String kyHan) {
        super(maSoSo, maKhachHang, ngayMoSo, thoiGianGui, soTienGui, laiSuat);
        this.uuDai = uuDai;
        this.kyHan = kyHan;
    }

    public String getUuDai() {
        return uuDai;
    }

    public void setUuDai(String uuDai) {
        this.uuDai = uuDai;
    }

    public String getKyHan() {
        return kyHan;
    }

    public void setKyHan(String kyHan) {
        this.kyHan = kyHan;
    }

    @Override
    public String toString() {
        return "SoDaiHan{" +
                "uuDai='" + uuDai + '\'' +
                ", kyHan='" + kyHan + '\'' +
                ", maSoSo='" + maSoSo + '\'' +
                ", maKhachHang='" + maKhachHang + '\'' +
                ", ngayMoSo='" + ngayMoSo + '\'' +
                ", thoiGianGui='" + thoiGianGui + '\'' +
                ", soTienGui='" + soTienGui + '\'' +
                ", laiSuat='" + laiSuat + '\'' +
                '}';
    }

    public String getSoDaiHan() {
        return this.uuDai + "," + this.kyHan + "," + this.maSoSo + "," + this.maKhachHang + "," + this.ngayMoSo + "," +
                this.thoiGianGui + "," + this.soTienGui + "," + this.laiSuat;

    }
}
