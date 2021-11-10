package controller;

import bean.Book;
import bean.BorrowingCard;
import bean.Student;
import repository.IBook;
import repository.IBorrowingCard;
import repository.IStudent;
import repository.impl.BookRepository;
import repository.impl.BorrowingCardRepository;
import repository.impl.StudentRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BrCardServlet", urlPatterns = "/brcard")
public class BrCardServlet extends HttpServlet {
    public static IBorrowingCard borrowingCardRepository = new BorrowingCardRepository();
    public static IBook bookRepository = new BookRepository();
    public static IStudent studentRepository = new StudentRepository();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String note = request.getParameter("note");
        if (note == null) {
            note = "";
        }
        try {
            switch (note) {
                case "edit":
                    showEdit(request, response);
                    break;
                case "brList":
                    showBrList(request, response);
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
                case "brList":
                    showBrList(request, response);
                    break;
                default:
                    showList(request, response);
                    break;
            }
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void showBrList(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<BorrowingCard> borrowingCardList = borrowingCardRepository.selectAllBrCard();
        request.setAttribute("borrowingCardList", borrowingCardList);
        request.getRequestDispatcher("package/list.jsp").forward(request, response);
    }

    public static void showList(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        List<Book> bookList = bookRepository.selectAllBook();
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("package/booklist.jsp").forward(request, response);
    }
    public void showEdit(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String id = request.getParameter("id");
        List<Student> studentList = studentRepository.selectAllStudent();
        request.setAttribute("studentList", studentList);
        List<Book> bookList = bookRepository.selectAllBook();
        request.setAttribute("bookList", bookList);

        BorrowingCard borrowingCard = borrowingCardRepository.selectBrCard(id);
        request.setAttribute("id", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("package/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    }