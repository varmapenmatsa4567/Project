<%@page import="java.sql.*"%>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    int id = Integer.parseInt(request.getParameter("id"));
    String sql2 = "select stats from users where id = ?";
    String sql = "update users set stats=? where id = ?";

    try{
        Connection conn = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = conn.prepareStatement(sql2);
        PreparedStatement st2 = conn.prepareStatement(sql);
        st.setInt(1,id);
        ResultSet rs = st.executeQuery();
        rs.next();
        String stats = rs.getString(1);
        if(stats.equals("true")){
            st2.setString(1,"false");
        }
        else{
            st2.setString(1,"true");
        }
        st2.setInt(2,id);
        int rs2 = st2.executeUpdate();
        if(rs2 == 1){
            response.sendRedirect("adminHome.jsp?m1=success");
        }
        else{
            response.sendRedirect("adminHome.jsp?m2=fail");
        }


    }
    catch(Exception e){
        out.println(e);
    }

    

 %>