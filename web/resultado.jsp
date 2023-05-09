<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="modelo.Producto"%>
<jsp:useBean id="bus_producto" class="java.util.ArrayList" scope="request"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="ISO-8859-1">
            <title>Resultado de Búsqueda | LIBRERÍA</title>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <style>
                body,h1,h2,h3,h4,h5,h6 {
                    font-family: "Raleway", sans-serif
                }
                body, html {
                    height: 100%;
                    line-height: 1.8;
                }
                /* Full height image header */
                .bgimg-1 {
                    background-position: center;
                    background-size: cover;
                    background-image: url("fondo.jpg");
                    min-height: 100%;
                }
                .w3-bar .w3-button {
                    padding: 16px;
                }
                .altura{
                    margin-top: 6rem;
                }
                .altur{
                    margin-top: 25rem;
                }
            </style>
        </head>
        <body class="">

            <!-- Navbar (sit on top) -->
            <div class="w3-top">
                <div class="w3-bar w3-white w3-card" id="myNavbar">
                    <a href="/MVC_DAO/" class="w3-bar-item w3-button w3-wide">LIBRERÍA</a>
                    <!-- Right-sided navbar links -->
                    <div class="w3-right w3-hide-small">
                        <a href="menu.jsp" class="w3-bar-item w3-button">Menú</a>
                    </div>
                    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

                    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </div>

        <%
            Producto pro = new Producto();
            for (int i = 0; i < bus_producto.size(); i++) {
                pro = (Producto) bus_producto.get(i);
        %>

        <div class=" container altura">
            <div>
                <h2 class="text-center text-primary">Libro <strong>"<%=pro.getNombre()%>"</strong></h2>
                <hr>
            </div>
        </div>
        <div class="container mt-4 col-lg-6 border border-3 border-primary rounded-4">
            <table class="table table-bordered table-hover mt-3 table-striped">
                <tr class="table-secondary table-dark border border-2 " >
                    <th class="text-center border border-2 ">Codigo</th>
                    <th class="text-center border border-2">Nombres</th>
                    <th class="text-center border border-2 ">Precio</th>
                    <th class="text-center border border-2">Stock</th>
                </tr>

                <tr class="border border-2 ">
                    <td class="text-center"><%=pro.getCodigo()%></td>
                    <td class="text-center"><%=pro.getNombre()%></td>
                    <td class="text-center">S/. <%=pro.getPrecio()%></td>
                    <td class="text-center"><%=pro.getStock()%></td>

                </tr>
                <%
                    }
                %>
            </table>

        </div>
        <div class="altur">
            <!-- Footer -->
            <footer class="footer mt-5 w3-center w3-black w3-padding-64">
                <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>Volver al Inicio</a>
                <div class="w3-xlarge w3-section">
                    <i class="fa fa-facebook-official w3-hover-opacity"></i>
                    <i class="fa fa-instagram w3-hover-opacity"></i>
                    <i class="fa fa-twitter w3-hover-opacity"></i>
                    <i class="fa fa-linkedin w3-hover-opacity"></i>
                </div>
                <p>Todos los Derechos Reservados 2023</p>
            </footer>
        </div>
    </body>
</html>