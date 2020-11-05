package com.spring.Service;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spring.DomainClass.*;
import javassist.bytecode.Descriptor.Iterator;

@Service
public class UserService {
    Criteria criteria = null;
	Criteria criteria1 = null;
	@Autowired
	SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Autowired
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Transactional
	public void createUser(User userObj) {

		sessionFactory.getCurrentSession().save(userObj);
	}

	@Transactional
	public User loginSuccess(String email, String password) {
		criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		criteria.add(Restrictions.eq("password", password));
		return (User) criteria.uniqueResult();
	}

	@Transactional
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
	}
	@Transactional
	public  User  getUserObj(String email) {
		criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("email", email));
		return (User) criteria.uniqueResult();
	}
}