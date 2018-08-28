/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 *
 * @author Ignatius
 */
public interface DAOInterface {
    public List<Object> getData();
    public List<Object> search(String category, String data);
}
