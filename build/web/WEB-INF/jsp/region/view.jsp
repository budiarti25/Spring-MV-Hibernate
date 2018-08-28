<%-- 
    Document   : regionView
    Created on : Aug 26, 2018, 6:10:11 PM
    Author     : Ignatius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Regions</title>
    </head>
    <body>
        <h1>This Region View</h1><hr>
        <form action="regionSearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Region ID</option>
                            <option value="1">Region Name</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
        <r:out value="${message}"/><br>
        <a href="regionDetail.htm?regionId=0">Add Region</a>
        <table border="1">
            <thead align="center">
                <tr>
                    <th>No</th>
                    <th>Region ID</th>
                    <th>Region Name</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <r:forEach var="region" items="${data}">
                    <tr>
                        <td><r:out value="<%= i%>"></r:out></td>
                        <td><r:out value="${region.getRegionId()}"></r:out></td>
                        <td><r:out value="${region.getRegionName()}"></r:out></td>
                        <td><a href="regionDetail.htm?regionId=${region.getRegionId()}">Edit</a></td>
                        <td><a href="regionDrop.htm?regionId=${region.getRegionId()}">Drop</a></td>
                    </tr>
                    <% i++;%>
                </r:forEach>
            </tbody>
        </table>
<a href="index.htm">Home</a>
    </body>
</html>
