<%-- 
    Document   : viewLocation
    Created on : Aug 27, 2018, 4:56:04 PM
    Author     : Dayinta Warih Wulandari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Locations</title>
    </head>
    <body>
        <h1>This Location View</h1><hr>
        <form action="locationSearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Location ID</option>
                            <option value="1">Street Address</option>
                            <option value="2">Postal Code</option>
                            <option value="3">City</option>
                            <option value="4">State Province</option>
                            <option value="5">Country</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
        <r:out value="${message}"/><br>
        <a href="locationDetail.htm?locationId=0">Add Location</a>
        <table border="1">
            <thead align="center">
                <tr>
                    <th>No</th>
                    <th>Location ID</th>
                    <th>Street Address</th>
                    <th>Postal Code</th>
                    <th>City</th>
                    <th>State Province</th>
                    <th>Country</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <r:forEach var="location" items="${data}">
                    <tr>
                        <td><r:out value="<%= i%>"></r:out></td>
                        <td><r:out value="${location.getLocationId()}"></r:out></td>
                        <td><r:out value="${location.getStreetAddress()}"></r:out></td>
                        <td><r:out value="${location.getPostalCode()}"></r:out></td>
                        <td><r:out value="${location.getCity()}"></r:out></td>
                        <td><r:out value="${location.getStateProvince()}"></r:out></td>
                        <td><r:out value="${location.getCountries().getCountryName()}"></r:out></td>
                        <td><a href="locationDetail.htm?locationId=${location.getLocationId()}">Edit</a></td>
                        <td><a href="locationDrop.htm?locationId=${location.getLocationId()}">Drop</a></td>
                    </tr>
                    <% i++;%>
                </r:forEach>
            </tbody>
        </table>

    </body>
</html>