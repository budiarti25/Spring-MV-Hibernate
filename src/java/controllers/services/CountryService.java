/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.services;

import controllers.Controller;
import entities.Countries;
import entities.EntitiesEnum;
import entities.Regions;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class CountryService extends Controller<Countries>{
    private final SessionFactory factory;
    private final Controller<Countries> controller;

    public CountryService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.factory = sf;
        this.controller = new Controller(sf, type, table);
    }
    
    public boolean saveOrEdit(String countryId, String countryName, String regionId){
        Regions region = new RegionService(factory, Regions.class, EntitiesEnum.REGION).findById(regionId);
        Countries countries = new Countries(countryId, countryName, region);
        return controller.saveOrEdit(countries);
    }
}
