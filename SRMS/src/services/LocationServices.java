package services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LocationDAO;
import model.LocationModel;


@Controller
public class LocationServices {
	
	@RequestMapping(value="/addloc",method=RequestMethod.GET)	
	public ModelAndView locations(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		String user = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", user);
		List<LocationModel> list = new LocationDAO().getAllLocations();
		model.addAttribute("allLoc", list);
		return new ModelAndView("locations","command", new LocationModel());
	}
	
	@RequestMapping (value="saveLocation",method=RequestMethod.POST)
	public ModelAndView saveLocation(@ModelAttribute("location")LocationModel location) {
		int ret = new LocationDAO().insertLocation(location);
		//mango.display();
		return new ModelAndView("redirect:/addloc");
	}
	@RequestMapping (value="deleteLocation/{locid}",method=RequestMethod.GET)
	public ModelAndView deleteLocation(@PathVariable int locid) {
		int ret = LocationDAO.deleteLocation(locid);
		return new ModelAndView("redirect:/addloc");
	}
	@RequestMapping(value="editLocation",method=RequestMethod.POST)
	public ModelAndView editLocation(@ModelAttribute("location")LocationModel location) {
		int ret = LocationDAO.editLocation(location);
		return new ModelAndView("redirect:/addloc");
	} 

}
