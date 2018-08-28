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
        <title>List Employees</title>
    </head>
    <body>
        <h1>This Employee View</h1><hr>
        
        <form action="findEmp.htm">
            <input type="text" name="managerId" value="">
            <button type="submit">Find Employees</button>
        </form>
        
        <form action="employeeSearch.htm">
            <table>
                <tr>
                    <td></td>
                    <td><select name="category">
                            <option value="0" selected="true">Employee ID</option>
                            <option value="1">First Name</option>
                            <option value="2">Last Name</option>
                            <option value="3">Email</option>
                            <option value="4">Phone Number</option>
                            <option value="5">Hire Date</option>
                            <option value="6">Job Title</option>
                            <option value="7">Salary</option>
                            <option value="8">Commission Pct</option>
                            <option value="9">Manager</option>
                            <option value="10">Department</option>
                        </select></td>
                    <td><input type="text" name="search" value="" /></td>
                    <td><input type="submit" name="find"/></td>
                </tr>
            </table>
        </form><hr><br>
        
        <!--button print report -->
        <form action="reportEmp.htm">
            <!--<input type="text" name="employeeId" value="">-->
            <button type="submit">All Data Employees</button>
        </form>
        
        <r:out value="${message}"/><br>
        <a href="employeeDetail.htm?employeeId=0">Add Employee</a>
        <table border="1">
            <thead align="center">
                <tr>
                    <th>No</th>
                    <th>Employee ID</th>
                    <th>Employee First Name</th>
                    <th>Employee Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Hire Date</th>
                    <th>Job Title</th>
                    <th>Salary</th>
                    <th>Commission Pct</th>
                    <th>Manager</th>
                    <th>Department</th>
                    <th colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% int i = 1;%>
                <r:forEach var="employee" items="${data}">
                    <tr>
                        <td><r:out value="<%= i%>"></r:out></td>
                        <td><r:out value="${employee.getEmployeeId()}"></r:out></td>
                        <td><r:out value="${employee.getFirstName()}"></r:out></td>
                        <td><r:out value="${employee.getLastName()}"></r:out></td>
                        <td><r:out value="${employee.getEmail()}"></r:out></td>
                        <td><r:out value="${employee.getPhoneNumber()}"></r:out></td>
                        <td><r:out value="${employee.getHireDate()}"></r:out></td>
                        <td><r:out value="${employee.getJobs().getJobTitle()}"></r:out></td>
                        <td><r:out value="${employee.getSalary()}"></r:out></td>
                        <td><r:out value="${employee.getCommissionPct()}"></r:out></td>
                        <td><r:out value="${employee.getEmployees().getFirstName()}"></r:out></td>
                        <td><r:out value="${employee.getDepartments().getDepartmentName()}"></r:out></td>
                        <td><a href="employeeDetail.htm?employeeId=${employee.getEmployeeId()}">Edit</a></td>
                        <td><a href="employeeDrop.htm?employeeId=${employee.getEmployeeId()}">Drop</a></td>
                    </tr>
                    <% i++;%>
                </r:forEach>
            </tbody>
        </table>

    </body>
</html>