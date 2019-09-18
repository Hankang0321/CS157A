<%--
  Created by IntelliJ IDEA.
  User: Han
  Date: 9/16/19
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="java.sql.*"%>
<html>
<head>
    <title>JDBC Connection example</title>
</head>
<body>
<h1>JDBC Connection Example</h1>
<%
    try {
        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT", "root", "password");
        out.println("<br/>CS157A" + " database successfully opened.<br/><br/>");
        Statement s = con.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM student");
%>

<TABLE cellpadding="15" border="2" align=center style="align-content: center">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
        </tr>
    </thead>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getInt(3)%></td>
    </tr>
    <% } %>
    <%
        rs.close();
        s.close();
        con.close();
    } catch (SQLException e) {
    %>
    <%      out.println("SQLexception caught: " + e.getMessage());
    }
    %>
</TABLE>

</body>
</html>
