/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.*;
import dao.RoomDAO;
import dao.RoomTypeDAO;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class TestMain {
    public static void main(String[] args) {
        RoomTypeDAO dao=new RoomTypeDAO();
        List<RoomType> list=dao.getAll();
        for (RoomType room:list){
            System.out.println("room name: "+room.getTypeName()+" descrition: "+room.getDescription());
        }
        
        HotelDAO hotelDAO=new HotelDAO();
        List<Hotel> hotels=hotelDAO.getAll();
        for (Hotel hotel:hotels){
            System.out.println("link anh: "+hotel.getImage());
        }
        
    }
    
}
