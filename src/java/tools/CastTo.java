/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ignatius
 * @param <E>
 */
public class CastTo<E> {

    private E e;
    private List<E> allE;

    public E getE() {
        return e;
    }

    public void setE(E e) {
        this.e = e;
    }

    public List<E> getAllE() {
        return allE;
    }

    public void setAllE(List<E> allE) {
        this.allE = allE;
    }

    public E getE(Object data){
        return (E) data;
    }
    
    public List<E> getAllE(List<Object> datas) {
        List<E> allEs = new ArrayList<>();
        datas.stream().map((data) -> (E) data).forEachOrdered((es) -> {
            allEs.add(es);
        });
        return allEs;
    }
}
