package userConfig;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Users {
	private String username;
	@Id
	private String mobile;
	private String password;

	public Users(String name, String mobile, String password) {
		super();
		this.username = name;
		this.mobile = mobile;
		this.password = password;
	}
	public Users() {
		super();
	}
	public String getName() {
		return username;
	}
	public void setName(String name) {
		this.username = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Users [username=" + username + ", mobile=" + mobile + ", password=" + password + "]";
	}


}
