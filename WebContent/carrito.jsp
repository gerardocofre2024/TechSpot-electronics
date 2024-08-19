<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras - TechSpot</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="index.jsp">TechSpot</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="catalogo.jsp">Catálogo</a></li>
                    <li class="nav-item"><a class="nav-link" href="carrito.jsp">Carrito</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Iniciar Sesión</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="container">
        <h1 class="my-4">Carrito de Compras</h1>
        <c:if test="${empty carrito}">
            <p>No hay productos en tu carrito.</p>
        </c:if>
        <c:if test="${not empty carrito}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${carrito}">
                        <tr>
                            <td>${item.nombre}</td>
                            <td>${item.cantidad}</td>
                            <td>$${item.precio}</td>
                            <td>$${item.cantidad * item.precio}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3"><strong>Total</strong></td>
                        <td><strong>$${total}</strong></td>
                    </tr>
                </tbody>
            </table>
            <a href="checkout.jsp" class="btn btn-success">Proceder al Pago</a>
        </c:if>
    </main>

    <footer class="text-muted text-center">
        <div class="container">
            <p>&copy; 2024 TechSpot. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>