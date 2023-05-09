<%@page import="dao.MantenimientoMongo"%>
<%@page import="dao.Libreria"%>
<%@page import="modelo.Producto"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String codigo = request.getParameter("txtCodigo");
    String nombre = request.getParameter("txtNombre");
    String precioStr = request.getParameter("txtPrecio");
    String stockStr = request.getParameter("txtStock");

    if (codigo != null && nombre != null && precioStr != null && stockStr != null) {
        double precio = Double.parseDouble(precioStr);
        int stock = Integer.parseInt(stockStr);
        Producto producto = new Producto();
        producto.setCodigo(codigo);
        producto.setNombre(nombre);
        producto.setPrecio(precio);
        producto.setStock(stock);
        Libreria dao = new MantenimientoMongo("localhost", 27017, "ventas");
        dao.registrar(Producto);
        response.sendRedirect("listar_producto.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registrar producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <style>
            body {
                background-image: url(https://emprendepyme.net/wp-content/uploads/2023/03/cualidades-producto.jpg);
                background-repeat: no-repeat;
                background-position: center center;
                width: 100%;
                height: 100%;
                background-attachment: fixed;
                background-size: cover;
            }
            .card {
                border: 2px solid #007bff;
                border-radius: 10px;
                box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #007bff;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
        </style>
    </head>
    <body class="bg-primary bg-opacity-50 ">

        <div class="container col-lg-3 border border-4 border-primary rounded-4   bg-light p-4 mt-5 ">
            <h3 class="mb-3 text-center text-primary mt-3"><strong>Registro de un producto</strong></h3>
            <form action='Registrar_producto' class="">

                Codigo:<br>
                <input class="form-control" type="text" name="txtCodigo"><br>
                Nombres: <br>
                <input class="form-control" type="text" name="txtNombre"><br>
                Precio:<br>
                <input class="form-control" type="text" name="txtPrecio"><br>
                Stock:<br>
                <input class="form-control" type="text" name="txtStock"><br>
                <div class="">
                    <input class="btn btn-primary btn-outline-info ms-3"" type='submit' value='Registrar'>
                    <input class="btn  btn-outline-danger ms-3"" type='reset' value='Limpiar'>
                    <a class="ms-3 text-decoration-none" href="menu.jsp">Volver a menú</a>
                </div>

            </form>
        </div>
    </body>
</html>
