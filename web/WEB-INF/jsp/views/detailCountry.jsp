<%-- 
    Document   : detailCountry
    Created on : Aug 28, 2018, 10:39:25 AM
    Author     : misbah alkhafadh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Country</title>
    </head>
    <body>
        <h1>Details Country</h1>
        <% String countryId = request.getParameter("countryId"); %>
        <form action="countrySave.htm">
            <table border="0">
                <tr>
                    <td>Country ID</td>
                    <td>:</td>
                    <td>
                        <% if (countryId.equalsIgnoreCase("0")) {%>
                        <input type="text" name="countryId" value="" />
                        <%} else {%>
                        <input type="text" name="countryId" value="${data.getCountryId()}" readonly="readonly" />
                        <%}%>                        
                    </td>
                </tr>
                <tr>
                    <td>Country Name</td>
                    <td>:</td>
                    <td><input type="text" name="countryName" value="${data.getCountryName()}" /></td>
                </tr>
                <tr>
                    <td>Region Id</td>
                    <td>:</td>
                    <td><input type="text" name="regionId" value="${data.getRegions().getRegionId()}" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
            </table>
        </form>
</body>
</html>
