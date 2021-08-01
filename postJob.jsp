<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat,java.util.Date" %>

<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "insert into post(email,title,company,des,experience,skill,type,loc,dt) values(?,?,?,?,?,?,?,?,?)";
    String email = String.valueOf(session.getAttribute("user"));
    String title = request.getParameter("title");
    String company = request.getParameter("company");
    String des = request.getParameter("des");
    String exp = request.getParameter("exp");
    String sk = request.getParameter("sk");
    String type = request.getParameter("type");
    String loc = request.getParameter("loc");
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
    Date date = new Date();  
    String dt = formatter.format(date);

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,email);
        st.setString(2,title);
        st.setString(3,company);
        st.setString(4,des);
        st.setString(5,exp);
        st.setString(6,sk);
        st.setString(9,dt);
        st.setString(7,type);
        st.setString(8,loc);
        int rs = st.executeUpdate();
        if(rs==1){
            response.sendRedirect("post.jsp?m1=success");
        }
        else{
           response.sendRedirect("post.jsp?m2=error");
        }
    }
    catch(Exception e){
        out.println(email);
        out.println(e);
    }

 %>