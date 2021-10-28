package servlet;

import bean.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          List<Customer> customerList = new ArrayList<>();
          customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://cdn.vietnambiz.vn/2020/3/23/9005608425724062764144382127330218338156544n-1584933586723443851956.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://cdn.vietnambiz.vn/2020/3/23/9005608425724062764144382127330218338156544n-1584933586723443851956.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoà", "1983-08-22", "Nam Định", "https://cdn.vietnambiz.vn/2020/3/23/9005608425724062764144382127330218338156544n-1584933586723443851956.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://cdn.vietnambiz.vn/2020/3/23/9005608425724062764144382127330218338156544n-1584933586723443851956.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://cdn.vietnambiz.vn/2020/3/23/9005608425724062764144382127330218338156544n-1584933586723443851956.jpg"));

        request.setAttribute("customerServletList", customerList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
