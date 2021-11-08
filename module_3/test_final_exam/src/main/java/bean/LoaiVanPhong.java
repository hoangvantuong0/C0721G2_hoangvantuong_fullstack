package bean;

public class LoaiVanPhong {
    private String maLoaiVanPhong;
    private String tenLoaiVanPhong;

    public LoaiVanPhong() {
    }

    public LoaiVanPhong(String maLoaiVanPhong, String tenLoaiVanPhong) {
        this.maLoaiVanPhong = maLoaiVanPhong;
        this.tenLoaiVanPhong = tenLoaiVanPhong;
    }

    public String getMaLoaiVanPhong() {
        return maLoaiVanPhong;
    }

    public void setMaLoaiVanPhong(String maLoaiVanPhong) {
        this.maLoaiVanPhong = maLoaiVanPhong;
    }

    public String getTenLoaiVanPhong() {
        return tenLoaiVanPhong;
    }

    public void setTenLoaiVanPhong(String tenLoaiVanPhong) {
        this.tenLoaiVanPhong = tenLoaiVanPhong;
    }
}
