package repository.impl;

import bean.Book;
import bean.BorrowingCard;
import bean.Student;
import repository.IBorrowingCard;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static util.DataConnection.getConnection;

public class BorrowingCardRepository implements IBorrowingCard {
    @Override
    public List<BorrowingCard> selectAllBrCard() {
        List<BorrowingCard> borrowingCardList = new ArrayList<>();
        try {
            Statement statement = getConnection().createStatement();
            ResultSet resultSet = statement.executeQuery("select br.borrowing_card_id, b.book_name, b.author, st.student_name, st.class, br.status,\n" +
                    "br.borrowing_date, br.repaying_date\n" +
                    "from borrowing_card br join book b on br.book_id = b.book_id \n" +
                    "join student st on br.student_id = st.student_id;");
            BorrowingCard borrowingCard = null;
            Book book = null;
            Student student = null;
            while (resultSet.next()) {
                student = new Student();
                book = new Book();
                borrowingCard = new BorrowingCard();
                borrowingCard.setId(resultSet.getString("borrowing_card_id"));
                book.setName(resultSet.getString("book_name"));
                student.setName(resultSet.getString("student_name"));
                borrowingCard.setBook(book);
                borrowingCard.setStudent(student);
                borrowingCard.setStatus(resultSet.getString("status"));
                borrowingCard.setBorrowingDate(resultSet.getString("borrowing_date"));
                borrowingCard.setRepayingDate(resultSet.getString("repaying_date"));
                borrowingCardList.add(borrowingCard);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return borrowingCardList;
    }

    @Override
    public BorrowingCard selectBrCard(String id) {
        return null;
    }

    @Override
    public void insertBrCard(BorrowingCard borrowingCard) {

    }

    @Override
    public void updateBrCard(BorrowingCard borrowingCard) {

    }

    @Override
    public void deleteBrCard(String id) {

    }

}
