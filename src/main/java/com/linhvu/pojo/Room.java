/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.linhvu.pojo;

import java.math.BigDecimal;

/**
 *
 * @author prodi
 */
public class Room {
    private int roomID;
    private String roomName;
    private BigDecimal pricePerDay;
    private boolean allowSmoking;
    private int singleBed;
    private int doubleBed;
    private String description;

    public Room() {
    }

    public Room(int roomID, String roomName, BigDecimal pricePerDay, boolean allowSmoking, int singleBed, int doubleBed, String description) {
        this.roomID = roomID;
        this.roomName = roomName;
        this.pricePerDay = pricePerDay;
        this.allowSmoking = allowSmoking;
        this.singleBed = singleBed;
        this.doubleBed = doubleBed;
        this.description = description;
    }

    /**
     * @return the roomID
     */
    public int getRoomID() {
        return roomID;
    }

    /**
     * @param roomID the roomID to set
     */
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    /**
     * @return the roomName
     */
    public String getRoomName() {
        return roomName;
    }

    /**
     * @param roomName the roomName to set
     */
    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    /**
     * @return the pricePerDay
     */
    public BigDecimal getPricePerDay() {
        return pricePerDay;
    }

    /**
     * @param pricePerDay the pricePerDay to set
     */
    public void setPricePerDay(BigDecimal pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    /**
     * @return the allowSmoking
     */
    public boolean isAllowSmoking() {
        return allowSmoking;
    }

    /**
     * @param allowSmoking the allowSmoking to set
     */
    public void setAllowSmoking(boolean allowSmoking) {
        this.allowSmoking = allowSmoking;
    }

    /**
     * @return the singleBed
     */
    public int getSingleBed() {
        return singleBed;
    }

    /**
     * @param singleBed the singleBed to set
     */
    public void setSingleBed(int singleBed) {
        this.singleBed = singleBed;
    }

    /**
     * @return the doubleBed
     */
    public int getDoubleBed() {
        return doubleBed;
    }

    /**
     * @param doubleBed the doubleBed to set
     */
    public void setDoubleBed(int doubleBed) {
        this.doubleBed = doubleBed;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
