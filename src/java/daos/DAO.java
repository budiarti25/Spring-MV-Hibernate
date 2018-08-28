/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;
import org.hibernate.SessionFactory;
import entities.EntitiesEnum;

/**
 *
 * @author Ignatius
 */
public class DAO extends FunctionDAO implements DAOInterface{
    private final FunctionDAO fdao;
    private final EntitiesEnum table;
    private final QueryEnum query;

    public DAO(SessionFactory sf, EntitiesEnum table) {
        //Enumeration adalah kumpulan nama-nama konstant yang didefinisikan sebagai tipe data baru. Sebuah objek bertipe Enumeration dapat mengakses isi dari kumpulan nilai pada enumeration. Kalau saya menyebutnya sebagai array yg konstan nilainya karena enumeration ini seperti array namun perbedaanya adalah isi dari kumpulan enumeration bersifat tetap dan enumeration dalam pemrograman java disebut sebagai tipe dari kelas.
        //method dr class parent tidak perlu ditulis ulang
        super(sf); //untuk mengakses parent class
        this.table = table;
        this.query = this.table.getQueryEnum(table);
        this.fdao = new FunctionDAO(sf);
    }

    @Override
    public List<Object> getData(){
        return fdao.getData(query.getQuery(table));
    }
    
    @Override
    public List<Object> search(String category, String data){
        return fdao.getData(query.getQuery(table, category, data));
    }
}