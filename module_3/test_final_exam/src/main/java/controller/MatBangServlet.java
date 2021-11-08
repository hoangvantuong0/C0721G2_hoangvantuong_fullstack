package controller;

import bean.LoaiVanPhong;
import bean.MatBang;
import bean.TrangThai;
import repository.IMatBang;
import repository.impl.MatBangRepository;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static util.CommonMethod.selectLoaiVanPhong;
import static util.CommonMethod.selectTrangThai;

@WebServlet(name = "MatBangServlet", urlPatterns = "/matbang")
public class MatBangServlet extends HttpServlet {
    public static IMatBang matBangRepository = new MatBangRepository();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    showCreate(request, response);
                    break;
                case "edit":
                    showEdit(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                default:
                    showList(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "create":
                    create(request, response);
                    break;
                case "edit":
                    edit(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
                default:
                    showList(request, response);
                    break;
            }
        } catch (ServletException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void search(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String loaiMatBang = request.getParameter("loaiMatBang");
        int giaTien = Integer.parseInt(request.getParameter("giaTien"));
        int tang = Integer.parseInt(request.getParameter("tang"));
        List<MatBang> matBangList = matBangRepository.searchMatBang(loaiMatBang, giaTien, tang);
        if (matBangList.size() == 0) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("matBangList", matBangList);
            request.getRequestDispatcher("package/list.jsp").forward(request, response);
        }
    }

    public void showEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String maMatBang = request.getParameter("maMatBang");
        List< LoaiVanPhong > loaiVanPhongList = selectLoaiVanPhong();
        request.setAttribute("loaiVanPhongList", loaiVanPhongList);
        List<TrangThai> trangThaiList = selectTrangThai();
        request.setAttribute("trangThaiList", trangThaiList);

        MatBang matBang= matBangRepository.selectMatBang(maMatBang);
        request.setAttribute("matBang", matBang);
        RequestDispatcher dispatcher = request.getRequestDispatcher("package/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void edit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String maMatBang = request.getParameter("maMatBang");
        int dienTich = Integer.parseInt(request.getParameter("dienTich"));
        String maTrangThai = request.getParameter("maTrangThai");
        int tang = Integer.parseInt(request.getParameter("tang"));
        String maLoaiVanPhong = request.getParameter("maLoaiVanPhong");
        int giaChoThue = Integer.parseInt(request.getParameter("giaChoThue"));
        String ngayBatDau = request.getParameter("ngayBatDau");
        String ngayKetThuc = request.getParameter("ngayKetThuc");
        TrangThai trangThai = new TrangThai();
        LoaiVanPhong loaiVanPhong = new LoaiVanPhong();
        trangThai.setTenTrangThai(maTrangThai);
        loaiVanPhong.setTenLoaiVanPhong(maLoaiVanPhong);

        MatBang matBang = new MatBang(maMatBang, dienTich, trangThai, tang, loaiVanPhong,
                giaChoThue, ngayBatDau, ngayKetThuc);

        try {
            matBangRepository.updateMatBang(matBang);
            RequestDispatcher dispatcher = request.getRequestDispatcher("package/edit.jsp");
            request.setAttribute("message", "completed");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void create(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String maMatBang = request.getParameter("maMatBang");
        int dienTich = Integer.valueOf(request.getParameter("dienTich"));
        String maTrangThai = request.getParameter("maTrangThai");
        int tang = Integer.parseInt(request.getParameter("tang"));
        String maLoaiVanPhong = request.getParameter("maLoaiVanPhong");
        int giaChoThue = Integer.parseInt(request.getParameter("giaChoThue"));
        String ngayBatDau = request.getParameter("ngayBatDau");
        String ngayKetThuc = request.getParameter("ngayKetThuc");
        TrangThai trangThai = new TrangThai();
        LoaiVanPhong loaiVanPhong = new LoaiVanPhong();
        trangThai.setTenTrangThai(maTrangThai);
        loaiVanPhong.setTenLoaiVanPhong(maLoaiVanPhong);

        MatBang matBang = new MatBang(maMatBang, dienTich, trangThai, tang, loaiVanPhong,
                giaChoThue, ngayBatDau, ngayKetThuc);

        try {
            matBangRepository.insertMatBang(matBang);
            RequestDispatcher dispatcher = request.getRequestDispatcher("package/create.jsp");
            request.setAttribute("message", "completed");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void showCreate(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<LoaiVanPhong> loaiVanPhongList = selectLoaiVanPhong();
        request.setAttribute("loaiVanPhongList", loaiVanPhongList);
        List<TrangThai> trangThaiList = selectTrangThai();
        request.setAttribute("trangThaiList", trangThaiList);
        request.getRequestDispatcher("package/create.jsp").forward(request, response);
    }

    public static void showList(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<MatBang> matbangList = matBangRepository.selectAllMatBang();
        request.setAttribute("matBangList", matbangList);
        request.getRequestDispatcher("package/list.jsp").forward(request, response);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("maMatBang");
        matBangRepository.deleteMatBang(id);
        response.sendRedirect("/matbang");
    }
}
