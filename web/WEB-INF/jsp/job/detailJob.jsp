<%-- 
    Document   : detail
    Created on : Aug 27, 2018, 3:23:56 PM
    Author     : Dayinta Warih Wulandari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Job</title>
    </head>
    <body>
        <h1>Details Job</h1>
        <% String jobId = request.getParameter("jobId"); %>
        <form action="jobSave.htm">
            <table border="0">
                <tr>
                    <td>Job ID</td>
                    <td>:</td>
                    <td>
                        <% if (jobId.equalsIgnoreCase("0")) {%>
                        <input type="text" name="jobId" value="" />
                        <%} else {%>
                        <input type="text" name="jobId" value="${data.getJobId()}" readonly="readonly" />
                        <%}%>                        
                    </td>
                </tr>
                <tr>
                    <td>Job Title</td>
                    <td>:</td>
                    <td><input type="text" name="jobTitle" value="${data.getJobTitle()}" /></td>
                </tr>
                <tr>
                    <td>Min Salary</td>
                    <td>:</td>
                    <td><input type="text" name="minSalary" value="${data.getMinSalary()}" /></td>
                </tr>
                <tr>
                    <td>Max Salary</td>
                    <td>:</td>
                    <td><input type="text" name="maxSalary" value="${data.getMaxSalary()}" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
            </table>
        </form>
                <a href="jobs.htm">Back</a>
    </body>
</html>

