/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package booking_trainer;

/**
 *
 * @author aan
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection connect() {
        try {
            // Misalnya menggunakan MySQL
            String url = "jdbc:mysql://localhost:3306/db_booking_traineer";
            String user = "root";
            String password = "";

            // Pastikan driver JDBC sudah ditambahkan ke project
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace(); // agar error bisa dilihat di console
            return null;
        }
    }
}
