<html>
<head>
  <title>Login Page</title>
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

    form {
      background-color: #2c3e50;
      color: #ecf0f1;
      width: 350px;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0px 8px 20px rgba(0,0,0,0.3);
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
      color: #f1c40f;
    }

    input {
      width: 90%;
      padding: 10px;
      margin: 10px 0;
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
      background-color: #3498db;
      color: white;
      border: none;
      padding: 10px 20px;
      margin: 10px;
      border-radius: 6px;
      cursor: pointer;
      transition: 0.3s;
      font-size: 14px;
    }

    button:hover {
      background-color: #e74c3c;
      transform: scale(1.05);
    }

    #submitButton {
      background-color: #2ecc71;
    }

    #submitButton:hover {
      background-color: #27ae60;
    }

    #clerButton {
      background-color: #e67e22;
    }

    #clerButton:hover {
      background-color: #d35400;
    }
  </style>
</head>
<body>
<form action="Authentication.jsp" method="post">
  <h2>Login Page</h2>
  <input type="text" name="email" placeholder="Email">
  <br>
  <input type="password" name="password" placeholder="Password">
  <br>
  <button type="submit" id="submitButton">Login</button>
  <button type="reset" id="clerButton">Clear</button>
  <p>Don't have an account? <a href="register.jsp" style="color: #3498db">Sign Up</a></p>
</form>
</body>
</html>