<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
    body {
      background: url(bgs.jpg);
      background-size: cover;
      background-attachment: fixed;
    }

    h2 {
      style: bold;
      font-weight: 400;
      text-align: center;
    }

    .myform {
      background: white;
      width: 50%;
      padding: 25px 25px 25px 25px;
      border-radius: 10px;
      margin: auto;
    }
  </style>
  <script type="text/javascript">
    Email.send({
        Host: "smtp.gmail.com",
        Username: "flaskapp389@gmail.com",
        Password: "Flaskapp@3891821",
        To: '<%= session.getAttribute("fem") %>',
        From: "flaskapp389@gmail.com",
        Subject: "Email Verification",
        Body: "Your otp is <%= session.getAttribute("fotp") %>",
      })
  </script>
</head>
<body>  

    <nav class="navbar navbar-fixed-top navbar-expand-sm bg-dark navbar-dark justify-content-end">
        <ul class="navbar-nav nav-pills">
          <li class="nav-item"  style="padding-right:30px">
            <a class="nav-link" href="index.jsp"><strong>Home</strong></a>
          </li>
          <li class="nav-item"  style="padding-right:30px">
            <a class="nav-link active" href="login.jsp"><strong>Login</strong></a>
          </li>
          <li class="nav-item" style="padding-right:150px">
            <a class="nav-link" href="signup.jsp"><strong>SignUp</strong></a>
          </li>
        </ul>
      </nav>

      <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Incorrect Otp");

            </script>
        <% }
      %>

    <div class="container">
    <br><br>
    <div class="myform">
    <h2>Forgot Password</h2>
    <br>

        <form action="changePswd.jsp" class="was-validated" method="post"
            oninput='pass2.setCustomValidity(pass2.value != pass1.value ? "Passwords do not match." : "")'>
          <div class="form-group">
            <label for="no">OTP:</label>
            <input type="number" class="form-control" id="no" placeholder="Enter Otp" name="otp" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
          </div>
          <div class="form-group">
            <label>New Password</label>
            <input type="password" name="pass1" class="form-control" placeholder="Password"
              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
              title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
              required>
          </div>
          <div class="form-group">
            <label>Confirm Password</label>
            <input type="password" name="pass2" class="form-control" placeholder="Confirm Password" required>
          </div>

          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        </div>
      </div>
      
  </body>
</html>