/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Ignatius
 */
public class SaveBeanJob implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        return new JobBean().saveOrEdit("job/viewJob", hsr.getParameter("jobId"), hsr.getParameter("jobTitle"),
                 hsr.getParameter("minSalary"), hsr.getParameter("maxSalary"));
    }    
}
