package mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MyServices {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcomePage() {
		return "welcome";
	}
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String sayHello(ModelMap map){
		String message1 = "Hello, welcome 1";
		String message2 = "Hello, welcome 2";

		
		map.addAttribute(message1);
		map.addAttribute(message2);
		
		return "mango";
	}
	@RequestMapping(value = "/viewEmployee", method = RequestMethod.GET)
	public ModelAndView showAllEmployees(ModelMap map){
		
		List<EmployeeClass> list = new ShowAllEmployeeLogic().selectAllEmployee();
		
		map.addAttribute("emplist", list);
		return new ModelAndView("allemployees","command", new EmployeeClass());
	}
	
	@RequestMapping(value = "/newEmployee")
	public ModelAndView newEmployees(){	
		return new ModelAndView("empForm", "command", new EmployeeClass());
	}
	
	@RequestMapping(value = "/saveEmployee", method = RequestMethod.POST)
	public ModelAndView saveEmployee(@ModelAttribute("emp")EmployeeClass emp){
		
		int ret = new ShowAllEmployeeLogic().insertEmployee(emp);
		if(ret > 0) {
			return new ModelAndView("redirect:/viewEmployee");
		}
		else
			return new ModelAndView("error");
	}
	
	@RequestMapping(value = "/editSave", method = RequestMethod.POST)
	public ModelAndView editSave(@ModelAttribute("emp")EmployeeClass emp){
		int ret = new ShowAllEmployeeLogic().editEmployee(emp);
		if(ret > 0) {
			return new ModelAndView("redirect:/viewEmployee");
		}
		else
			return new ModelAndView("error");
	}
	
	@RequestMapping(value = "deleteEmployee/{eid}")
	public ModelAndView DeleteEmployee(@PathVariable int eid){
		
		int ret = new ShowAllEmployeeLogic().deleteEmployee(eid);
		if(ret > 0) {
			return new ModelAndView("redirect:/viewEmployee");
		}
		else
			return new ModelAndView("error");
	}
	
	
	/*@RequestMapping(value = "editEmployee/{eid}")
	public ModelAndView EditEmployee(@PathVariable int eid){
		
		EmployeeClass emp1 = new ShowAllEmployeeLogic().getEmployee(eid);
		
		return new ModelAndView("editForm", "command", emp1);
		
		
	}*/
	
	
}
