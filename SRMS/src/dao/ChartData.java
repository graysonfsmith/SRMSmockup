package dao;

public class ChartData{
    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public Integer getNumDays() {
        return numDays;
    }

    public void setNumDays(Integer numDays) {
        this.numDays = numDays;
    }

    private String dateTime;
    private Integer numDays;



}