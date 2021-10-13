package utils;

import objects.SoCoThoiHan;
import objects.SoDaiHan;
import objects.SoVoThoiHan;

import java.util.ArrayList;
import java.util.List;

import static utils.ReadAndWriteFile.readFile;
import static utils.ReadAndWriteFile.writeFile;

public class ReadAndWriteFileSo {
    public static void writeSocothoihan(List<SoCoThoiHan> soCoThoiHanList, String path, boolean append) {
        List<String> stringList = new ArrayList<>();
        for (SoCoThoiHan soCoThoiHan : soCoThoiHanList) {
            stringList.add(soCoThoiHan.getSoCoThoiHan());
        }
        writeFile(stringList, path, append);
    }

    public static void writeSoDaiHan(List<SoDaiHan> soDaiHanList, String path, boolean append) {
        List<String> stringList = new ArrayList<>();
        for (SoDaiHan soDaiHan : soDaiHanList) {
            stringList.add(soDaiHan.getSoDaiHan());
        }
        writeFile(stringList, path, append);
    }

    public static void writeSoVoThoiHan(List<SoVoThoiHan> soVoThoiHanList, String path, boolean append) {
        List<String> stringList = new ArrayList<>();
        for (SoVoThoiHan soVoThoiHan : soVoThoiHanList) {
            stringList.add(soVoThoiHan.getSoVoThoiHan());
        }
        writeFile(stringList, path, append);
    }

    public static List<SoCoThoiHan> readSoCoThoiHan(String path) {
        List<String> stringList = readFile(path);
        List<SoCoThoiHan> soCoThoiHanList = new ArrayList<>();
        for (String string : stringList) {
            String[] temp = string.split(",");
            SoCoThoiHan soCoThoiHan = new SoCoThoiHan(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5], temp[6]);
            soCoThoiHanList.add(soCoThoiHan);
        }
        return soCoThoiHanList;
    }

    public static List<SoDaiHan> readSoDaiHan(String path) {
        List<String> stringList = readFile(path);
        List<SoDaiHan> soDaiHanList = new ArrayList<>();
        for (String string : stringList) {
            String[] temp = string.split(",");
            SoDaiHan soDaiHan = new SoDaiHan(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5], temp[6], temp[7]);
            soDaiHanList.add(soDaiHan);
        }
        return soDaiHanList;
    }

    public static List<SoVoThoiHan> readSoVoThoiHan(String path) {
        List<String> stringList = readFile(path);
        List<SoVoThoiHan> soVoThoiHanList = new ArrayList<>();
        for (String string : stringList) {
            String[] temp = string.split(",");
            SoVoThoiHan soVoThoiHan = new SoVoThoiHan(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5]);
            soVoThoiHanList.add(soVoThoiHan);
        }
        return soVoThoiHanList;
    }
}