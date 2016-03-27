package br.ufmt.ic.pawii.util;


import br.ufmt.ic.pawii.util.ConnBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Jivago
 */
public class Estados {

    public static String getEstados(String estado, String nome, String email) {
        try {

            String strCidades;

            Statement stm;

            Connection con = ConnBD.getConnection();

            if (con == null) {
                throw new SQLException("Erro conectando");
            }

            stm = con.createStatement();
            
            String sql = "SELECT codigo,municipio FROM municipios"
                    + " WHERE uf='" + estado + "' ORDER BY municipio ASC";

            ResultSet rs = stm.executeQuery(sql);
            
            JSONArray cidades = new JSONArray();
            
            while (rs.next()) {
                
                String codigo = rs.getString(1);
                String cidade = rs.getString(2);
                
                JSONObject jsonCidade = new JSONObject();
                jsonCidade.put("codigo", codigo);                
                jsonCidade.put("nome", cidade);
                cidades.put(jsonCidade);
            }
            
            JSONObject jsonRetorno = new JSONObject();
            jsonRetorno.put("cidades", cidades);
            jsonRetorno.put("seuNome", nome);
            jsonRetorno.put("seuEmail", email);

            strCidades = jsonRetorno.toString();

            return strCidades;

        } catch (SQLException ex) {
                System.out.println("Error: "+ex.getMessage());
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
       
        return null;
    }

}
