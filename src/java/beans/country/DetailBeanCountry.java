/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.country;

import entities.EntitiesEnum;
import entities.Countries;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import controllers.services.CountryService;
import tools.HibernateUtil;

/**
 *
 * @author Ignatius
 */
public class DetailBeanCountry implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        return new CountryBean().findById("country/detailCountry", hsr.getParameter("countryId"));
    }
}
