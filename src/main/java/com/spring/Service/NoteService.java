package com.spring.Service;

import java.sql.Date;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.spring.DomainClass.*;

public class NoteService {
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
	public void createNote(Note noteObj) {
		Status status = noteObj.getStatus();
		Tag tag = noteObj.getTag();
		sessionFactory.getCurrentSession().save(status);
		sessionFactory.getCurrentSession().save(tag);
		sessionFactory.getCurrentSession().save(noteObj);
	}

	@Transactional
	public ArrayList<Note> listOfNotes(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("noteBook.id", id));
		List<Note> list = criteria.list();
		return (ArrayList<Note>) list;
	}

	@Transactional
	public ArrayList<Note> getEqualDate(NoteBook noteBook, Date date) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("remainderDate", date));
		criteria.add(Restrictions.eq("noteBook", noteBook));
		List<Note> list = criteria.list();
		return (ArrayList<Note>) list;
	}
	
	@Transactional
	public Integer getRemainderCount(NoteBook noteBook, Date date) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("remainderDate", date));
		criteria.add(Restrictions.eq("noteBook", noteBook));
		criteria.setProjection(Projections.rowCount());
		return (Integer)criteria.uniqueResult();
	}
	@Transactional
	public Note getRemainderOfAllNotes(Note note , Date date) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("id", note.getId()));
		criteria.add(Restrictions.eq("remainderDate",date));
		return (Note)criteria.uniqueResult();
	}
	@Transactional
	public Note getDates(Note note , Date date) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("id", note.getId()));
		criteria.add(Restrictions.ge("endDate",date));
		return (Note)criteria.uniqueResult();
	}

	@Transactional
	public ArrayList<Note> listAllNotes(User user) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class,"note");
		criteria.createAlias("noteBook","noteBook");
		criteria.add(Restrictions.eq("noteBook.user", user));
		List<Note> list = criteria.list();
		return (ArrayList<Note>) list;
	}
	@Transactional
	public Note getNoteObject(Integer id) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add(Restrictions.eq("id", id));
		return (Note) criteria.uniqueResult();
	}
	@Transactional
	public Integer getNumberOfNotes(NoteBook noteBook) {
		criteria = sessionFactory.getCurrentSession().createCriteria(Note.class);
		criteria.add( Restrictions.eq("noteBook",noteBook));
		criteria.setProjection(Projections.rowCount());
		return (Integer)criteria.uniqueResult();
	}

	@Transactional
	public void updateNote(Note noteObj) {
		Status status = noteObj.getStatus();
		Tag tag = noteObj.getTag();
		sessionFactory.getCurrentSession().save(status);
		sessionFactory.getCurrentSession().save(tag);
		sessionFactory.getCurrentSession().update(noteObj);
	}

	@Transactional
	public void deleteNote(Note note) {
		sessionFactory.getCurrentSession().delete(note);
	}

}
