/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.employee;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Ignatius
 */
public class SaveBeanEmployee implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        return new EmployeeBean().saveOrEdit("employee/viewEmployee", hsr.getParameter("employeeId"), hsr.getParameter("firstName"),
                 hsr.getParameter("lastName"), hsr.getParameter("email"), hsr.getParameter("phoneNumber"), hsr.getParameter("hireDate"), 
                 hsr.getParameter("cmbJob"), hsr.getParameter("salary"), hsr.getParameter("commissionPct"), 
                 hsr.getParameter("cmbEmp"), hsr.getParameter("cmbDept"));
    }    
}
