<%-- 
    Document   : view
    Created on : Aug 27, 2018, 3:23:12 PM
    Author     : Dayinta Warih Wulandari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Departments</title>
    </head>
    <body>
        <h1>This Department View</h1><hr>
        <form action="departmentSearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Department ID</option>
                            <option value="1">Department Name</option>
                            <option value="2">Manager</option>
                            <option value="3">Location</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
        <r:out value="${message}"/><br>
        <a href="departmentDetail.htm?departmentId=0">Add Department</a>
        <table border="1">
            <thead align="center">
                <tr>
                    <th>No</th>
                    <th>Department ID</th>
                    <th>Department Title</th>
                    <th>Manager</th>
                    <th>Location</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <r:forEach var="department" items="${data}">
                    <tr>
                        <td><r:out value="<%= i%>"></r:out></td>
                        <td><r:out value="${department.getDepartmentId()}"></r:out></td>
                        <td><r:out value="${department.getDepartmentName()}"></r:out></td>
                        <td><r:out value="${department.getEmployees().getFirstName()}"></r:out></td>
                        <td><r:out value="${department.getLocations().getStreetAddress()}"></r:out></td>
                        <td><a href="departmentDetail.htm?departmentId=${department.getDepartmentId()}">Edit</a></td>
                        <td><a href="departmentDrop.htm?departmentId=${department.getDepartmentId()}">Drop</a></td>
                    </tr>
                    <% i++;%>
                </r:forEach>
            </tbody>
        </table>

    </body>
</html>