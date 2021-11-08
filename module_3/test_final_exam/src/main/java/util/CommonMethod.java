package util;

import bean.LoaiVanPhong;
import bean.TrangThai;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class CommonMethod {
    public static List<LoaiVanPhong> selectLoaiVanPhong() {
        List<LoaiVanPhong> loaiVanPhongList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from loai_van_phong ;");
            LoaiVanPhong loaiVanPhong = null;
            while (resultSet.next()) {
                loaiVanPhong = new LoaiVanPhong();
                loaiVanPhong.setMaLoaiVanPhong(resultSet.getString("ma_loai_van_phong"));
                loaiVanPhong.setTenLoaiVanPhong(resultSet.getString("ten_loai_van_phong"));
                loaiVanPhongList.add(loaiVanPhong);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loaiVanPhongList;
    }

    public static List<TrangThai> selectTrangThai() {
        List<TrangThai> trangThaiList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from trang_thai ;");
            TrangThai trangThai = null;
            while (resultSet.next()) {
                trangThai = new TrangThai();
                trangThai.setMaTrangThai(resultSet.getString("ma_trang_thai"));
                trangThai.setTenTrangThai(resultSet.getString("ten_trang_thai"));
                trangThaiList.add(trangThai);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trangThaiList;
    }

    }