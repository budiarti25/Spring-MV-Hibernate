/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Ignatius
 * @param <E>
 */
public interface InterfaceController<E> {
    public boolean saveOrEdit(E e);
    public boolean drop(Serializable serializable);
    public List<E> binding();
    public List<E> find(String category, String data);
    public E findById(Serializable serializable);
}
