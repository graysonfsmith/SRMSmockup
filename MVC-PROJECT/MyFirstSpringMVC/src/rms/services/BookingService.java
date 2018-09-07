package rms.services;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookingService {

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index()
	{
		return "LandingPage";
	}
	@RequestMapping(value="/Reservation",method=RequestMethod.GET)
	public String reservation(ModelMap modelList)
	{
		// Grab locations
		// Grab Rooms
		return "Booking/ReservationView";
	}
	@RequestMapping(value="/Utilization",method=RequestMethod.GET)
	public String utilization(ModelMap modelList)
	{
		// Grab locations
		// Grab Rooms
		return "Booking/ReservationView";
	}
	/* Add the Restful Services as well */
}
