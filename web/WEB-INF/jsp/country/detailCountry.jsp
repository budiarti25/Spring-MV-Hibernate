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
        <title>Details Country</title>
    </head>
    <body>
        <h1>Details Country</h1>
        <% String countryId = request.getParameter("countryId"); %>
        <form action="countrySave.htm">
            <table border="0">
                <% if (countryId.equalsIgnoreCase("0")) {%>
                <tr>
                    <td>Country ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="countryId" value="" />
                    </td>
                </tr>
                <tr>
                    <td>Country Name</td>
                    <td>:</td>
                    <td><input type="text" name="countryName" value="${data.getCountryName()}" /></td>
                </tr>
                <tr>
                    <td>Region</td>
                    <td>:</td>
                    <td>
                        <select name="cmbRegion">
                            <r:forEach var="region" items="${regions}">
                                <option value="${region.getRegionId()}">
                                    <r:out value="${region.getRegionName()}"></r:out>
                                </option>
                            </r:forEach>
                        </select> 
                    </td>
                </tr>
                <%} else {%>
                <tr>
                    <td>Country ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="countryId" value="${data.getCountryId()}" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>Country Name</td>
                    <td>:</td>
                    <td><input type="text" name="countryName" value="${data.getCountryName()}" /></td>
                </tr>
                <tr>
                    <td>Region</td>
                    <td>:</td>
                    <td>
                        <select name="cmbRegion">
                            <r:forEach var="region" items="${regions}">
                                <r:choose>
                                    <r:when test="${data.getRegions().getRegionName() == region.getRegionName()}">
                                        <option value="${region.getRegionId()}" selected="true">
                                    </r:when>
                                    <r:otherwise>
                                        <option value="${region.getRegionId()}">
                                    </r:otherwise>
                                </r:choose>
                                    <r:out value="${region.getRegionName()}"></r:out>
                                </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <%}%>     
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>                       
            </table>
        </form>
    </body>
</html>

