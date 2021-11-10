package repository.impl;

import bean.Book;
import repository.IBook;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class BookRepository implements IBook {
    @Override
    public List<Book> selectAllBook() {
        List<Book> bookList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select * from book");
            Book book = null;
            while (resultSet.next()) {
                book = new Book();
                book.setId(resultSet.getString("book_id"));
                book.setName(resultSet.getString("book_name"));
                book.setAuthor(resultSet.getString("author"));
                book.setDescription(resultSet.getString("description"));
                book.setQuantity(resultSet.getInt("quantity"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }
}
