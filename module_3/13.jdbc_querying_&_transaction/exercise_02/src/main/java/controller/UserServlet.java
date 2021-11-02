package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/user", ""})
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                case "transaction":
                    insertUserTransaction(request, response);
                    break;
                default:
                    showListUser(request, response);
                    break;
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String notice = request.getParameter("notice");
        if (notice == null) {
            notice = "";
        }
        try {
            switch (notice) {
                case "create":
                    createUser(request, response);
                    break;
                case "edit":
                    editUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "sort":
                    sortByNameUser(request, response);
                    break;
                case "search":
                    searchByCountry(request, response);
                    break;
                case "transaction":
                    insertUserTransaction(request, response);
                    break;
                default:
                    showListUser(request, response);
                    break;
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    public void insertUserTransaction(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        userService.insertUserTransaction();
        response.sendRedirect("/user");

    }

    public void showListUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<User> userList = userService.showAllUser();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    public void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    public void createUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        userService.insertUser(user);
        request.setAttribute("message", "New user was created");
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    public void showUserEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    public void editUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        if (user == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            userService.editUser(user);
            request.getRequestDispatcher("user/edit.jsp").forward(request, response);
            request.setAttribute("message", "User information was updated");
        }
    }

    public void showDeleteUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("user/delete.jsp").forward(request, response);
    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            userService.dropUser(id);
            response.sendRedirect("/user");
        }
    }

    public void sortByNameUser(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List< User > userList = userService.orderByName();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("user/sort.jsp").forward(request, response);
    }

    public void searchByCountry(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String countryName = request.getParameter("countryName");
        List< User > userList = userService.selectByCountry(countryName);
        if (userList == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("user/search.jsp").forward(request, response);
        }
    }
}