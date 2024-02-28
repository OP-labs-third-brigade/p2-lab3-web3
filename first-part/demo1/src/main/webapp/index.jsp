<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    Map<String, String> cookieMap = new HashMap<>();
    if (request.getCookies() != null) {
        for (Cookie cookie : request.getCookies()) {
            cookieMap.put(cookie.getName(), cookie.getValue());
        }
    }
    String paramAFrom = cookieMap.getOrDefault("a_from", "1");
    String paramATo = cookieMap.getOrDefault("a_to", "2");
    String paramAStep = cookieMap.getOrDefault("a_step", "3");
    String paramBFrom = cookieMap.getOrDefault("b_from", "2");
    String paramBTo = cookieMap.getOrDefault("b_to", "4");
    String paramBStep = cookieMap.getOrDefault("b_step", "2");
    String paramCFrom = cookieMap.getOrDefault("c_from", "0");
    String paramCTo = cookieMap.getOrDefault("c_to", "3");
    String paramCStep = cookieMap.getOrDefault("c_step", "1");
    String paramDFrom = cookieMap.getOrDefault("d_from", "1");
    String paramDTo = cookieMap.getOrDefault("d_to", "2");
    String paramDStep = cookieMap.getOrDefault("d_step", "2");
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