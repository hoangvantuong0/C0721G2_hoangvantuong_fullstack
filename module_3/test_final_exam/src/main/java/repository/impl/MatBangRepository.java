package repository.impl;

import bean.LoaiVanPhong;
import bean.MatBang;
import bean.TrangThai;
import repository.IMatBang;
import util.DataConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class MatBangRepository implements IMatBang {
    @Override
    public List<MatBang> selectAllMatBang() {
        List<MatBang> matBangList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select mb.ma_mat_bang, mb.dien_tich, tt.ten_trang_thai, mb.tang, lvp.ten_loai_van_phong, \n " +
                    " mb.gia_cho_thue, mb.ngay_bat_dau, mb.ngay_ket_thuc\n " +
                    " from mat_bang mb join loai_van_phong lvp on lvp.ma_loai_van_phong = mb.ma_loai_van_phong \n " +
                    " join trang_thai tt on tt.ma_trang_thai = mb.ma_trang_thai;");
            MatBang matBang = null;
            LoaiVanPhong loaiVanPhong = null;
            TrangThai trangThai = null;
            while (resultSet.next()) {
                loaiVanPhong = new LoaiVanPhong();
                trangThai = new TrangThai();
                matBang = new MatBang();
                matBang.setMaMatBang(resultSet.getString("ma_mat_bang"));
                matBang.setDienTich(resultSet.getInt("dien_tich"));
                trangThai.setTenTrangThai(resultSet.getString("ten_trang_thai"));
                matBang.setTang(resultSet.getInt("tang"));
//                loaiVanPhong.setMaLoaiVanPhong(resultSet.getString("ma_loai_van_phong"));
                loaiVanPhong.setTenLoaiVanPhong(resultSet.getString("ten_loai_van_phong"));
//                trangThai.setMaTrangThai(resultSet.getString("ma_trang_thai"));
                matBang.setGiaChoThue(resultSet.getInt("gia_cho_thue"));
                matBang.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                matBang.setNgayKetThuc(resultSet.getString("ngay_ket_thuc"));
                matBang.setMaLoaiVanPhong(loaiVanPhong);
                matBang.setMaTrangThai(trangThai);
                matBangList.add(matBang);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matBangList;
    }

    @Override
    public MatBang selectMatBang(String maMatBang) {
        List<MatBang> matBangList = selectAllMatBang();
        MatBang matBang = null;
        for (MatBang matBang1 : matBangList) {
            if (matBang1.getMaMatBang().equals(maMatBang)) {
                matBang = matBang1;
            }
        }
        return matBang;
    }

    @Override
    public void insertMatBang(MatBang matBang) {
        try {

            PreparedStatement preparedStatement = getConnection().prepareStatement
                    ("insert into mat_bang values(?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1, matBang.getMaMatBang());
            preparedStatement.setInt(2, matBang.getDienTich());
            preparedStatement.setString(3, matBang.getMaTrangThai().getTenTrangThai());
            preparedStatement.setInt(4, matBang.getTang());
            preparedStatement.setString(5, matBang.getMaLoaiVanPhong().getTenLoaiVanPhong());
            preparedStatement.setInt(6, matBang.getGiaChoThue());
            preparedStatement.setString(7, matBang.getNgayBatDau());
            preparedStatement.setString(8, matBang.getNgayKetThuc());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DataConnection.close();
        }
    }

    @Override
    public void updateMatBang(MatBang matBang) {
        try {
            PreparedStatement preparedStatement = getConnection().prepareStatement
                    ("update mat_bang set dien_tich=?, \n" +
                            "ma_trang_thai=?, tang = ?, ma_loai_van_phong =?,\n" +
                            "gia_cho_thue=?, ngay_bat_dau=?, ngay_ket_thuc = ? \n" +
                            "where ma_mat_bang = ?;");

            preparedStatement.setInt(1, matBang.getDienTich());
            preparedStatement.setString(2, matBang.getMaTrangThai().getTenTrangThai());
            preparedStatement.setInt(3, matBang.getTang());
            preparedStatement.setString(4, matBang.getMaLoaiVanPhong().getTenLoaiVanPhong());
            preparedStatement.setInt(5, matBang.getGiaChoThue());
            preparedStatement.setString(6, matBang.getNgayBatDau());
            preparedStatement.setString(7, matBang.getNgayKetThuc());
            preparedStatement.setString(8, matBang.getMaMatBang());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMatBang(String id) {
        try {
            PreparedStatement preparedStatement = DataConnection.getConnection().prepareStatement
                    ("delete from mat_bang where ma_mat_bang= ?;");
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MatBang> searchMatBang(String loaiMatBang, int giaTien, int tang) {
        List< MatBang > matBangList = new ArrayList<>();
        try {
            PreparedStatement ps = getConnection().prepareStatement
                    (" select mb.ma_mat_bang,mb.ma_trang_thai,tt.ten_trang_thai,mb.dien_tich, mb.tang, mb.ma_loai_van_phong,lvp.ten_loai_van_phong,\n " +
                            " mb.gia_cho_thue, mb.ngay_bat_dau, mb.ngay_ket_thuc\n " +
                            " from mat_bang mb join trang_thai tt on tt.ma_trang_thai = mb.ma_trang_thai\n " +
                            " join loai_van_phong lvp on lvp.ma_loai_van_phong = mb.ma_loai_van_phong\n " +
                            " where (lvp.ten_loai_van_phong like concat('%',?,'%')) and (gia_cho_thue = ?)  and (tang = ?);");
            ps.setString(1, loaiMatBang);
            ps.setInt(2, giaTien);
            ps.setInt(3, tang);
            ResultSet resultSet = ps.executeQuery();
            MatBang matBang = null;
            LoaiVanPhong loaiVanPhong = null;
            TrangThai trangThai = null;
            while (resultSet.next()) {
                loaiVanPhong = new LoaiVanPhong();
                trangThai = new TrangThai();

                trangThai.setMaTrangThai(resultSet.getString("ma_trang_thai"));
                trangThai.setTenTrangThai(resultSet.getString("ten_trang_thai"));

                loaiVanPhong.setMaLoaiVanPhong(resultSet.getString("ma_loai_van_phong"));
                loaiVanPhong.setTenLoaiVanPhong(resultSet.getString("ten_loai_van_phong"));

                matBang = new MatBang();
                matBang.setMaLoaiVanPhong(loaiVanPhong);
                matBang.setMaTrangThai(trangThai);
                matBang.setMaMatBang(resultSet.getString("ma_mat_bang"));
                matBang.setDienTich(resultSet.getInt("dien_tich"));
                matBang.setTang(resultSet.getInt("tang"));

                matBang.setGiaChoThue(resultSet.getInt("gia_cho_thue"));
                matBang.setNgayBatDau(resultSet.getString("ngay_bat_dau"));
                matBang.setNgayKetThuc(resultSet.getString("ngay_ket_thuc"));


                matBangList.add(matBang);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matBangList;

    }
}
