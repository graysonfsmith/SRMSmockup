package rms.model;

public class VisitorsModel {
	private int visId;
	private String visName;
	private String visEmail;
	private String visPhone;
	private int badgeId;
	private String 	visPurpose;
	private String visCompany;
	
	
	@Override
	public String toString() {
		return "VisitorsModel  [visId=" + visId + ",visName=" + visName + ", visEmail=" + visEmail + ",visPhone="
				+visPhone+ ", badgeId=" + badgeId + ",  visPurpose=" +  visPurpose
				+ ", visCompany=" + visCompany + "]";
	}
	
	
	
	
	
	
	public int getvisId() {
		return visId;
	}
	public void setvisId(int visId) {
		this.visId = visId;
	}
	public String getVisName() {
		return visName;
	}
	public void setVisName(String visName) {
		this.visName = visName;
	}
	public String getVisEmail() {
		return visEmail;
	}
	public void setVisEmail(String visEmail) {
		this.visEmail = visEmail;
	}
	public String getVisPhone() {
		return visPhone;
	}
	public void setVisPhone(String visPhone) {
		this.visPhone = visPhone;
	}
	public int getBadgeId() {
		return badgeId;
	}
	public void setBadgeId(int badgeId) {
		this.badgeId = badgeId;
	}
	public String getVisPurpose() {
		return visPurpose;
	}
	public void setVisPurpose(String visPurpose) {
		this.visPurpose = visPurpose;
	}
	public String getVisCompany() {
		return visCompany;
	}
	public void setVisCompany(String visCompany) {
		this.visCompany = visCompany;
	}
	
	
	
	
	
 

}
