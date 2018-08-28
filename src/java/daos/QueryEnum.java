/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.EntitiesEnum;

/**
 *
 * @author Ignatius
 */
public enum QueryEnum {
    COUNTRY, DEPARTMENT, EMPLOYEE, JOB, LOCATION, REGION;

    private String getOrderBy(QueryEnum qe) {
        switch (this) {
            case COUNTRY:
                return EntitiesEnum.COUNTRYID.getProperty();
            case DEPARTMENT:
                return EntitiesEnum.DEPARTMENTID.getProperty();
            case EMPLOYEE:
                return EntitiesEnum.EMPLOYEEID.getProperty();
            case JOB:
                return EntitiesEnum.JOBID.getProperty();
            case LOCATION:
                return EntitiesEnum.LOCATIONID.getProperty();
            case REGION:
                return EntitiesEnum.REGIONID.getProperty();
        }
        return null;
    }

    public String getQuery(EntitiesEnum entitiesEnum) {
        return "FROM " + entitiesEnum.getProperty() + " ORDER BY " + getOrderBy(this) + " ASC";
    }

    public String getQuery(EntitiesEnum entitiesEnum, String category, String data) {
        return "FROM " + entitiesEnum.getProperty() + " WHERE " + category + " LIKE '%" + data + "%'"
                + " OR " + category + " LIKE '%" + data.toLowerCase() + "%' OR "+ category + " LIKE '%" 
                + data.toUpperCase() + "%' ORDER BY " + getOrderBy(this)+ " ASC";
    }
}
