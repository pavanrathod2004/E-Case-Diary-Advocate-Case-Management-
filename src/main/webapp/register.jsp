<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            margin-bottom: 20px;
            color: #f1c40f;
        }

        main div {
            background-color: #2c3e50;
            color: #ecf0f1;
            width: 350px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input {
            width: 90%;
            padding: 10px;
            margin: 5px 0 10px 0;
            border: none;
            border-radius: 6px;
            outline: none;
            font-size: 14px;
        }

        input:focus {
            border: 2px solid #3498db;
            background-color: #f9f9f9;
        }

        button {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        button:hover {
            background-color: #27ae60;
            transform: scale(1.05);
        }

        .error {
            color: red;
            font-weight: bold;
            width: 90%;               /* form input width प्रमाणे */
            text-align: left;          /* neat alignment */
            margin: 0 auto 10px auto;  /* form मध्ये center */
        }

        p a {
            color: #3498db;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<main>
    <div>

        <%
            String error = (String) request.getAttribute("error");
            if(error != null){
        %>
        <p class="error"><%= error %></p>
        <%
            }
        %>

        <form action="register_data" method="post">
            <h2>Registration From</h2>
            <label for="username">UserName :</label>
            <input type="text" id="username" name="username" placeholder="userName" required>

            <label for="email">Email :</label>
            <input type="text" id="email" name="email" placeholder="email" required>

            <label for="phone">Phone :</label>
            <input type="text" id="phone" name="phone" placeholder="phone" required>

            <label for="password">Password :</label>
            <input type="password" id="password" name="password">

            <button type="submit">Register</button>
        </form>
    </div>
</main>
</body>
</html>
