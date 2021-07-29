/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Payment {
    int id ;
    int momth ;
    double eletricNumber;
    
    double waterNumber;
    double total;
    boolean isPay;
    Room room ;

    public Payment() {
    }

    public Payment(int id, int momth, double eletricNumber, double waterNumber, double total, boolean isPay, Room room) {
        this.id = id;
        this.momth = momth;
        this.eletricNumber = eletricNumber;
        this.waterNumber = waterNumber;
        this.total = total;
        this.isPay = isPay;
        this.room = room;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMomth() {
        return momth;
    }

    public void setMomth(int momth) {
        this.momth = momth;
    }

    public double getEletricNumber() {
        return eletricNumber;
    }

    public void setEletricNumber(double eletricNumber) {
        this.eletricNumber = eletricNumber;
    }

    public double getWaterNumber() {
        return waterNumber;
    }

    public void setWaterNumber(double waterNumber) {
        this.waterNumber = waterNumber;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isIsPay() {
        return isPay;
    }

    public void setIsPay(boolean isPay) {
        this.isPay = isPay;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    
    
    public double calTotalMonth(){
        return eletricNumber*room.electricPrice +waterNumber*room.waterPricce+room.wifi+room.clean+room.mothPrice;
    }
    
    
    
    
    
}
