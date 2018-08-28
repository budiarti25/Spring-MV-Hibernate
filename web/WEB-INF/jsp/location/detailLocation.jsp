<%-- 
    Document   : detailLocation
    Created on : Aug 27, 2018, 4:55:53 PM
    Author     : Dayinta Warih Wulandari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Location</title>
    </head>
    <body>
        <h1>Details Location</h1>
        <% String locationId = request.getParameter("locationId"); %>
        <form action="locationSave.htm">
            <table border="0">
                <% if (locationId.equalsIgnoreCase("0")) {%>
                <tr>
                    <td>Location ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="locationId" value="" />

                    </td>
                </tr>
                <tr>
                    <td>Street Address</td>
                    <td>:</td>
                    <td><input type="text" name="streetAddress" value="${data.getStreetAddress()}" /></td>
                </tr>
                <tr>
                    <td>Postal Code</td>
                    <td>:</td>
                    <td><input type="text" name="postalCode" value="${data.getPostalCode()}" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>:</td>
                    <td><input type="text" name="city" value="${data.getCity()}" /></td>
                </tr>
                <tr>
                    <td>State Province</td>
                    <td>:</td>
                    <td><input type="text" name="stateProvince" value="${data.getStateProvince()}" /></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>:</td>
                    <td>
                        <select name="cmbCountry">
                            <r:forEach var="country" items="${countries}">
                                <option value="${country.getCountryId()}">
                                    <r:out value="${country.getCountryName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
                <%} else {%>
                <tr>
                    <td>Location ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="locationId" value="${data.getLocationId()}" readonly="readonly" />

                    </td>
                </tr>
                <tr>
                    <td>Street Address</td>
                    <td>:</td>
                    <td><input type="text" name="streetAddress" value="${data.getStreetAddress()}" /></td>
                </tr>
                <tr>
                    <td>Postal Code</td>
                    <td>:</td>
                    <td><input type="text" name="postalCode" value="${data.getPostalCode()}" /></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>:</td>
                    <td><input type="text" name="city" value="${data.getCity()}" /></td>
                </tr>
                <tr>
                    <td>State Province</td>
                    <td>:</td>
                    <td><input type="text" name="stateProvince" value="${data.getStateProvince()}" /></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td>:</td>
                    <td>
                        <select name="cmbCountry">
                            <r:forEach var="country" items="${countries}">
                                <r:choose>
                                    <r:when test="${data.getCountries().getCountryName() == country.getCountryName()}">
                                        <option value="${country.getCountryId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${country.getCountryId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${country.getCountryName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
                <%}%>  
            </table>
        </form>
    </body>
</html>

