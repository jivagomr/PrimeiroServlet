/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufmt.ic.pawii.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Jivago
 */
public class ConnBD {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/util","root","root");
            
            return con;
            
        } catch (ClassNotFoundException ex) {
            System.out.println("Classe não encontrada: "+ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Erro: "+ex.getMessage());
        }
        
        
        return null;
        
    }      
}