package utils;


import org.omg.CORBA.UserException;

public class Exception extends UserException {
    public Exception() {
    }

    public Exception(String reason) {
        super(reason);
    }
}