package controlador;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Libreria;
import dao.Mantenimiento;
import modelo.Producto;
@WebServlet("/Busqueda_producto")
public class Busqueda_producto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("txtNombre");
		ArrayList<Producto> lista = new ArrayList<Producto>();
		Libreria m = new Mantenimiento();
		m.conectar();
		ResultSet res = m.buscar(nombre);

		try {
			while (res.next()) {
				Producto pro = new Producto();
				pro.setCodigo(res.getString(1));
				pro.setNombre(res.getString(2));
				pro.setPrecio(res.getDouble(3));
				pro.setStock(res.getInt(4));
				lista.add(pro);
			}
		} catch (Exception e) {

		}
		request.setAttribute("bus_producto", lista);
		RequestDispatcher rd = request.getRequestDispatcher("resultado.jsp");
		rd.forward(request, response);
	}
}