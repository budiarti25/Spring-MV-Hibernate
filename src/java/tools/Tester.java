/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import entities.Countries;
import entities.Employees;
import entities.EntitiesEnum;
import entities.Regions;
import org.hibernate.SessionFactory;
import controllers.services.CountryService;
import controllers.services.EmployeeService;
import controllers.services.RegionService;

/**
 *
 * @author Ignatius
 */
public class Tester {

    public static void main(String[] args) throws Exception {
        SessionFactory factory = HibernateUtil.getSessionFactory();
        RegionService regionService = new RegionService(factory, Regions.class, EntitiesEnum.REGION);
//        Regions reg = regionService.findById("1");
//        System.out.println(reg.getRegionName());        
//        System.out.println(regionService.drop("6"));
//        System.out.println(regionService.saveOrEdit("6", "Papua"));
//        for (Regions regions : regionService.binding()) {
        for (Regions regions : regionService.find(EntitiesEnum.REGIONNAME.getProperty(), "In")) {
            System.out.println(regions.getRegionId()+". Regions: "+regions.getRegionName()+" : ");
            for (Object countriese : regions.getCountrieses()) {
                Countries counties = (Countries) countriese;
                System.out.println(" - "+counties.getCountryName());
            }
            System.out.println("");
        }
        CountryService countryService = new CountryService(factory, Countries.class, EntitiesEnum.COUNTRY);
//        System.out.println(countryService.saveOrEdit("SN", "Suriname", "6"));
//        System.out.println(countryService.drop("SN"));
//        Countries country = countryService.findById("SN");
//        System.out.println(country.getCountryName());

        EmployeeService employeeService = new EmployeeService(factory, Employees.class, EntitiesEnum.EMPLOYEE);
//        System.out.println(employeeService.getHireDate("31-12-1998"));
//        System.out.println(employeeService.saveOrEdit("001", "Joko", "Santosa", "joekelirs", "085747478817", "22/01/2018", "7000", "0", "0", "AD_PRES", "0"));
        Employees employee = employeeService.findById("001");
        System.out.println(employee.getHireDate());
        System.out.println(employee.getHireDates());
    }
}
