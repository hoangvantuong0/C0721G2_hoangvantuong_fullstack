package objects;

public class SoVoThoiHan extends SoTietKiem{
    public SoVoThoiHan() {
    }

    public SoVoThoiHan(String maSoSo, String maKhachHang, String ngayMoSo, String thoiGianGui,
                       String soTienGui, String laiSuat) {
        super(maSoSo, maKhachHang, ngayMoSo, thoiGianGui, soTienGui, laiSuat);
    }

    @Override
    public String toString() {
        return "SoNganHan{" +
                "maSoSo='" + maSoSo + '\'' +
                ", maKhachHang='" + maKhachHang + '\'' +
                ", ngayMoSo='" + ngayMoSo + '\'' +
                ", thoiGianGui='" + thoiGianGui + '\'' +
                ", soTienGui='" + soTienGui + '\'' +
                ", laiSuat='" + laiSuat + '\'' +
                '}';
    }
    public String getSoVoThoiHan(){
        return this.maSoSo +","+this.maKhachHang+","+this.ngayMoSo+","+this.thoiGianGui+","+
                this.soTienGui+","+this.laiSuat;
    }
}
