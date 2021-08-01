<%@page import="java.sql.*"%>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql1 = "select * from users where email=?";
    String sql2 = "insert into users(name,email,password,phno,type,stats) values(?,?,?,?,?,?)";
    String email = String.valueOf(session.getAttribute("vem"));
    String pass = String.valueOf(session.getAttribute("vpas"));
    String name = String.valueOf(session.getAttribute("vnm"));
    String phno = String.valueOf(session.getAttribute("vphno"));
    String type = String.valueOf(session.getAttribute("vtype"));
    String votp = String.valueOf(session.getAttribute("votp"));
    String otp = String.valueOf(request.getParameter("otp"));

    if(votp.equals(otp)){
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql1);
        st.setString(1,email);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            response.sendRedirect("signup.jsp?m2=email");
        }
        else{
            PreparedStatement st2 = con.prepareStatement(sql2);
            st2.setString(1,name);
            st2.setString(2,email);
            st2.setString(3,pass);
            st2.setString(4,phno);
            st2.setString(5,type);
            st2.setString(6,"false");
            int rs2 = st2.executeUpdate();
            if(rs2==1){
                session.removeAttribute("vem");
                session.removeAttribute("vpas");
                session.removeAttribute("vnm");
                session.removeAttribute("vphno");
                session.removeAttribute("vtype");
                session.removeAttribute("votp");
                session.invalidate();
                response.sendRedirect("signup.jsp?m1=success");
            }
            else{
               response.sendRedirect("signup.jsp?m3=error");
            }
        }
        }
        catch(Exception e){
            out.println(e);
        }
    }
    else{
        response.sendRedirect("otp.jsp?m1=otp");
        
    }


    

 %>