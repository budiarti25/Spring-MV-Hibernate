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
        <title>Details Employee</title>
    </head>
    <body>
        <h1>Details Employee</h1>
        <% String employeeId = request.getParameter("employeeId"); %>
        <form action="employeeSave.htm">
            <table border="0">
                <% if (employeeId.equalsIgnoreCase("0")) {%>
                <tr>
                    <td>Employee ID</td>
                    <td>:</td>
                    <td>
                        <input type="text" name="employeeId" value="" />                    
                    </td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>:</td>
                    <td><input type="text" name="firstName" value="${data.ggetFirstName()}" /></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>:</td>
                    <td><input type="text" name="lastName" value="${data.getLastName()}" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>:</td>
                    <td><input type="text" name="email" value="${data.getEmail()}" /></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>:</td>
                    <td><input type="text" name="phoneNumber" value="${data.getPhoneNumber()}" /></td>
                </tr>
                <tr>
                    <td>Hire Date</td>
                    <td>:</td>
                    <td><input type="text" name="hireDate" value="${data.getHireDate()}" /></td>
                </tr>
                <tr>
                    <td>Job</td>
                    <td>:</td>
                    <td>
                        <select name="cmbJob">
                            <r:forEach var="job" items="${jobs}">
                                <option value="${job.getJobId()}">
                                    <r:out value="${job.getJobTitle()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td>:</td>
                    <td><input type="text" name="salary" value="${data.getSalary()}" /></td>
                </tr>
                <tr>
                    <td>Commission Pct</td>
                    <td>:</td>
                    <td><input type="text" name="commissionPct" value="${data.getCommissionPct()}" /></td>
                </tr>
                <tr>
                    <td>Manager</td>
                    <td>:</td>
                    <td>
                        <select name="cmbEmp">
                            <r:forEach var="emp" items="${employees}">
                                <option value="${emp.getEmployeeId()}">
                                    <r:out value="${emp.getFirstName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>:</td>
                    <td>
                        <select name="cmbDept">
                            <r:forEach var="dept" items="${departments}">
                                <option value="${dept.getDepartmentId()}">
                                    <r:out value="${dept.getDepartmentName()}"></r:out>
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
                    <td>Employee ID</td>
                    <td>:</td>
                    <td>

                        <input type="text" name="employeeId" value="${data.getEmployeeId()}" readonly="readonly" />                     
                    </td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>:</td>
                    <td><input type="text" name="firstName" value="${data.getFirstName()}" /></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td>:</td>
                    <td><input type="text" name="lastName" value="${data.getLastName()}" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>:</td>
                    <td><input type="text" name="email" value="${data.getEmail()}" /></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td>:</td>
                    <td><input type="text" name="phoneNumber" value="${data.getPhoneNumber()}" /></td>
                </tr>
                <tr>
                    <td>Hire Date</td>
                    <td>:</td>
                    <td><input type="date" name="hireDate" value="${data.getHireDate()}" /></td>
                </tr>
                <tr>
                    <td>Job</td>
                    <td>:</td>
                    <td>
                        <select name="cmbJob">
                            <r:forEach var="job" items="${jobs}">
                                <r:choose>
                                    <r:when test="${data.getJobs().getJobTitle() == job.getJobTitle()}">
                                        <option value="${job.getJobId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${job.getJobId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${job.getJobTitle()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td>:</td>
                    <td><input type="text" name="salary" value="${data.getSalary()}" /></td>
                </tr>
                <tr>
                    <td>Commission Pct</td>
                    <td>:</td>
                    <td><input type="text" name="commissionPct" value="${data.getCommissionPct()}" /></td>
                </tr>
                <tr>
                    <td>Manager</td>
                    <td>:</td>
                    <td>
                        <select name="cmbEmp">
                            <r:forEach var="emp" items="${employees}">
                                <r:choose>
                                    <r:when test="${data.getEmployees().getFirstName() == emp.getFirstName()}">
                                        <option value="${emp.getEmployeeId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${emp.getEmployeeId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${emp.getFirstName()}"></r:out>
                                    </option>
                            </r:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>:</td>
                    <td>
                        <select name="cmbDept">
                            <r:forEach var="dept" items="${departments}">
                                <r:choose>
                                    <r:when test="${data.getDepartments().getDepartmentName() == dept.getDepartmentName()}">
                                        <option value="${dept.getDepartmentId()}" selected="true">
                                        </r:when>
                                        <r:otherwise>
                                        <option value="${dept.getDepartmentId()}">
                                        </r:otherwise>
                                    </r:choose>
                                    <r:out value="${dept.getDepartmentName()}"></r:out>
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

