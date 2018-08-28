/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.services;

import controllers.Controller;
import entities.EntitiesEnum;
import entities.Jobs;
import org.hibernate.SessionFactory;

/**
 *
 * @author Ignatius
 */
public class JobService extends Controller<Jobs> {
    private final SessionFactory factory;
    private final Controller<Jobs> controller;
    
    public JobService(SessionFactory sf, Class type, EntitiesEnum table) {
        super(sf, type, table);
        this.factory = sf;
        this.controller = new Controller(sf, type, table);
    }
    
    public boolean saveOrEdit(String jobId, String jobTitle, String minSal, String maxSal){
        Jobs job = new Jobs(jobId, jobTitle, new Integer(minSal), new Integer(maxSal));
        return controller.saveOrEdit(job);
    }
}
