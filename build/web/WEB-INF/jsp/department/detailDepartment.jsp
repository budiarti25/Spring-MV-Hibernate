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
        <title>Details Department</title>
    </head>
    <body>
        <h1>Details Department</h1>
        <% String departmentId = request.getParameter("departmentId"); %>
        <form action="departmentSave.htm">
            <table border="0">
                <% if (departmentId.equalsIgnoreCase("0")) {%>
                <tr>
                    <td>Department ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="departmentId" value="" />                     
                    </td>
                </tr>
                <tr>
                    <td>Department Name</td>
                    <td>:</td>
                    <td><input type="text" name="departmentName" value="${data.getDepartmentName()}" /></td>
                </tr>
                <tr>
                    <td>Manager</td>
                    <td>:</td>
                    <td>
                        <select name="cmbManager">
                            <r:forEach var="managers" items="${employees}">
                                <option value="${managers.getEmployeeId()}">
                                    <r:out value="${managers.getFirstName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>:</td>
                    <td>
                        <select name="cmbLocation">
                            <r:forEach var="locations" items="${locations}">
                                <option value="${locations.getLocationId()}">
                                    <r:out value="${locations.getStreetAddress()}"></r:out>
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
                    <td>Department ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="departmentId" value="${data.getDepartmentId()}" readonly="readonly" />                      
                    </td>
                </tr>
                <tr>
                    <td>Department Name</td>
                    <td>:</td>
                    <td><input type="text" name="departmentName" value="${data.getDepartmentName()}" /></td>
                </tr>
                <tr>
                    <td>Manager</td>
                    <td>:</td>
                    <td>
                        <select name="cmbManager">
                            <r:forEach var="managers" items="${employees}">
                                <r:choose>
                                    <r:when test="${data.getEmployees().getFirstName() == managers.getFirstName()}">
                                        <option value="${managers.getEmployeeId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${managers.getEmployeeId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${managers.getFirstName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td>:</td>
                    <td>
                        <select name="cmbLocation">
                            <r:forEach var="locations" items="${locations}">
                                <r:choose>
                                    <r:when test="${data.getLocations().getStreetAddress() == locations.getStreetAddress()}">
                                        <option value="${locations.getLocationId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${locations.getLocationId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${locations.getStreetAddress()}"></r:out>
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

