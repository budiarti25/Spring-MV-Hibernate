/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.location;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Ignatius
 */
public class SaveBeanLocation implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        return new LocationBean().saveOrEdit("location/viewLocation", hsr.getParameter("locationId"), hsr.getParameter("streetAddress"),
                 hsr.getParameter("postalCode"), hsr.getParameter("city"), hsr.getParameter("stateProvince"), hsr.getParameter("cmbCountry"));
    }    
}
