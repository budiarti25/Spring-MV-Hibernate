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
        <title>List Jobs</title>
    </head>
    <body>
        <h1>This Job View</h1><hr>
        <form action="jobSearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Job ID</option>
                            <option value="1">Job Title</option>
                            <option value="2">Minimal Salary</option>
                            <option value="3">Maximal Salary</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
        <r:out value="${message}"/><br>
        <a href="jobDetail.htm?jobId=0">Add Job</a>
        <table border="1">
            <thead align="center">
                <tr>
                    <th>No</th>
                    <th>Job ID</th>
                    <th>Job Title</th>
                    <th>Minimal Salary</th>
                    <th>Maximal Salary</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <r:forEach var="job" items="${data}">
                    <tr>
                        <td><r:out value="<%= i%>"></r:out></td>
                        <td><r:out value="${job.getJobId()}"></r:out></td>
                        <td><r:out value="${job.getJobTitle()}"></r:out></td>
                        <td><r:out value="${job.getMinSalary()}"></r:out></td>
                        <td><r:out value="${job.getMaxSalary()}"></r:out></td>
                        <td><a href="jobDetail.htm?jobId=${job.getJobId()}">Edit</a></td>
                        <td><a href="jobDrop.htm?jobId=${job.getJobId()}">Drop</a></td>
                    </tr>
                    <% i++;%>
                </r:forEach>
            </tbody>
        </table>
<a href="index.htm">Home</a>
    </body>
</html>