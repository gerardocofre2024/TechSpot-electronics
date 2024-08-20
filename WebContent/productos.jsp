<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.techspot.Producto" %>
<%@ page import="com.techspot.ProductoDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos Recomendados</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Productos Recomendados para Ti</h2>
        <div class="row">
            <%
                // Obteniendo los productos recomendados
                ProductoDAO productoDAO = new ProductoDAO();
                List<Producto> productos = productoDAO.getProductosRecomendados((String)session.getAttribute("usuario"));
                
                for(Producto producto : productos) {
            %>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <img src="<%=producto.getImagen()%>" alt="<%=producto.getNombre()%>" class="bd-placeholder-img card-img-top">
                        <div class="card-body">
                            <p class="card-text"><%=producto.getDescripcion()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Ver</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Agregar al Carrito</button>
                                </div>
                                <small class="text-muted">$<%=producto.getPrecio()%></small>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>