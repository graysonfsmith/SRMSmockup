package srms;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class ZohaibsServices {
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String showReservations() {
		return "showreservations";
	}

}
