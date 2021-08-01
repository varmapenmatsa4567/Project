<%@page import="java.sql.*"%>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "select * from users where email=?";
    String email = request.getParameter("email");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,email);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            int randomPin   =(int) (Math.random()*900000)+100000;
            String otp  = String.valueOf(randomPin);
            session.setAttribute("fotp",otp);
            session.setAttribute("fem",email);
            response.sendRedirect("forgotOtp.jsp");
        }
        else{
            response.sendRedirect("forgotPas.jsp?m1=fail");
        }
    }
    catch(Exception e){
        out.println(e);
    }

 %>