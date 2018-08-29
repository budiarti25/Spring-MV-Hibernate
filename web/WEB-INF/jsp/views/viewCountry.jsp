<%-- 
    Document   : viewCountry
    Created on : Aug 28, 2018, 10:39:42 AM
    Author     : misbah alkhafadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This Country View</h1>
        <a href="index.htm">Back To Index</a>
        <hr>
        <form action="countrySearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Country ID</option>
                            <option value="1">Country Name</option>
                            <option value="2">Region ID</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
    <r:out value="${message}"/><br>
    <a href="countryDetail.htm?countryId=0">Add Country</a>
    <table border="1">
        <thead align="center">
            <tr>
                <th>No</th>
                <th>Country ID</th>
                <th>Country Name</th>
                <th>Region ID</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <% int i = 1;%>
        <r:forEach var="country" items="${data}">
            <tr>
                <td><r:out value="<%= i%>"></r:out></td>
            <td><r:out value="${country.getCountryId()}"></r:out></td>
            <td><r:out value="${country.getCountryName()}"></r:out></td>
            <td><r:out value="${country.getRegions().getRegionId()}"></r:out></td>
            <td><a href="countryDetail.htm?countryId=${country.getCountryId()}">Edit</a></td>
            <td><a href="countryDrop.htm?countryId=${country.getCountryId()}">Drop</a></td>
            </tr>
            <% i++;%>
        </r:forEach>
        </tbody>
    </table>
</body>
</html>
