package repository;

import bean.BorrowingCard;

import java.util.List;

public interface IBorrowingCard {
    public List<BorrowingCard> selectAllBrCard();

    public BorrowingCard selectBrCard(String id);

    public void insertBrCard(BorrowingCard borrowingCard);

    public void updateBrCard(BorrowingCard borrowingCard);

    public void deleteBrCard(String id);

}
