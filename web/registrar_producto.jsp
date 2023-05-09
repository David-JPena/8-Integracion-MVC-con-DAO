<%-- 
    Document   : registrar_producto
    Created on : 7 may. 2023, 16:49:29
    Author     : Jenifer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrado de un producto | LIBRERÍA</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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
