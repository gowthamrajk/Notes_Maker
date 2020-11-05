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
public class NoteBookService {
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
	public void createNoteBook(NoteBook notebook) {
		sessionFactory.getCurrentSession().save(notebook);
	}

	@Transactional
	public void updateNoteBook(Integer id, String notebookName) {
		NoteBook noteBook = (NoteBook) sessionFactory.getCurrentSession().get(NoteBook.class, id);
		noteBook.setNoteBookName(notebookName);
		sessionFactory.getCurrentSession().update(noteBook);
	}

	@Transactional
	public List<NoteBook> listOfNoteBook(User user) {
		criteria = sessionFactory.getCurrentSession().createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("user", user));
		List<NoteBook> list = criteria.list();
		return list;
	}

	@Transactional
	public NoteBook getObject(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("id", id));
		return (NoteBook) criteria.uniqueResult();
	}

	@Transactional
	public NoteBook getNoteBookObject(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(NoteBook.class);
		criteria.add(Restrictions.eq("id", id));
		return (NoteBook) criteria.uniqueResult();
	}

	@Transactional
	public void deleteNoteBook(NoteBook noteBook) {
		sessionFactory.getCurrentSession().delete(noteBook);
	}

}