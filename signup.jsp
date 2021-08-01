<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
    body {
      background: url("signin.jpg");
      background-size: cover;
      background-attachment: fixed;
    }
    h1 {
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
    strong {
      color: white;
    }
  </style>
  <script>
    function changeType1() {
        var password_field = document.getElementById("password1");
        var icon = document.getElementById("icon1");
        if (password_field.type == "text") {
            password_field.type = "password";
            icon.className = "eye icon";
        } else {
            password_field.type = "text";
            icon.className = "eye slash icon";
        }
    }
    function changeType2() {
        var password_field = document.getElementById("password2");
        var icon = document.getElementById("icon2");
        if (password_field.type == "text") {
            password_field.type = "password";
            icon.className = "eye icon";
        } else {
            password_field.type = "text";
            icon.className = "eye slash icon";
        }
    }
  </script>
</head>
<body>  
    <div class="ui inverted segment">
    <div class="ui container">
        <div class="ui inverted secondary pointing menu">
             <a class="item" href="index.jsp"><i class="home icon"></i>HOME</a>
             <a class="item" href="login.jsp"><i class="sign-in icon"></i>LOGIN</a>
             <a class="active item" href="signup.jsp"><i class="user icon"></i>SIGN UP</a>
             <a class="item" href="admin.jsp"><i class="user secret icon"></i>ADMIN</a>
        </div>
    </div>
    </div>
      <%
        if(request.getParameter("m1")!=null){%>
            <script>
                alert("Sign Up Successful!!!");
            </script>
        <% } %>
      <%
        if(request.getParameter("m2")!=null){%>
            <script>
                alert("Email Already Exists!!!");
            </script>
        <% } %>
      <div class="container">
    <br><br>
    <div class="myform shadow-lg">
    <h1 class="ui header">Sign Up</h1>
    <br>
      <form class="was-validated" action="sendOtp.jsp" method="post" name="" id=""
        oninput='pass2.setCustomValidity(pass2.value != pass1.value ? "Passwords do not match." : "")'>
          <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" class="form-control" placeholder="Name" required>
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" placeholder="Email" required>
          </div>
          <div class="form-group">
            <label>Password</label>
            <div class="input-group">
                <input type="password" name="pass1" class="form-control" placeholder="Password" id="password1"
                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                required>
                <div class="input-group-append">
                <button type="button" class="btn btn-outline-secondary" onClick="changeType1()">
                    <i class="eye icon" id="icon1"></i>
                </button>
                </div>
            </div>
          </div>
          <div class="form-group">
            <label>Confirm Password</label>
            <div class="input-group">
                <input type="password" name="pass2" class="form-control" placeholder="Confirm Password" id="password2" required>
                <div class="input-group-append">
                <button type="button" class="btn btn-outline-secondary" onClick="changeType2()">
                    <i class="eye icon" id="icon2"></i>
                </button>
                </div>
            </div>
          </div>
          <div class="form-group">
            <label>Mobile No</label>
            <input type="text" name="phno" class="form-control" placeholder="Phone no" pattern="[0-9]{10}" title="Must enter Valid Phone number" required>
          </div>
          <div class="form-group">
            <label>User Type:</label>
            <select class="form-control" id="sel1" name="type" required>
              <option value="" selected disabled hidden>Select Type</option>
              <option>Job Seeker</option>
              <option>Employer</option>
            </select>
          </div>
        <div class="row">
          <div class="form-group col-12">
            <input type="submit" class="ui green button" value="Sign Up">
          </div>
        </div>
      </form>
    </div>
  </div>
  </body>
</html>
