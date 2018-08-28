/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.region;

import beans.MessageEnum;
import controllers.services.RegionService;
import entities.EntitiesEnum;
import entities.Regions;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class RegionBean {

    private final RegionService service;
    private final MessageEnum messageEnum;

    public RegionBean() {
        this.service = new RegionService(HibernateUtil.getSessionFactory(), Regions.class, EntitiesEnum.REGION) ;
        this.messageEnum = MessageEnum.REGION;
    }

    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String regionId, String regionName) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(regionId, regionName));
    }

    public ModelAndView findById(String redirect, String id) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.findById(id));
    }

    public ModelAndView binding(String redirect) {
        ModelAndView mav = new ModelAndView(redirect);
        return mav.addObject("data", service.binding());
    }

    public ModelAndView find(String redirect, String category, String data) {
        List<Regions> regions = service.find(getCategory(category), data);
        String message = messageEnum.getMessage(regions.isEmpty());
        return getModelAndView(redirect, message, regions);
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
            case 0: return EntitiesEnum.REGIONID.getProperty();
            case 1: return EntitiesEnum.REGIONNAME.getProperty();
        }
        return null;
    }
}
