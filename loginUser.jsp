<%@page import="java.sql.*"%>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "select type,stats from users where email=? and password=?";
    String email = request.getParameter("email");
    String pass = request.getParameter("pass1");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,email);
        st.setString(2,pass);
        ResultSet rs = st.executeQuery();
        if(rs.next()){
            String status = rs.getString(2);
            if(status.equals("true")){
                String type = rs.getString(1);
                session.setAttribute("user",email);
                session.setAttribute("type",type);
                if(type.equals("Employer")){
                    response.sendRedirect("employer.jsp");
                }
                else{
                    response.sendRedirect("seeker.jsp");
                }
            }
            else{
                response.sendRedirect("login.jsp?m2=status");
            }
        }
        else{
            response.sendRedirect("login.jsp?m1=fail");
        }
    }
    catch(Exception e){
        out.println(e);
    }

 %>