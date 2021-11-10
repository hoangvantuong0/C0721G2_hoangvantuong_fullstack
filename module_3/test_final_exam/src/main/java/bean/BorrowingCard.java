package bean;

public class BorrowingCard {
    private String id;
    private Book book;
    private Student student;
    private String status;
    private String borrowingDate;
    private String repayingDate;

    public BorrowingCard() {
    }

    public BorrowingCard(String id, Book book, Student student, String status, String borrowingDate, String repayingDate) {
        this.id = id;
        this.book = book;
        this.student = student;
        this.status = status;
        this.borrowingDate = borrowingDate;
        this.repayingDate = repayingDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBorrowingDate() {
        return borrowingDate;
    }

    public void setBorrowingDate(String borrowingDate) {
        this.borrowingDate = borrowingDate;
    }

    public String getRepayingDate() {
        return repayingDate;
    }

    public void setRepayingDate(String repayingDate) {
        this.repayingDate = repayingDate;
    }
}
