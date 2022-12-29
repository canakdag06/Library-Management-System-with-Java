/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jframe;
import java.sql.*;
/**
 *
 * @author Can
 */
public class DBConnection {
    static Connection con = null;
    
    public static Connection getConnection(){
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/library","postgres","06ankara06");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
