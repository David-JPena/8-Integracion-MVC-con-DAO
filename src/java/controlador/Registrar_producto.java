package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Libreria;
import dao.Mantenimiento;

@WebServlet("/Registrar_producto")
public class Registrar_producto extends HttpServlet {

	private static final long serialVersionUID = 1L;

        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		int cod = Integer.parseInt(request.getParameter("txtCodigo"));
		String nom = request.getParameter("txtNombre");
		double pre = Double.parseDouble(request.getParameter("txtPrecio"));
		int sto = Integer.parseInt(request.getParameter("txtStock"));
		
		Libreria m = new Mantenimiento();
		m.conectar();
		m.registrar(cod, nom, pre, sto);
		
		response.sendRedirect("Listar_producto");
	}

}