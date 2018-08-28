/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.services;

import controllers.Controller;
import entities.Countries;
import entities.EntitiesEnum;
import entities.Locations;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class LocationService extends Controller<Locations>{
    private final SessionFactory factory;
    private final Controller<Locations> controller;
    
    public LocationService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.factory = sf;
        this.controller = new Controller(sf, type, table);
    }
    
    public boolean saveOrEdit(String locationId, String streetAddress, String postalCode, String city, String stateProvince, String countryId){
        Countries country = new Controller<Countries>(factory, Countries.class, EntitiesEnum.COUNTRY).findById(countryId);
        Locations location = new Locations(new Short(locationId), streetAddress, postalCode, city, stateProvince, country);
        return controller.saveOrEdit(location);
    }
    
    public boolean delete(String locationId){
        return controller.drop(new Short(locationId));
    }
    
    public Locations findById(String locationId){
        return controller.findById(new Short(locationId));
    }
}
