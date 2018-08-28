/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.department;

import beans.MessageEnum;
import controllers.services.DepartmentService;
import controllers.services.EmployeeService;
import controllers.services.LocationService;
import entities.EntitiesEnum;
import entities.Departments;
import entities.Employees;
import entities.Locations;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class DepartmentBean {

    private final DepartmentService service;
    private final MessageEnum messageEnum;

    public DepartmentBean() {
        this.service = new DepartmentService(HibernateUtil.getSessionFactory(), Departments.class, EntitiesEnum.DEPARTMENT) ;
        this.messageEnum = MessageEnum.DEPARTMENT;
    }

    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String departmentId, String departmentName, String manager, String locationId) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(departmentId, departmentName, manager, locationId));
    }

    public ModelAndView findById(String redirect, String id) {
        ModelAndView mav = new ModelAndView(redirect);
        List employees = new EmployeeService(HibernateUtil.getSessionFactory(), Employees.class, EntitiesEnum.EMPLOYEE).binding();
        List locations = new LocationService(HibernateUtil.getSessionFactory(), Locations.class, EntitiesEnum.LOCATION).binding();
        mav.addObject("employees", employees);
        mav.addObject("locations", locations);
        mav.addObject("data", service.findById(id));
        return mav;
    }

    public ModelAndView binding(String redirect) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.binding());
    }

    public ModelAndView find(String redirect, String category, String data) {
        List<Departments> departments = service.find(getCategory(category), data);
        String message = messageEnum.getMessage(departments.isEmpty());
        return getModelAndView(redirect, message, departments);
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
            case 0: return EntitiesEnum.DEPARTMENTID.getProperty();
            case 1: return EntitiesEnum.DEPARTMENTNAME.getProperty();
            case 2: return EntitiesEnum.EMPLOYEEID.getProperty();
            case 3: return EntitiesEnum.LOCATIONID.getProperty();
        }
        return null;
    }
}
