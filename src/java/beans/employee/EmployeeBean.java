/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.employee;

import beans.MessageEnum;
import controllers.services.DepartmentService;
import controllers.services.EmployeeService;
import controllers.services.JobService;
import entities.Departments;
import entities.EntitiesEnum;
import entities.Employees;
import entities.Jobs;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class EmployeeBean {

    private final EmployeeService service;
    private final MessageEnum messageEnum;

    public EmployeeBean() {
        this.service = new EmployeeService(HibernateUtil.getSessionFactory(), Employees.class, EntitiesEnum.EMPLOYEE);
        this.messageEnum = MessageEnum.EMPLOYEE;
    }

    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String employeeId, String firstName, String lastName, String email,
            String phoneNumber, String hireDate, String jobId, String salary, String commissionPct,
            String managerId, String departmentId) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(
                employeeId, firstName, lastName, email,
                phoneNumber, hireDate, jobId, salary, commissionPct,
                managerId, departmentId
        ));
    }

    public ModelAndView findById(String redirect, String id) {
        ModelAndView mav = new ModelAndView(redirect);
        List departments = new DepartmentService(HibernateUtil.getSessionFactory(), Departments.class, EntitiesEnum.DEPARTMENT).binding();
        List jobs = new JobService(HibernateUtil.getSessionFactory(), Jobs.class, EntitiesEnum.JOB).binding();
        List employees = new EmployeeService(HibernateUtil.getSessionFactory(), Employees.class, EntitiesEnum.EMPLOYEE).binding();
        mav.addObject("departments", departments);
        mav.addObject("jobs", jobs);
        mav.addObject("employees", employees);
        mav.addObject("data", service.findById(id));
        return mav;
    }

    public ModelAndView binding(String redirect) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.binding());
    }

    public ModelAndView find(String redirect, String category, String data) {
        List<Employees> employees = service.find(getCategory(category), data);
        String message = messageEnum.getMessage(employees.isEmpty());
        return getModelAndView(redirect, message, employees);
    }

    private ModelAndView getModelAndView(String redirect, String message, List list) {
        ModelAndView mav = new ModelAndView(redirect);
        mav.addObject("message", message);
        mav.addObject("data", list);
        return mav;
    }

    private String getCategory(String category) {
        int ctgry = Integer.valueOf(category);
        switch (ctgry) {
            case 0:
                return EntitiesEnum.EMPLOYEEID.getProperty();
            case 1:
                return EntitiesEnum.EMPLOYEEFIRSTENAME.getProperty();
            case 2:
                return EntitiesEnum.EMPLOYEELASTNAME.getProperty();
            case 3:
                return EntitiesEnum.EMPLOYEEEMAIL.getProperty();
            case 4:
                return EntitiesEnum.EMPLOYEEPHONE.getProperty();
            case 5:
                return EntitiesEnum.EMPLOYEEHIRE.getProperty();
            case 6:
                return EntitiesEnum.JOBID.getProperty();
            case 7:
                return EntitiesEnum.EMPLOYEESALARY.getProperty();
            case 8:
                return EntitiesEnum.EMPLOYEECOMMISSION.getProperty();
            case 9:
                return EntitiesEnum.EMPLOYEEID.getProperty();
            case 10:
                return EntitiesEnum.DEPARTMENTID.getProperty();
        }
        return null;
    }
}
