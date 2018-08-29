<%-- 
    Document   : viewDepartment
    Created on : Aug 27, 2018, 4:26:40 PM
    Author     : misbah alkhafadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Department</title>
    </head>
    <body>
        <h1>Details Department</h1>
        <% String departmentId = request.getParameter("departmentId"); %>
        <form action="departmentSave.htm">
            <table border="0">
                <tr>
                    <td>Department ID</td>
                    <td>:</td>
                    <td>
                        <% if (departmentId.equalsIgnoreCase("0")) {%>
                        <input type="text" name="departmentId" value="" />
                        <%} else {%>
                        <input type="text" name="departmentId" value="${data.getDepartmentId()}" readonly="readonly" />
                        <%}%>                        
                    </td>
                </tr>
                <tr>
                    <td>Region Name</td>
                    <td>:</td>
                    <td><input type="text" name="departmentName" value="${data.getDepartmentName()}" /></td>
                </tr>
                <tr>
                    <td>Employee ID</td>
                    <td>:</td>
                    <td><input type="text" name="employeeId" value="${data.getEmployees().getEmployeeId()}" /></td>
                </tr>
                <tr>
                    <td>Location ID</td>
                    <td>:</td>
                    <td><input type="text" name="locationId" value="${data.getLocations().getLocationId()}" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
