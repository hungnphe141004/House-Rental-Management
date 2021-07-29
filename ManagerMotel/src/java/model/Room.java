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
public class Room {
    
    private int id ;
   private String name ;
   private String roomType ;
   Boolean available ;
   double electricPrice,waterPricce,wifi,clean,mothPrice ;

    public Room() {
    }

    public Room(int id, String name, String roomType, Boolean available, double electricPrice, double waterPricce, double wifi, double clean, double mothPrice) {
        this.id = id;
        this.name = name;
        this.roomType = roomType;
        this.available = available;
        this.electricPrice = electricPrice;
        this.waterPricce = waterPricce;
        this.wifi = wifi;
        this.clean = clean;
        this.mothPrice = mothPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public double getElectricPrice() {
        return electricPrice;
    }

    public void setElectricPrice(double electricPrice) {
        this.electricPrice = electricPrice;
    }

    public double getWaterPricce() {
        return waterPricce;
    }

    public void setWaterPricce(double waterPricce) {
        this.waterPricce = waterPricce;
    }

    public double getWifi() {
        return wifi;
    }

    public void setWifi(double wifi) {
        this.wifi = wifi;
    }

    public double getClean() {
        return clean;
    }

    public void setClean(double clean) {
        this.clean = clean;
    }

    public double getMothPrice() {
        return mothPrice;
    }

    public void setMothPrice(double mothPrice) {
        this.mothPrice = mothPrice;
    }

    
    
    
}
