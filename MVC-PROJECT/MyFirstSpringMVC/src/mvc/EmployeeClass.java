package mvc;


	public class EmployeeClass {
		int eid;
		String ecity;
		String ename;
		int esalary;
		
		public void display() {
			System.out.println(eid + ename + ecity + esalary);
		}
		
		
		public int getEid() {
			return eid;
		}
		public void setEid(int eid) {
			this.eid = eid;
		}
		public String getEcity() {
			return ecity;
		}
		public void setEcity(String ecity) {
			this.ecity = ecity;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public int getEsalary() {
			return esalary;
		}
		public void setEsalary(int esalary) {
			this.esalary = esalary;
		}
}
