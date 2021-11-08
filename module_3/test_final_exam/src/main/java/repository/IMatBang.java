package repository;

import bean.MatBang;
import bean.TrangThai;

import java.util.List;

public interface IMatBang {
    public List<MatBang> selectAllMatBang();

    public MatBang selectMatBang(String id);

    public void insertMatBang(MatBang matBang);

    public void updateMatBang(MatBang matBang);

    public void deleteMatBang(String id);

    public List< MatBang > searchMatBang(String loaiMatBang, int giaTien, int tang);

}
