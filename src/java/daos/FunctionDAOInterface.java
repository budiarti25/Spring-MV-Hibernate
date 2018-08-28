/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Ignatius
 */
public interface FunctionDAOInterface {
    public boolean insertOrUpdate(Object object);
    public boolean delete(Class type, Serializable serializable);
    public List<Object> getData(String query);
    public Object getById(Class type, Serializable serializable);
}
