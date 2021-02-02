package com.learn.egames.dao;

import com.learn.egames.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.QueryException;
import org.hibernate.query.Query;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // get User by Email and Password
    public User getUserByEmailAndPassword(String email, String password)
        {
            User user = null;

            try {
         
                String query = "from User where Email =: e and Password =: p";
                Session session = this.factory.openSession();
                Query q = session.createQuery(query);
                q.setParameter("e", email);
                q.setParameter("p", password);

                user = (User) q.uniqueResult();

                session.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
            return user;
        }
}