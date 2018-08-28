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
import entities.Locations;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class DepartmentService extends Controller<Departments> {

    private final SessionFactory factory;
    private final Controller<Departments> controller;

    public DepartmentService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.factory = sf;
        this.controller = new Controller(sf, type, table);
    }

    public boolean saveOrEdit(String departmentId, String departmentName, String employeeId, String locationId){
       Employees employee= new EmployeeService(factory, Employees.class, EntitiesEnum.EMPLOYEE).findById(employeeId);
       Locations location = new LocationService(factory, Locations.class, EntitiesEnum.LOCATION).findById(locationId);
       Departments department = new Departments(new Short(departmentId), departmentName, employee, location);
       return controller.saveOrEdit(department);
    }
    
    public boolean drop(String departmentId){
        return controller.drop(new Short(departmentId));
    }
    
    public Departments findById(String departmentId){
        return controller.findById(new Short(departmentId));
    }
}
