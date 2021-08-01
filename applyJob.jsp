<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date" %>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "insert into application values(?,?,?,?)";
    String uname = String.valueOf(session.getAttribute("user"));
    String jobId = request.getParameter("jobId");
    String profileId = request.getParameter("profileId");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    Date date = new Date();  
    String dt = formatter.format(date);

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1,Integer.parseInt(jobId));
        st.setString(2,uname);
        st.setInt(3,Integer.parseInt(profileId));
        st.setString(4,dt);
        int rs = st.executeUpdate();
        if(rs==1){
            response.sendRedirect("viewJob.jsp?id="+jobId);
        }
        else{
            out.println("Error");
        }
    }
    catch(Exception e){
        out.println(e);
    }

 %>