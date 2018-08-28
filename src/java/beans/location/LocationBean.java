/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.location;

import beans.MessageEnum;
import controllers.services.CountryService;
import controllers.services.LocationService;
import entities.Countries;
import entities.EntitiesEnum;
import entities.Locations;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class LocationBean {

    private final LocationService service;
    private final MessageEnum messageEnum;

    public LocationBean() {
        this.service = new LocationService(HibernateUtil.getSessionFactory(), Locations.class, EntitiesEnum.LOCATION) ;
        this.messageEnum = MessageEnum.LOCATION;
    }

    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String locationId, String streetAddress, String postalCode, 
            String city, String stateProvince, String country) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(locationId, streetAddress, postalCode, city, stateProvince, country));
    }

    public ModelAndView findById(String redirect, String id) {
        ModelAndView mav = new ModelAndView(redirect);
        List countries = new CountryService(HibernateUtil.getSessionFactory(), Countries.class, EntitiesEnum.COUNTRY).binding();
        mav.addObject("countries", countries);
        mav.addObject("data", service.findById(id));
        return mav;
    }

    public ModelAndView binding(String redirect) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.binding());
    }

    public ModelAndView find(String redirect, String category, String data) {
        List<Locations> locations = service.find(getCategory(category), data);
        String message = messageEnum.getMessage(locations.isEmpty());
        return getModelAndView(redirect, message, locations);
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
            case 0: return EntitiesEnum.LOCATIONID.getProperty();
            case 1: return EntitiesEnum.LOCATIONSTREETADDRESS.getProperty();
            case 2: return EntitiesEnum.LOCATIONPOSTALCODE.getProperty();
            case 3: return EntitiesEnum.LOCATIONCITY.getProperty();
            case 4: return EntitiesEnum.LOCATIONSTATEPROVICE.getProperty();
            case 5: return EntitiesEnum.LOCATION.COUNTRYNAME.getProperty();
        }
        return null;
    }
}
