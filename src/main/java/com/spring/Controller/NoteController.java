package com.spring.Controller;
import java.sql.Date;

import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import com.spring.DomainClass.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.spring.Service.*;
import antlr.collections.List;

@SuppressWarnings("serial")
@Controller
@SessionAttributes({ "user" })
public class NoteController {
    @Autowired
	private NoteService noteService;

	@Autowired
	private NoteBookService noteBookService;
	Note noteObjDate=new Note();
	@RequestMapping("/notes")
	public String notes() {
		return "notes";
	}

	@RequestMapping("/showNote")
	public String showNote() {
		return "showNote";
	}

	@RequestMapping("/editNote")
	public String editNote() {
		return "editNote";
	}

	ArrayList<Note> list1 = new ArrayList<Note>();
	long millis = System.currentTimeMillis();
	java.sql.Date date = new java.sql.Date(millis);
	

	@RequestMapping("/createNote")
	public String createNote(@RequestParam("noteName") String noteName,
			@RequestParam("noteDescription") String noteDescription, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("remainderDate") String remainderDate,
			@RequestParam("statusName") String statusName, @RequestParam("tagName") String tagName,
			HttpServletRequest request) throws ParseException {
		Status status = new Status(statusName);
		Tag tag = new Tag(tagName);
		NoteBook noteBook = new NoteBook();
		HttpSession session = request.getSession();
		noteBook = (NoteBook) session.getAttribute("noteBook");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date start_Date = sdf.parse(startDate);
		java.sql.Date start_date = new java.sql.Date(start_Date.getTime());

		java.util.Date end_Date = sdf.parse(endDate);
		java.sql.Date end_date = new java.sql.Date(end_Date.getTime());

		java.util.Date remainder_Date = sdf.parse(remainderDate);
		java.sql.Date remainder_date = new java.sql.Date(remainder_Date.getTime());

		Note note = new Note(noteName, noteDescription, start_date, end_date, remainder_date, status, tag, noteBook);
		noteService.createNote(note);
		return ("redirect:listOfNotes.do?itemId="+noteBook.getId());
	}

	@RequestMapping(value = "/editNote", method = RequestMethod.GET)
	public ModelAndView editNote(@RequestParam("itemId") Integer id) {
		Note note = new Note();
		note = noteService.getNoteObject(id);
		return new ModelAndView("editNote", "note", note);
	}

	@RequestMapping("/updateNote")
	public ModelAndView updateNote(@RequestParam("noteId") Integer id,@RequestParam("noteBookId") Integer noteBookId, @RequestParam("noteName") String noteName,
			@RequestParam("noteDescription") String noteDescription, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("remainderDate") String remainderDate,
			@RequestParam("statusName") String statusName, @RequestParam("tagName") String tagName,
			HttpServletRequest request) throws ParseException {
		
		NoteBook noteBook = new NoteBook();
		noteBook = noteBookService.getNoteBookObject(noteBookId);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date start_Date = sdf.parse(startDate);
		java.sql.Date start_date = new java.sql.Date(start_Date.getTime());

		java.util.Date end_Date = sdf.parse(endDate);
		java.sql.Date end_date = new java.sql.Date(end_Date.getTime());

		java.util.Date remainder_Date = sdf.parse(remainderDate);
		java.sql.Date remainder_date = new java.sql.Date(remainder_Date.getTime());

		Note noteObj = new Note();
		noteObj = noteService.getNoteObject(id);

		Status status = new Status(noteObj.getStatus().getId(), statusName);
		Tag tag = new Tag(noteObj.getTag().getId(), tagName);
		Note note = new Note(id, noteName, noteDescription, start_date, end_date, remainder_date, status, tag,
				noteBook);
		noteService.updateNote(note);
		
		HttpSession session = request.getSession();
		noteBook = (NoteBook) session.getAttribute("noteBook");
		if(noteBook==null)
			return new ModelAndView("redirect:listAllNotes.do");
		else
			return new ModelAndView("redirect:listOfNotes.do?itemId="+noteBook.getId());
	}

	@RequestMapping(value = "/deleteNote", method = RequestMethod.GET)
	public ModelAndView deleteNote(@RequestParam("itemId") Integer id) {
		Note note = new Note();
		note = noteService.getNoteObject(id);
		noteService.deleteNote(note);
		return new ModelAndView("redirect:listAllNotes.do");
	}

	@RequestMapping(value = "/showNoteDetails/{id}", method = RequestMethod.GET)
	public ModelAndView showNoteDetails(@PathVariable("id") int id, HttpServletRequest request,Model  model) {
		Note note = new Note();
		note = noteService.getNoteObject(id);
		
		model.addAttribute("noteDetail",note);
		return new ModelAndView("showNote", "note", note);
	}
	
	@RequestMapping(value = "/listOfNotification")
	public ModelAndView listOfNotification(HttpServletRequest request,@ModelAttribute User user) {
		ArrayList<Note> list= new ArrayList<Note>();
		ArrayList<Note> listOfNotification= new ArrayList<Note>();
		Note noteObj=new Note();
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		NoteBook noteBook = new NoteBook();
		HttpSession session = request.getSession();
		noteBook = (NoteBook) session.getAttribute("noteBook");
		if(noteBook==null)
		{
			list = noteService.listAllNotes(user);
			for(Note note:list) {
				noteObj=noteService.getRemainderOfAllNotes(note,date);
				if(noteObj!=null)
				listOfNotification.add(noteObj);
			}
		}
		
		else {
			listOfNotification = noteService.getEqualDate(noteBook, date);
		}
		return new ModelAndView("notification", "remainder", listOfNotification);

	}
	@RequestMapping(value = "/listAllNotes", method = RequestMethod.GET)
	public ModelAndView listAllNotes(@ModelAttribute User user,Model model,HttpServletRequest request) {
		ArrayList<Note> list = new ArrayList<Note>();
		String ui="hidden";
		model.addAttribute("ui",ui);
		list = noteService.listAllNotes(user);
		Note noteObj=new Note();
		ArrayList<Note> l1=new ArrayList<Note>();
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		Integer countRemainder= 0;
		for(Note note:list)
		{
			noteObj=noteService.getRemainderOfAllNotes(note,date);
			if(noteObj!=null)
				 countRemainder++;
			noteObjDate=noteService.getDates(note,date);
			if(noteObjDate!=null) {
				    l1.add(noteObjDate);
			}
	    }
		model.addAttribute("noteObjDate",l1);
		model.addAttribute("countRemainder",countRemainder);
		HttpSession session = request.getSession();
		session.removeAttribute("noteBook");
		return new ModelAndView("notes", "note", list);
	}

	@RequestMapping(value = "/listOfNotes", method = RequestMethod.GET)
	public ModelAndView listOfNotes(@RequestParam("itemId")Integer id, HttpServletRequest request, ModelMap modelMap,Model model) {
		NoteBook noteBook = new NoteBook();
		noteBook = noteBookService.getObject(id);
		String ui="visible";
		model.addAttribute("ui",ui);
		HttpSession session = request.getSession();
		session.setAttribute("noteBook", noteBook);
		ArrayList<Note> list = new ArrayList<Note>();
		list = (ArrayList<Note>) noteService.listOfNotes(id);
		list1.clear();
		for(Note note:list) {
			noteObjDate=noteService.getDates(note,date);
			if(noteObjDate!=null) {
				list1.add(noteObjDate);
			}
		}
		model.addAttribute("noteObjDate",list1);
		Integer countRemainder= noteService.getRemainderCount(noteBook, date);
		model.addAttribute("countRemainder",countRemainder);
		return new ModelAndView("notes", "note", list);
	}
}
