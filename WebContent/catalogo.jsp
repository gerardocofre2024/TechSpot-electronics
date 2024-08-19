<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo - TechSpot</title>
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
        <h1 class="my-4">Catálogo de Productos</h1>
        <div class="row">
            <c:forEach var="producto" items="${productos}">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="detalle_producto.jsp?id=${producto.id}"><img class="card-img-top" src="${producto.imagen}" alt="${producto.nombre}"></a>
                        <div class="card-body">
                            <h4 class="card-title"><a href="detalle_producto.jsp?id=${producto.id}">${producto.nombre}</a></h4>
                            <h5>$${producto.precio}</h5>
                            <p class="card-text">${producto.descripcion}</p>
                        </div>
                        <div class="card-footer">
                            <a href="carrito.jsp?action=add&id=${producto.id}" class="btn btn-primary">Agregar al Carrito</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
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