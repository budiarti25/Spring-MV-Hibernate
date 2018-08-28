/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAO;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.CastTo;
import entities.EntitiesEnum;
import daos.QueryEnum;
import java.io.Serializable;

/**
 *
 * @author Ignatius
 * @param <E>
 */
public class Controller<E> implements InterfaceController<E>{
    private final DAO gdao;
    private final CastTo<E> ct;
    private final Class type;
    
    public Controller(SessionFactory sf, Class type, EntitiesEnum table) {
        this.gdao = new DAO(sf, table);
        this.ct = new CastTo<>();
        this.type = type;
    }
    
    @Override
    public boolean saveOrEdit(E e) {
        return gdao.insertOrUpdate(e);
    }

    @Override
    public boolean drop(Serializable serializable) {
        return gdao.delete(type, serializable);
    }

    @Override
    public List<E> binding() {
        return ct.getAllE(gdao.getData());
    }

    @Override
    public List<E> find(String category, String data) {
        return ct.getAllE(gdao.search(category, data));
    }

    @Override
    public E findById(Serializable serializable) {
        return ct.getE(gdao.getById(type, serializable));
    }    
}
