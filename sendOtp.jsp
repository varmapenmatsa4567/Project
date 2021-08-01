<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>

<%

    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String password = request.getParameter("pass1");
    String phno = request.getParameter("phno");
    String type = request.getParameter("type");
    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql1 = "select * from users where email=?";
    try{
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement pst = con.prepareStatement(sql1);
        pst.setString(1,email);
        ResultSet rs = pst.executeQuery();
        if(rs.next()){
            response.sendRedirect("signup.jsp?m2=email");
        }
        else{
            session.setAttribute("vem",email);
            session.setAttribute("vnm",name);
            session.setAttribute("vpas",password);
            session.setAttribute("vphno",phno);
            session.setAttribute("vtype",type);

            int randomPin   =(int) (Math.random()*900000)+100000;
            String otp  = String.valueOf(randomPin);


            session.setAttribute("votp",otp);

            response.sendRedirect("otp.jsp");
        }
    }
    catch(Exception e){
        out.println(e);
    }
    

    


%>