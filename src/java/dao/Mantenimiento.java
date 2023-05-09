package dao;

import java.sql.*;

public class Mantenimiento implements Libreria {

    private Connection conn;
    private String driver = "com.mysql.jdbc.Driver";
    private String cadena = "jdbc:mysql://localhost/ventass";
    private String usuario = "root";
    private String clave = "";
    private Statement sen;
    private ResultSet res;
              
   

    @Override
    public Connection conectar() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(cadena, usuario, clave);
        } catch (Exception e) {
        }
        return conn;
    }

    @Override
    public void registrar(int codigo, String nombre, double precio, int stock) {
        try {
            String query = "insert into producto VALUES('" + codigo + "','" + nombre + "','" + precio + "','" + stock + "')";
            sen = conn.createStatement();
            sen.execute(query);
        } catch (Exception e) {
        }
    }

    @Override
    public ResultSet listar() {
        try {
            sen = conn.createStatement();
            res = sen.executeQuery("select * from producto");
        } catch (Exception e) {
        }
        return res;
    }

    @Override
    public ResultSet buscar(String nombre) {
        try {
            sen = conn.createStatement();
            res = sen.executeQuery("select * from producto where nombre='" + nombre + "'");
        } catch (Exception e) {
        }

        return res;
    }

}
