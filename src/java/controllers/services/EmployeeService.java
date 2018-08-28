/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.services;

import controllers.Controller;
import entities.Departments;
import entities.Employees;
import entities.EntitiesEnum;
import entities.Jobs;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class EmployeeService extends Controller<Employees> {

    private final SessionFactory factory;
    private final Controller<Employees> controller;

    public EmployeeService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.factory = sf;
        this.controller = new Controller(sf, type, table);
    }

    public boolean saveOrEdit(String employeeId, String firstName, String lastName,
            String email, String phoneNumber, String hireDate, String jobId, String salary,
            String commissionPct, String managerId, String departmentId) {
        Departments department = new DepartmentService(factory, Departments.class, EntitiesEnum.DEPARTMENT).findById(departmentId);
        Jobs job = new JobService(factory, Jobs.class, EntitiesEnum.JOB).findById(jobId);
        Employees manager = new EmployeeService(factory, Employees.class, EntitiesEnum.EMPLOYEE).findById(managerId);
        Employees employee = new Employees(new Integer(employeeId), firstName, lastName, email, phoneNumber,
                getHireDate(hireDate), job, new BigDecimal(salary), new BigDecimal(commissionPct),
                manager, department);
        return controller.saveOrEdit(employee);
    }

    public boolean drop(String employeeId) {
        return controller.drop(new Integer(employeeId));
    }

    public Employees findById(String employeeId) {
        return controller.findById(new Integer(employeeId));
    }

    public Date getHireDate(String hireDate) {
        Date date = new Date();
        try {
            date = new SimpleDateFormat("dd/MM/yyyy").parse(hireDate);
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(EmployeeService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return date;
    }
}
