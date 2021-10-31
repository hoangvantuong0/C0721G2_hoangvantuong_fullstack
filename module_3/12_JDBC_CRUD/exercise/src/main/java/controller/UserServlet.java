package controller;

import bean.User;
import repository.impl.UserRepository;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/users",""})
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("notice");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "sort":
                    sortByName(request, response);
                case "search":
                    searchByCountry(request, response);
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String notice = request.getParameter("notice");
        if (notice == null) {
            notice = "";
        }
        try {
            switch (notice) {
                case "create":
                    showFormCreate(request, response);
                    break;
                case "edit":
                    showUserEdit(request, response);
                    break;
                case "delete":
                    showDeleteUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void showDeleteUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("delete.jsp").forward(request, response);
    }
    public void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }
    public void showUserEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }
    public void sortByName(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = iUserService.sortByName();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("sort.jsp").forward(request, response);
    }
    public void searchByCountry(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String countryName = request.getParameter("countryName");
        List<User> userList = iUserService.searchByCountry(countryName);
        if(userList == null){
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        }else {
            request.setAttribute("userList",userList);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = iUserService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        iUserService.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        iUserService.updateUser(user);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        iUserService.deleteUser(id);

        List<User> listUser = iUserService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }
}