package dao;

import java.sql.*;

public interface Libreria {
	
	public Connection conectar();
	public void registrar(int codigo, String nombre, double precio, int stock);
	public ResultSet listar();
	public ResultSet buscar(String nombre);
	
}
