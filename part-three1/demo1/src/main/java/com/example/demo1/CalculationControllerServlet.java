package com.example.demo1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "calculation", urlPatterns = { "/calculation" })
public class CalculationControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] parameters = {"a_from", "a_to", "a_step", "b_from", "b_to", "b_step", "c_from", "c_to", "c_step", "d_from", "d_to", "d_step"};
        List<String> paramValues = new ArrayList<>();

        HttpSession session = request.getSession(); // Отримуємо сесію

        for (String param : parameters) {
            String value = request.getParameter(param);
            if (value != null && !value.isEmpty()) {
                paramValues.add(value);
                session.setAttribute(param, value); // Зберігаємо значення параметрів в атрибутах сесії
            } else {
                // Якщо значення з параметрів запиту недоступне, використовувати значення з сесії
                String sessionValue = (String) session.getAttribute(param);
                if (sessionValue != null) {
                    paramValues.add(sessionValue);
                }
            }
        }


        List<String> aValues = getValues(Integer.parseInt(paramValues.get(0)), Integer.parseInt(paramValues.get(1)), Integer.parseInt(paramValues.get(2)));
        List<String> bValues = getValues(Integer.parseInt(paramValues.get(3)), Integer.parseInt(paramValues.get(4)), Integer.parseInt(paramValues.get(5)));
        List<String> cValues = getValues(Integer.parseInt(paramValues.get(6)), Integer.parseInt(paramValues.get(7)), Integer.parseInt(paramValues.get(8)));
        List<String> dValues = getValues(Integer.parseInt(paramValues.get(9)), Integer.parseInt(paramValues.get(10)), Integer.parseInt(paramValues.get(11)));

        List<Double> resultsArray = getResults(aValues, bValues, cValues, dValues);

        request.setAttribute("aValues", aValues);
        request.setAttribute("bValues", bValues);
        request.setAttribute("cValues", cValues);
        request.setAttribute("dValues", dValues);
        request.setAttribute("results", resultsArray);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public List<String> getValues(int paramStart, int paramFinal, int paramStep) {
        List<String> inputParamValues = new ArrayList<>();
        for (int param = paramStart; param <= paramFinal; param += paramStep) {
            inputParamValues.add(String.valueOf(param));
        }
        return inputParamValues;
    }

    public List<Double> getResults(List<String> aValues, List<String> bValues, List<String> cValues, List<String> dValues) {
        List<Double> resultValues = new ArrayList<>();

        FormulaCalculator calculator = new FormulaCalculator();

        for (String a : aValues) {
            for (String b : bValues) {
                for (String c : cValues) {
                    for (String d : dValues) {
                        double result = calculator.secondFormula(
                                Double.parseDouble(a),
                                Double.parseDouble(b),
                                Double.parseDouble(c),
                                Double.parseDouble(d)
                        );

                        resultValues.add(result);
                    }
                }
            }
        }
        return resultValues;
    }
}