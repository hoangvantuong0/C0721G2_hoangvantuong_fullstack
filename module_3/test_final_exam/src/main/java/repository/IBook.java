package repository;

import bean.Book;
import bean.BorrowingCard;

import java.util.List;

public interface IBook {
    public List<Book> selectAllBook();
}
