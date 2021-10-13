package main;

import object.SoTietKiemManagement;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        SoTietKiemManagement soTietKiem = new SoTietKiemManagement();
        Scanner scanner = new Scanner(System.in);
        String choice;
        do {
            System.out.println("************************************");
            System.out.println("Menu: " + "\n" +
                    "1. Thêm sổ mới" + "\n" +
                    "2. Xoá sổ " + "\n" +
                    "3. Xem danh sách sổ tiết kiệm" + "\n" +
                    "4. Exit");
            System.out.println("************************************");
            System.out.println("Enter your choice: ");
            choice = scanner.nextLine();
            switch (choice) {
                case "1":
                    soTietKiem.them();
                    break;
                case "2":
                    soTietKiem.xoa();
                    break;
                case "3":
                    soTietKiem.hienthi();
                    break;
                case "4":
                    System.out.println("Exit!");
                    break;
                default:
                    System.out.println("Nhập lại!");
            }
        } while (!choice.equals("4"));
    }
}

