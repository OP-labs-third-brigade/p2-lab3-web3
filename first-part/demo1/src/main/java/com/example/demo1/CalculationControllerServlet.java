package com.example.demo1;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;

@WebServlet(name = "calculation", urlPatterns = { "/calculation" })
public class CalculationControllerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] parameters = {"a_from", "a_to", "a_step", "b_from", "b_to", "b_step", "c_from", "c_to", "c_step", "d_from", "d_to", "d_step"};
        for (String param : parameters) {
            String value = request.getParameter(param);
            Cookie cookie = new Cookie(param, value);
            cookie.setMaxAge(60 * 60 * 24 * 30);
            response.addCookie(cookie);
        }

        response.sendRedirect("result.jsp");
    }
}