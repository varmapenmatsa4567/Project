<%@page import="java.sql.*"%>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "update users set password=? where email=?";
    String email = String.valueOf(session.getAttribute("fem"));
    String pass = request.getParameter("pass1");
    String otp = String.valueOf(request.getParameter("otp"));
    String fotp = String.valueOf(session.getAttribute("fotp"));

    if(otp.equals(fotp)){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,user,pas);
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(2,email);
            st.setString(1,pass);
            int rs = st.executeUpdate();
            if(rs==1){
                response.sendRedirect("login.jsp?m3=pass");
            }
            else{
                response.sendRedirect("login.jsp?m1=fail");
            }
        }
        catch(Exception e){
            out.println(e);
        }

    }
    else{
        response.sendRedirect("forgotOtp.jsp?m1=otp");
    }

    

 %>