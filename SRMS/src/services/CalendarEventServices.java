package services;

import java.sql.Timestamp;

public class CalendarEventServices {
	
	private String roomName;
	private Timestamp startTime;
	private Timestamp endTime;
	private String color;
	
	public CalendarEventServices(String roomName, Timestamp startTime, Timestamp endTime, String color) {
		this.roomName = roomName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.color = color;
	}
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

}
