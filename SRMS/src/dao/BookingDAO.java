package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import model.BookingModel;
import mapper.BookingMapper;
import mapper.ResourceMapper;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class BookingDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;
    
    public BookingDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jt");
    }
    
    // Return BookingModel with specified bookingID
    public BookingModel getBooking(int bId) {
    	return (BookingModel)temp.queryForObject("Select * from Booking where bookingId = ?", new BookingMapper(), bId);
    }
    
    // Inserts specified Booking into Booking table
    public int insertBooking(BookingModel book,String start,String end) {
    	return temp.update("insert into Booking values(?,?,?,to_timestamp(?,'MM-DD-YYYY HH:MI'),to_timestamp(?,'MM-DD-YYYY HH:MI'),?,1)",
    			book.getID(), book.getLocResID(), book.getUserID(), start, end, book.getDescription());
    }
	
    // Updates isActive column entry to 0 to the specified Booking from Booking table
    public int deleteBooking(BookingModel book) {
    	return temp.update("update Booking set isActive = 0 where bookingId = ?", book.getID());
    }
	
    // Updates specified Booking from Booking table
    public int updateBooking(BookingModel book) {
    	return temp.update("update Booking set locResId = ?, userId = ?, startTime = ?, "
    			+ "endTime = ?, description = ? where bookingId = ?",
    			book.getLocResID(), book.getUserID(), book.getStartTime(), 
    			book.getEndTime(), book.getDescription(), book.getID());
    }

    // Returns a list of BookingModels from Booking table
    public List<BookingModel> getAllBookings() {
    	return temp.query("select * from Booking", new BookingMapper());
    }
    
    // Given date range, return list of bookings overlapping with that range
    public List<BookingModel> getBookingsWithDateRange(String sTime, String eTime) {
    	//String i = "select count(*) from bookings where starttime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy')";
    	//String i = "select * from Booking where (starttime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy')) or (endtime between to_date('"+sTime+"','dd-mm-yyyy') and to_date('"+eTime+"','dd-mm-yyyy'))";
    	//BookingModel bm = (BookingModel)temp.queryForObject("select * from booking where bookingid = ?", new BookingMapper(),69);
    	
    	
    	return temp.query("select * from booking where (starttime between ? and ?) or (endtime between ? and ?)" 
    			,new BookingMapper(),
    			sTime,eTime,sTime,eTime);
    }
    
    public List<BookingModel> getBookingsForCurrentDate() {
    	return temp.query("select * from Booking where (sysdate between startTime and endTime) or (sysdate < startTime)", new BookingMapper());
    }
    
    public List<ChartData> getNumberBookingPerDay()
    {
        List<ChartData> data = new ArrayList<>();
        List<Map<String, Object>> rows = temp.queryForList("SELECT Trunc(starttime) as dt,COUNT(*) as cnt FROM BOOKING GROUP BY STARTTIME");
        for (Map row: rows) {
            ChartData temp = new ChartData();
            temp.setNumDays(((BigDecimal)row.get("cnt")).intValue());
            temp.setDateTime(((Timestamp)row.get("dt")).toLocalDateTime().toLocalDate().toString());
            data.add(temp);
        }
        return data;
    }
}
