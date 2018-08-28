/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.country;

import beans.MessageEnum;
import controllers.services.CountryService;
import controllers.services.RegionService;
import entities.EntitiesEnum;
import entities.Countries;
import entities.Regions;
import java.util.List;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class CountryBean {

    private final CountryService service;
    private final RegionService servicer;
    private final MessageEnum messageEnum;

    public CountryBean() {
        this.service = new CountryService(HibernateUtil.getSessionFactory(), Countries.class, EntitiesEnum.COUNTRY) ;
        this.servicer = new RegionService(HibernateUtil.getSessionFactory(), Regions.class, EntitiesEnum.REGION) ;
        this.messageEnum = MessageEnum.COUNTRY;
    }


    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String countryId, String countryName, String regionId) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(countryId, countryName, regionId));
    }

    public ModelAndView findById(String redirect, String id) {
        ModelAndView mav = new ModelAndView(redirect);
        List regions = new RegionService(HibernateUtil.getSessionFactory(), Regions.class, EntitiesEnum.REGION).binding();
        mav.addObject("regions", regions);
        mav.addObject("data", service.findById(id));
        return mav;
    }

    public ModelAndView binding(String redirect) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.binding());
    }

    public ModelAndView find(String redirect, String category, String data) {
        ModelAndView mav = new ModelAndView(redirect);
        List<Countries> countries = service.find(getCategory(category), data);
//        List<Regions> regions = servicer.find(getCategory(category), data);
//        mav.addObject("countries", countries);
//        mav.addObject("regions", regions);
        String message = messageEnum.getMessage(countries.isEmpty());
        return getModelAndView(redirect, message, countries);
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
            case 0: return EntitiesEnum.COUNTRYID.getProperty();
            case 1: return EntitiesEnum.COUNTRYNAME.getProperty();
            case 2: return EntitiesEnum.REGIONS.getProperty();
        }
        return null;
    }
}
