<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: inline-block;
            width: 120px;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 150px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #6f427c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #6f427c;
        }
    </style>
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
</div>
</body>
</html>