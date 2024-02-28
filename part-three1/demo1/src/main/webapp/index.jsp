<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    session = request.getSession();
    Map<String, String> paramDefaults = new HashMap<>();
    // Задаємо значення за замовчуванням для параметрів
    paramDefaults.put("a_from", "1");
    paramDefaults.put("a_to", "2");
    paramDefaults.put("a_step", "3");
    paramDefaults.put("b_from", "2");
    paramDefaults.put("b_to", "4");
    paramDefaults.put("b_step", "2");
    paramDefaults.put("c_from", "0");
    paramDefaults.put("c_to", "3");
    paramDefaults.put("c_step", "1");
    paramDefaults.put("d_from", "1");
    paramDefaults.put("d_to", "2");
    paramDefaults.put("d_step", "2");

    // Отримуємо значення параметрів з сесії, або встановлюємо значення за замовчуванням
    Map<String, String> paramValues = new HashMap<>();
    for (String paramName : paramDefaults.keySet()) {
        String paramValue = (String) session.getAttribute(paramName);
        paramValues.put(paramName, paramValue != null ? paramValue : paramDefaults.get(paramName));
    }

    // Встановлюємо значення параметрів для виведення на сторінці
    String paramAFrom = paramValues.get("a_from");
    String paramATo = paramValues.get("a_to");
    String paramAStep = paramValues.get("a_step");
    String paramBFrom = paramValues.get("b_from");
    String paramBTo = paramValues.get("b_to");
    String paramBStep = paramValues.get("b_step");
    String paramCFrom = paramValues.get("c_from");
    String paramCTo = paramValues.get("c_to");
    String paramCStep = paramValues.get("c_step");
    String paramDFrom = paramValues.get("d_from");
    String paramDTo = paramValues.get("d_to");
    String paramDStep = paramValues.get("d_step");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Обчислення формули Y</title>
    <link href="./styles/styles.css" rel="stylesheet" />
</head>
<body>
<div class="container">
    <h2>Формула: Y = ln(|2a|) / (3 * tg(b)) - √(c / √(|d|))</h2>
    <form action="calculation" method="post">
        <label for="a_from">Параметр а:</label>
        from <input type="text" id="a_from" name="a_from" value="<%= paramAFrom %>">
        to <input type="text" id="a_to" name="a_to" value="<%= paramATo %>">
        step <input type="text" id="a_step" name="a_step" value="<%= paramAStep %>"><br><br>

        <label for="b_from">Параметр b:</label>
        from <input type="text" id="b_from" name="b_from" value="<%= paramBFrom %>">
        to <input type="text" id="b_to" name="b_to" value="<%= paramBTo %>">
        step <input type="text" id="b_step" name="b_step" value="<%= paramBStep %>"><br><br>

        <label for="c_from">Параметр c:</label>
        from <input type="text" id="c_from" name="c_from" value="<%= paramCFrom %>">
        to <input type="text" id="c_to" name="c_to" value="<%= paramCTo %>">
        step <input type="text" id="c_step" name="c_step" value="<%= paramCStep %>"><br><br>

        <label for="d_from">Параметр d:</label>
        from <input type="text" id="d_from" name="d_from" value="<%= paramDFrom %>">
        to <input type="text" id="d_to" name="d_to" value="<%= paramDTo %>">
        step <input type="text" id="d_step" name="d_step" value="<%= paramDStep %>"><br><br>
        <input type="submit" value="Обчислити">
    </form>
    <% if (request.getAttribute("results") != null) { %>
    <h2>Результати:</h2>
    <table border="1">
        <tr>
            <th>a</th>
            <th>b</th>
            <th>c</th>
            <th>d</th>
            <th>y</th>
        </tr>
        <%
            List<String> aValues = (List<String>) request.getAttribute("aValues");
            List<String> bValues = (List<String>) request.getAttribute("bValues");
            List<String> cValues = (List<String>) request.getAttribute("cValues");
            List<String> dValues = (List<String>) request.getAttribute("dValues");
            List<Double> results = (List<Double>) request.getAttribute("results");
            int counter = 0;

            if (results != null) {
                for (int i = 0; i < aValues.size(); i++) {
                    for (int j = 0; j < bValues.size(); j++) {
                        for (int k = 0; k < cValues.size(); k++) {
                            for (int l = 0; l < dValues.size(); l++) {
                                String a = dValues.get(l);
                                String b = cValues.get(k);
                                String c = bValues.get(j);
                                String d = aValues.get(i);
                                Double result = results.get(counter);
                                counter += 1;
        %>

        <tr>
            <td><%= a %></td>
            <td><%= b %></td>
            <td><%= c %></td>
            <td><%= d %></td>
            <td><%= result %></td>
        </tr>
        <%
                        }
                    }
                }}
        } else {
        %>
        <tr>
            <td colspan="5">No parameters or results available</td>
        </tr>
        <% } %>
    </table>
    <% } %>
</div>
</body>
</html>