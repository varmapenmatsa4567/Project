<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

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
        To: '<%= session.getAttribute("vem") %>',
        From: "flaskapp389@gmail.com",
        Subject: "Email Verification",
        Body: "Your otp is <%= session.getAttribute("votp") %>",
      })
  </script>
</head>
<body>  

    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <a class="item" href="index.jsp"><i class="home icon"></i>HOME</a>
             <a class="item" href="login.jsp"><i class="sign-in icon"></i>LOGIN</a>
             <a class="active item" href="signup.jsp"><i class="user icon"></i>SIGN UP</a>
        </div>
    </div>
    </div>

      <%
        if(request.getParameter("m1")!=null){%>
            <div class="container">
            <div class="alert alert-error alert-dismissible">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>Incorrect Otp</strong>
            </div></div>
        <% }
      %>

    <div class="container">
    <br><br>
    <div class="myform">
    <h2>Email Verification</h2>
    <br>

        <form action="insertUser.jsp" class="was-validated ui form" method="post">
          <div class="form-group">
            <label for="no">OTP:</label>
            <input type="number" class="form-control" id="no" placeholder="Enter Otp" name="otp" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
          </div>

          <button type="submit" class="ui blue button">Submit</button>
        </form>
        </div>
      </div>
      
  </body>
</html>