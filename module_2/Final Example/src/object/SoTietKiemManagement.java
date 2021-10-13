package object;

import data.SoTietKiem;
import objects.SoCoThoiHan;
import objects.SoDaiHan;
import objects.SoVoThoiHan;

import java.io.File;
import java.util.List;
import java.util.Scanner;

import static utils.ReadAndWriteFileSo.*;

public class SoTietKiemManagement implements SoTietKiem {
    public static final String SOVOTHOIHAN_PATH = "src/data/sovothoihan.csv";
    public static final String SODAIHAN_PATH = "src/data/sodaihan.csv";
    public static final String SOCOTHOIHAN_PATH = "src/data/socothoihan.csv";
    File fileSoVoThoiHan = new File(SOVOTHOIHAN_PATH);
    File fileSoDaiHan = new File(SODAIHAN_PATH);
    File fileSoCoThoiHan = new File(SOCOTHOIHAN_PATH);
    List<SoVoThoiHan> soVoThoiHanList = readSoVoThoiHan(SOVOTHOIHAN_PATH);
    List<SoDaiHan> soDaiHanList = readSoDaiHan(SODAIHAN_PATH);
    List<SoCoThoiHan> soCoThoiHanList = readSoCoThoiHan(SOCOTHOIHAN_PATH);
    Scanner scanner = new Scanner(System.in);

    @Override
    public void them() {
        System.out.println("*************************************");
        String choice;
        System.out.println("Chọn sổ cần thêm: \n" +
                "1: Thêm sổ dài hạn: \n" +
                "2: Thêm sổ có thời hạn: \n" +
                "3: Thêm sổ vô thời hạn: \n");
        System.out.println("*************************************");
        choice = scanner.nextLine();
        switch (choice) {
            case "1":
                SoDaiHan soDaiHan = new SoDaiHan(addMaSoSo(), addMaKhachHang(), addNgayMoSo(),
                        addThoiGianGui(), addSoTienGui(), addLaiSuat(), addUuDai(), addKyHan());
                soDaiHanList.add(soDaiHan);
                fileSoDaiHan.delete();
                writeSoDaiHan(soDaiHanList, SODAIHAN_PATH, true);
                break;
            case "2":

                SoCoThoiHan soCoThoiHan = new SoCoThoiHan(addMaSoSo(), addMaKhachHang(), addNgayMoSo(),
                        addThoiGianGui(), addSoTienGui(), addLaiSuat(), addKyHan());
                soCoThoiHanList.add(soCoThoiHan);
                fileSoCoThoiHan.delete();
                writeSocothoihan(soCoThoiHanList, SOCOTHOIHAN_PATH, true);
                break;

            case "3":
                SoVoThoiHan soVoThoiHan = new SoVoThoiHan(addMaSoSo(), addMaKhachHang(), addNgayMoSo(),
                        addThoiGianGui(), addSoTienGui(), addLaiSuat());
                soVoThoiHanList.add(soVoThoiHan);
                fileSoVoThoiHan.delete();
                writeSoVoThoiHan(soVoThoiHanList, SOVOTHOIHAN_PATH, true);
                break;
        }
    }

    private String addMaSoSo() {
        System.out.println("Nhập mã số sổ: ");
        String maSoSo = scanner.nextLine();
        return maSoSo;
    }

    private String addMaKhachHang() {
        System.out.println("Nhập mã khách hàng: ");
        String maKhachHang = scanner.nextLine();
        return maKhachHang;
    }

    private String addNgayMoSo() {
        System.out.println("Nhập ngày mở sổ: ");
        String ngayMoSo = scanner.nextLine();
        return ngayMoSo;
    }

    private String addThoiGianGui() {
        System.out.println("Nhập thời gian gửi: ");
        String thoiGianGui = scanner.nextLine();
        return thoiGianGui;
    }

    private String addSoTienGui() {
        System.out.println("Nhập số tiền gửi: ");
        String soTienGui = scanner.nextLine();
        return soTienGui;
    }

    private String addLaiSuat() {
        System.out.println("Nhập lãi suất: ");
        String laiSuat = scanner.nextLine();
        return laiSuat;
    }

    private String addKyHan() {
        System.out.println("Nhập kỳ hạn: ");
        String kyHan = scanner.nextLine();
        return kyHan;
    }

    private String addUuDai() {
        System.out.println("Nhập ưu đãi: ");
        String uuDai = scanner.nextLine();
        return uuDai;
    }


    @Override
    public void sua() {

    }

    @Override
    public void xoa() {
        System.out.println("*************************************");
        String choice;
        System.out.println("Chọn sổ cần xoá : \n" +
                " 1: Xoá sổ dài hạn: \n" +
                " 2: Xoá sổ vô thời hạn: \n" +
                " 3: Xoá sổ có thời hạn: \n");
        System.out.println("*************************************");
        choice = scanner.nextLine();
        switch (choice) {
            case "1":
                hienThiSoDaiHan();
                System.out.println("Nhập mã số sổ:");
                String maSoSo = scanner.nextLine();
                for (int i = 0; i < soDaiHanList.size(); i++) {
                    if (maSoSo.equals(soDaiHanList.get(i).getSoDaiHan())) {
                        String choiceDelete;
                        System.out.println("Bạn có muốn xoá? \n" +
                                "1. Đồng ý! \n" +
                                "2. Không! ");
                        choiceDelete = scanner.nextLine();
                        if (choiceDelete.equals("1")) {
                            soDaiHanList.remove(soDaiHanList.get(i));
                            System.out.println("Xoá thành công");
                            break;
                        } else {
                            break;
                        }
                    }
                }
                writeSoDaiHan(soDaiHanList, SODAIHAN_PATH, true);
                break;
            case "2":
                hienThiSoVoThoiHan();
                System.out.println("Nhập mã số sổ:");
                String maSoSo2 = scanner.nextLine();
                for (int i = 0; i < soVoThoiHanList.size(); i++) {
                    if (maSoSo2.equals(soVoThoiHanList.get(i).getSoVoThoiHan())) {
                        String choiceDelete;
                        System.out.println("Bạn có muốn xoá? \n" +
                                "1. Đồng ý! \n" +
                                "2. Không! ");
                        choiceDelete = scanner.nextLine();
                        if (choiceDelete.equals("1")) {
                            soVoThoiHanList.remove(soVoThoiHanList.get(i));

                            System.out.println("Xoá thành công!");
                            break;
                        } else {
                            break;
                        }
                    }
                }
                writeSoVoThoiHan(soVoThoiHanList, SOVOTHOIHAN_PATH, true);

                break;
            case "3":
                hienThiSoCoThoiHan();
                System.out.println("Nhập mã số sổ:");
                String maSoSo3 = scanner.nextLine();
                for (int i = 0; i < soCoThoiHanList.size(); i++) {
                    if (maSoSo3.equals(soCoThoiHanList.get(i).getSoCoThoiHan())) {
                        String choiceDelete;
                        System.out.println("Bạn có muốn xoá? \n" +
                                "1. Đồng ý! \n" +
                                "2. Không! ");
                        choiceDelete = scanner.nextLine();
                        if (choiceDelete.equals("1")) {
                            soCoThoiHanList.remove(soCoThoiHanList.get(i));

                            System.out.println("Xoá thành công!");
                            break;
                        } else {
                            break;
                        }
                    }
                }
                writeSocothoihan(soCoThoiHanList, SOVOTHOIHAN_PATH, true);
                break;
            default:
                System.out.println("default!");
        }
    }

    @Override
    public void hienthi() {
        System.out.println("*********************************");
        String choice;
        System.out.println("Chọn sổ hiển thị : \n" +
                " 1: Hiển thị sổ dài hạn: \n" +
                " 2: Hiển thị sổ có thời hạn: \n" +
                " 3: Hiển thị sổ vô thời hạn: \n");
        System.out.println("*********************************");
        choice = scanner.nextLine();
        switch (choice) {
            case "1":
                hienThiSoDaiHan();
                break;
            case "2":
                hienThiSoCoThoiHan();
                break;
            case "3":
                hienThiSoVoThoiHan();
                break;
        }
    }


    public void hienThiSoDaiHan() {
        for (SoDaiHan soDaiHan : soDaiHanList) {
            System.out.println(soDaiHan.toString());
        }
    }

    public void hienThiSoVoThoiHan() {
        for (SoVoThoiHan soVoThoiHan : soVoThoiHanList) {
            System.out.println(soVoThoiHan.toString());
        }
    }

    public void hienThiSoCoThoiHan() {
        for (SoCoThoiHan soCoThoiHan : soCoThoiHanList) {
            System.out.println(soCoThoiHan.toString());
        }
    }
}
