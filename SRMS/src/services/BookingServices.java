package services;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.parsing.Location;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import oracle.net.aso.b;
import dao.*;
import mapper.BookingMapper;
import model.*;
import sun.util.calendar.Gregorian;


@Controller
@SessionAttributes("user")
public class BookingServices {
	
	public String getStartDate() {
		Calendar date = GregorianCalendar.getInstance();
		DateFormat df = new SimpleDateFormat("dd-MMM-yy");
		while(date.get(Calendar.DAY_OF_WEEK) != (Calendar.MONDAY)) {
			date.add(Calendar.DATE, -1);
		}
		return df.format(date.getTime());
	}
	
	public String getEndDate() {
		Calendar date = GregorianCalendar.getInstance();
		DateFormat df = new SimpleDateFormat("dd-MMM-yy");
		while(date.get(Calendar.DAY_OF_WEEK) != (Calendar.FRIDAY)) {
			date.add(Calendar.DATE, 1);
		}
		return df.format(date.getTime());
	}
	private ResourceModel find(List<ResourceModel> l,List<LocationResourceModel> lr, int id)
	{
		for(LocationResourceModel model:lr)
		{
			if(id==model.getID())
			{
				for(ResourceModel res:l)
				{
					if(model.getResourceID()==res.getResId())
						return res;
				}
			}
		}
		return new ResourceModel();
	}
	public List<CalendarEventServices> getBookings(List<BookingModel> newBookings) {
		List<CalendarEventServices> ces = new ArrayList<>();
		ResourceDAO dao = new ResourceDAO();
		List<ResourceModel> res = dao.getAllResources();
		List<LocationResourceModel> locModel = dao.getLoccationResources();
		for(BookingModel out:newBookings) {
			ResourceModel res1 = find(res, locModel, out.getLocResID());
			String roomName = "nil";
			String color = "nil";
			switch(res1.getResType()) {
				case "1":
					roomName = "Scrum";
					color = "red";
					break;
				case "2":
					roomName = "Board";
					color = "blue";
					break;
				case "3":
					roomName = "Class";
					color = "pink";
					break;
				case "4":
					roomName = "Rec";
					color = "green";
					break;
				case "5":
					roomName = "Break";
					color = "grey";
					break;
				case "6":
					roomName = "Lounge";
					color = "yellow";
					break;
				case "7": 
					roomName = "Conference";
					color = "orange";
					break;
				default:
					roomName = "Meeting";
					color = "rgb(255, 80, 80)";
			}
			CalendarEventServices c = new CalendarEventServices(roomName, out.getStartTime(), out.getEndTime(), color);
			ces.add(c);
		}
		
		return ces;
	}
	
	@RequestMapping(value="/reserve",method=RequestMethod.GET)
	public ModelAndView showReservations(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		String user = (String)request.getSession().getAttribute("name");
		model.addAttribute("myUser", user);
		String locName;
		User userobj = (User) model.get("user");
		userobj = new User();
		System.out.println(userobj.getLocid());
		if(userobj.getLocid() == 0)
		{
			userobj.setUserid(6);
			LocationModel location = new UserDAO().getUserLocation(userobj.getUserid());
			userobj.setLocid(location.getLocid());
			List<LocationModel> allLoc = new LocationDAO().getAllLocations();
			model.addAttribute("loc", location.getLocname());
			model.addAttribute("loccity", location.getLoccity());
			model.addAttribute("locstate", location.getLocstate());
			model.addAttribute("location", location);
			model.addAttribute("alllocations", allLoc);
			model.addAttribute("user", userobj);
			//Given locationID get all the locresids in that table.
			List<LocationResourceModel> locationresourceidlist = new LocationDAO().getResId(location.getLocid());
			//System.out.println("loc res size: " + locationresourceidlist.size());
			
			//only pull out the booksings corrsponding to those locresids
			//System.out.println("value of loc: " + model.get("loc"));
			//String startTime = getStartDate(); //.concat(" 07.00.00.000000000 AM")
			//String endTime = getEndDate(); //.concat(" 08.00.00.000000000 PM")
			//System.out.println(startTime + " - " + endTime);
			//List<BookingModel> bkg = new BookingDAO().getBookingsWithDateRange(startTime, endTime);
			List<BookingModel> bkg = new BookingDAO().getAllBookings();
			List<BookingModel> newBookings = new ArrayList<>();
			List<ResourceTypeModel> rtm = new ResourceTypeDAO().getResourceTypesWithLocId(location.getLocid());
//			for(ResourceTypeModel i: rtm) {
//				System.out.println(i.getName());
//			}
			model.addAttribute("Rtypes",rtm);
			
			
			for(LocationResourceModel lrm: locationresourceidlist) {
				for(BookingModel b:bkg) {
					if(lrm.getID() == b.getLocResID() && lrm.getIsActive() == 1) {
						newBookings.add(b);
					}
				}
			}
//			List<ResourceModel> resources = new ArrayList<>();
//			for(BookingModel out:newBookings) {
//				resources.add(new ResourceDAO().getResourceWithBooking(out));
//				//System.out.println(out.getLocResID() + " - " + out.getStartTime() + " - " + out.getEndTime());
//			}
//			for(ResourceModel r:resources) {
//					System.out.println(r.getResType() + " -- " + r.getResName());
//			}
			List<CalendarEventServices> ces = new ArrayList<>();
			ces = getBookings(newBookings);
			model.addAttribute("bookings", ces);
			List<ResourceModel> listRes = new ResourceDAO().getResourcesWithLocIDandResTypeID(location.getLocid(), 1);
			model.addAttribute("resources",listRes);
		}
		return new ModelAndView("showreservations","command", new BookingMapper());
	}
	
	@RequestMapping(value="getUserLocation/{userid}",method=RequestMethod.GET)
	public String getUserLocation(Model model, @PathVariable int userid) {
		System.out.println(userid);
		//String locName = new UserDAO().getUserLocation(61);
		//model.addAttribute("loc", locName);
		return "showreservations";
	}
	
	@RequestMapping(value="/saveReservation", method=RequestMethod.POST)
	public String getAllBookings(HttpServletRequest req, HttpServletResponse res,ModelMap models) {
		System.out.println("Here");
		System.out.println(req.getParameter("description"));
		System.out.println(req.getParameter("startTimeStamp"));
		System.out.println(req.getParameter("endTimeStamp"));
		System.out.println(req.getParameter("resourceid"));
		System.out.println(req.getParameter("useridForService"));
		System.out.println(req.getParameter("location"));
		int resid = Integer.parseInt(req.getParameter("resourceid"));
		int loc = Integer.parseInt(req.getParameter("location"));
		BookingModel bm = new BookingModel();
		LocationResourceModel lrm = new LocationDAO().getLocationResource(resid, loc);
		System.out.println(lrm.getID());
		bm.setDescription(req.getParameter("description"));
		//bm.setEndTime(req.getParameter("endTimeStamp"));
		//bm.setStartTime(req.getParameter("startTimeStamp"));
		bm.setIsActive(1);
		bm.setLocResID(lrm.getID());
		bm.setUserID(Integer.parseInt(req.getParameter("useridForService")));
		new BookingDAO().insertBooking(bm,req.getParameter("startTimeStamp") ,req.getParameter("endTimeStamp") );
		//bm = ((List<BookingModel>)models.get("bookings")).get(0);
		System.out.println(bm.getID());
		return "redirect:/";
	}
	
	@RequestMapping(value="/changeLocation", method=RequestMethod.GET)
	public ModelAndView changeToNewLocaton() {
		System.out.println("YO WE MADE IT!!!");
		return new ModelAndView("redirect:/reserve");
	}	
	
}





