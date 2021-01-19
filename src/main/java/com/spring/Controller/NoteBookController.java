package com.spring.Controller;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.spring.DomainClass.User;
import com.spring.DomainClass.Note;
import com.spring.DomainClass.NoteBook;
import com.spring.Service.*;
@SuppressWarnings("serial")
@Controller
@SessionAttributes({ "user" })
public class NoteBookController {

    @Autowired
	private NoteBookService noteBookService;
	@Autowired
	private NoteService noteService;

	@RequestMapping("/editNoteBook")
	public String editNoteBook() {
		return "editNoteBook";
	}
	
	@RequestMapping("/noteBookList")
	public ModelAndView noteBookList(@ModelAttribute User user) {
		List<NoteBook> list = new ArrayList<NoteBook>();
		List<Note> list1 = new ArrayList<Note>();
		Map<NoteBook,Integer> contactMap = new HashMap<NoteBook, Integer>();
		Integer  count=0;
		list = noteBookService.listOfNoteBook(user);
		for(NoteBook temp:list) {
		     count=noteService.getNumberOfNotes(temp);
		     contactMap.put(temp,count);
		}
		return new ModelAndView("noteBooks", "noteBooks", contactMap);
	}

	@RequestMapping("/createNoteBook")
	public ModelAndView createNoteBook(@RequestParam("noteBookName") String noteBookName, @ModelAttribute User user) {
		NoteBook notebook = new NoteBook(noteBookName, user);
		noteBookService.createNoteBook(notebook);
		return new ModelAndView("redirect:noteBookList.do", "user", user);
	}

	@RequestMapping(value = "/editNoteBook", method = RequestMethod.GET)
	public ModelAndView editNoteBook(@RequestParam("itemId") Integer id) {
		NoteBook noteBook = new NoteBook();
		noteBook = noteBookService.getObject(id);
		return new ModelAndView("editNoteBook", "noteBook", noteBook);
	}

	@RequestMapping("/updateNoteBook")
	public ModelAndView updateNoteBook(@RequestParam("noteBookId") Integer id,
			@RequestParam("noteBookName") String noteBookName, @ModelAttribute User user) {
		noteBookService.updateNoteBook(id, noteBookName);
		return new ModelAndView("redirect:noteBookList.do", "user", user);
	}


	@RequestMapping(value = "/deleteNoteBook", method = RequestMethod.GET)
	public ModelAndView deleteNoteBook(@RequestParam("itemId") Integer id, HttpServletRequest request,
			@ModelAttribute User user) {
		NoteBook noteBook = new NoteBook();
		noteBook = noteBookService.getObject(id);
		ArrayList<Note> list = new ArrayList<Note>();
		list = noteService.listOfNotes(id);
		list = (ArrayList<Note>) noteService.listOfNotes(id);
		if (list.size() == 0) {
			noteBookService.deleteNoteBook(noteBook);
		}
			
		return new ModelAndView("redirect:noteBookList.do", "user", user);
	}
}
