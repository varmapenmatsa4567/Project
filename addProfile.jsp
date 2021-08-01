<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<% 

    String url = "jdbc:mysql://localhost:3306/jobs";
	String user = "root";
	String pas = "root123";
    String sql = "insert into profile(name,gender,email,phno,exp,skill,file,user) values(?,?,?,?,?,?,?,?)";
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String phno = request.getParameter("phno");
    String gender = request.getParameter("gender");
    String exp = request.getParameter("exp");
    String skill = request.getParameter("sk");
    String uname = String.valueOf(session.getAttribute("user"));
    String un = uname.substring(0, uname.lastIndexOf("@"));
    String f = request.getPart("file").getSubmittedFileName();
    String filename = un + f.substring(f.lastIndexOf("."));
    String fileUploadPath = request.getRealPath("/")+"files";


    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,user,pas);
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1,name);
        st.setString(2,gender);
        st.setString(3,email);
        st.setString(4,phno);
        st.setString(5,exp);
        st.setString(6,skill);
        st.setString(7,filename);
        st.setString(8,uname);
        int rs = st.executeUpdate();
        if(rs==1){
            for (Part part : request.getParts()) {
              part.write(fileUploadPath + File.separator + filename);
            }
            response.sendRedirect("profile.jsp");
        }
        else{
            response.sendRedirect("seeker.jsp");
        }

    
    }
    catch(Exception e){
        out.println(e);
    }

 %>