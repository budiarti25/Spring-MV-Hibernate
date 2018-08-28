<%-- 
    Document   : ReportManager
    Created on : Aug 29, 2018, 2:32:47 AM
    Author     : muhammad
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="org.hibernate.engine.jdbc.connections.spi.ConnectionProvider"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hey, manager be carefully!</h1>
        <% 
        
        int id = Integer.parseInt(request.getParameter("managerId"));
        Connection conn = null;
        try{
            conn = HibernateUtil.getSessionFactory().getSessionFactoryOptions()
                .getServiceRegistry().getService(ConnectionProvider.class).getConnection();
       
            conn.createStatement().execute("alter session set "
                + "current_schema = hr");

            File reportFile = new File(application.getRealPath("//WEB-INF//reports//Manager.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            parameters.put("managerId", id);
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
 
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
            }catch (Exception exx){
            out.print("Error"+exx.getMessage());
        }
        %>
    </body>
</html>
