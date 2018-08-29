<%-- 
    Document   : regionView
    Created on : Aug 26, 2018, 6:10:11 PM
    Author     : Ignatius
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="a" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="r" %>
<!DOCTYPE html>
<html lang="en">

    <c:import url="/WEB-INF/jsp/tags/header.jsp"/>

    <body>

        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>
            <select name="category" data-toggle="dropdown" class="btn btn-sm btn-outline-primary dropdown-toggle"> 
                <option value="0" selected="true">Region ID</option>
                <option value="1">Region Name</option>
            </select>
            <input class="form-control form-control-dark w-50" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-primary w-20" type="submit">Submit</button>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="#">Sign out</a>
                </li>
            </ul>
           
        </nav>

        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link " href="index.htm">
                                    <span data-feather="home"></span> Dashboard 
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="countries.htm"><span data-feather="file"></span> Country</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="departments.htm"><span data-feather="shopping-cart"></span> Department</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="employees.htm"><span data-feather="users"></span> Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="jobs.htm"><span data-feather="bar-chart-2"></span> Job</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="locations.htm"><span data-feather="layers"></span> Location</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="regions.htm"><span data-feather="layers"></span> Region</a>
                            </li>
                        </ul>

                        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                            <span>Saved reports</span>
                            <a class="d-flex align-items-center text-muted" href="#">
                                <span data-feather="plus-circle"></span>
                            </a>
                        </h6>
                        <ul class="nav flex-column mb-2">
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span data-feather="file-text"></span> Current month</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span data-feather="file-text"></span> Last quarter</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span data-feather="file-text"></span> Social engagement</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span data-feather="file-text"></span> Year-end sale </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h1 class="h2">Region</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group mr-2">
                                <a class="btn btn-sm btn-outline-secondary" href="regionDetail.htm?regionId=0">Add Data</a>
                                <button class="btn btn-sm btn-outline-secondary">Export</button>
                            </div>
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                                    <span data-feather="calendar"></span>
                                    This week
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#">Separated link</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <r:out value="${message}"/><br>

                    <!--table-->
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Region ID</th>
                                    <th>Region Name</th>
                                    <th colspan="2" style="text-align: center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% int i = 1;%>
                                <r:forEach var="region" items="${data}">
                                    <tr>
                                        <td><r:out value="<%= i%>"></r:out></td>
                                        <td><r:out value="${region.getRegionId()}"></r:out></td>
                                        <td><r:out value="${region.getRegionName()}"></r:out></td>
                                        <td><a href="regionDetail.htm?regionId=${region.getRegionId()}">Edit</a></td>
                                        <td><a href="regionDrop.htm?regionId=${region.getRegionId()}">Drop</a></td>
                                    </tr>
                                    <% i++;%>
                                </r:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--table end-->
                </main>
            </div>
        </div>
    </body>

    <c:import url="/WEB-INF/jsp/tags/footer.jsp"/>

</html>