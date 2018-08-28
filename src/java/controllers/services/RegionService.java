/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.services;

import controllers.Controller;
import entities.EntitiesEnum;
import entities.Regions;
import java.math.BigDecimal;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class RegionService extends Controller<Regions>{
    private final Controller<Regions> controller;

    public RegionService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.controller = new Controller(sf, type, table);
    }
    
    public boolean saveOrEdit(String regionId, String regionName){
        Regions region = new Regions(new BigDecimal(regionId), regionName);
        return controller.saveOrEdit(region);
    }
    
    public boolean drop(String regionId){
        return controller.drop(new BigDecimal(regionId));
    }
    
    public Regions findById(String regionId){
        return controller.findById(new BigDecimal(regionId));
    }
}
