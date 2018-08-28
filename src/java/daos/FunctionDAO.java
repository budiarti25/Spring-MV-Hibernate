/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StringType;

/**
 *
 * @author Ignatius
 */
public class FunctionDAO implements FunctionDAOInterface {

    private final SessionFactory factory;
    private Session session;
    private Transaction transaction;

    public FunctionDAO(SessionFactory sf) {
        this.factory = sf;
    }

    @Override
    public boolean insertOrUpdate(Object object) {
        boolean flag = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(object);
            transaction.commit();
            flag = true;
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return flag;
    }

    @Override
    public boolean delete(Class type, Serializable serializable) {
        boolean flag = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            Object object = session.get(type, serializable);
            session.delete(object);
            transaction.commit();
            flag = true;
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return flag;
    }

    @Override
    public List<Object> getData(String query) {
        List<Object> datas = new ArrayList<>();
        try {
            this.session = this.factory.openSession();
            this.transaction = this.session.beginTransaction();
            datas = this.session.createQuery(query).list();
            this.transaction.commit();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            if (this.transaction != null) {
                this.transaction.rollback();
            }
        } finally {
            this.session.close();
        }
        return datas;
    }

    @Override
    public Object getById(Class type, Serializable serializable) {
        Object object = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            object = session.get(type, serializable);
            transaction.commit();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return object;
    }

}
