package util;

public class Validate {
    public static final String ID_EMPLOYEE = "NV-\\d{4}";
    public static final String ID_CUSTOMER = "KH-\\d{4}";
    public static final String NAME_REGEX = "([A-Z][a-z]+\\s?)+";
    public static final String ID_CARD_REGEX = "^\\d{9}|\\d{12}$";
    public static final String SALARY_REGEX = "[1-9][0-9]*";
    public static final String PHONE_REGEX = "^(09|\\(84\\)\\+9)[01]\\d{7}$";
    public static final String EMAIL_REGEX = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+.[a-z]{2,6}$";
    public static final String DATE_REGEX = "\\d{4}-\\d{1,2}-\\d{1,2}";
    public static final String NUMBER_REGEX = "\\d";


    public static boolean checkRegex(String value, String regex) {
        if (value.matches(regex)) {
            return false;
        } else {
            return true;
        }
    }

}