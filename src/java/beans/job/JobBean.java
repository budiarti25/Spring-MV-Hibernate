/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.job;

import beans.MessageEnum;
import controllers.services.JobService;
import entities.EntitiesEnum;
import entities.Jobs;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.web.servlet.ModelAndView;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class JobBean {

    private final JobService service;
    private final MessageEnum messageEnum;

    public JobBean() {
        this.service = new JobService(HibernateUtil.getSessionFactory(), Jobs.class, EntitiesEnum.JOB) ;
        this.messageEnum = MessageEnum.JOB;
    }

    private ModelAndView saveOrEditOrDrop(String redirect, boolean isDrop, boolean action) {
        String message = messageEnum.getMessage(messageEnum, isDrop, action);
        return getModelAndView(redirect, message, service.binding());
    }

    public ModelAndView drop(String redirect, String id) {
        return saveOrEditOrDrop(redirect, true, service.drop(id));
    }

    public ModelAndView saveOrEdit(String redirect, String jobId, String jobTitle, String minSal, String maxSal) {
        return saveOrEditOrDrop(redirect, false, service.saveOrEdit(jobId, jobTitle, minSal, maxSal));
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
        List<Jobs> jobs = service.find(getCategory(category), data);
        String message = messageEnum.getMessage(jobs.isEmpty());
        return getModelAndView(redirect, message, jobs);
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
            case 0: return EntitiesEnum.JOBID.getProperty();
            case 1: return EntitiesEnum.JOBTITLE.getProperty();
            case 2: return EntitiesEnum.JOBMINSAL.getProperty();
            case 3: return EntitiesEnum.JOBMAXSAL.getProperty();
        }
        return null;
    }
}
