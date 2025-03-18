/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;

public interface BaseDAO<T> {
    List<T> getAll();
    T getById(int id);
    boolean insert(T obj);
    boolean update(T obj);
    boolean delete(int id);
}

