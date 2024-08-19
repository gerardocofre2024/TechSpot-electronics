package com.techspot;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CatalogoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Crear la lista de productos
        List<Producto> productos = new ArrayList<>();
        productos.add(new Producto("Laptop", 799.990, "img/laptop.jpg"));
        productos.add(new Producto("Tablet", 299.990, "img/tablet.jpg"));
        productos.add(new Producto("Smartphone", 499.990, "img/smartphone.jpg"));
        
        // Debug: Imprimir los productos en la consola
        System.out.println("Número de productos añadidos: " + productos.size());
        for (Producto producto : productos) {
            System.out.println("Producto: " + producto.getNombre() + ", Precio: " + producto.getPrecio());
        }

        // Pasar la lista de productos al JSP
        request.setAttribute("productos", productos);
        
        // Redirigir a la página JSP del catálogo
        request.getRequestDispatcher("catalogo.jsp").forward(request, response);
    }
}