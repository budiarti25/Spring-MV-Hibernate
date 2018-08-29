<%-- 
    Document   : regionDetail
    Created on : Aug 26, 2018, 8:00:59 PM
    Author     : Ignatius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Region</title>
    </head>
    <body>
        <h1>Details Region</h1>
        <% String regionId = request.getParameter("regionId"); %>
        <form action="regionSave.htm">
            <table border="0">
                <tr>
                    <td>Region ID</td>
                    <td>:</td>
                    <td>
                        <% if (regionId.equalsIgnoreCase("0")) {%>
                        <input type="text" name="regionId" value="" />
                        <%} else {%>
                        <input type="text" name="regionId" value="${data.getRegionId()}" readonly="readonly" />
                        <%}%>                        
                    </td>
                </tr>
                <tr>
                    <td>Region Name</td>
                    <td>:</td>
                    <td><input type="text" name="regionName" value="${data.getRegionName()}" /></td>
                </tr>
                <tr>
                    <td colspan="3" align="right"><input type="submit" value="Save" name="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
