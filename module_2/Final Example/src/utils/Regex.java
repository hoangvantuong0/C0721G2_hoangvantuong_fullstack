package utils;

import java.util.Scanner;

public class Regex {
    static Scanner sc = new Scanner(System.in);

    public static String checkRegex(String string, String regex, String err) {
        boolean check = true;
        do {
            if (string.matches(regex)) {
                check = false;
            } else {
                System.out.println(err);
                string = sc.nextLine();
            }
        } while (check);
        return string;
    }
}

//    public static boolean checkNumberId(String name) {
//        String ID_REGEX = "SV-[1-9]\\d{3}";
//        boolean b = name.matches(ID_REGEX);
//        return b;
//    }
//}