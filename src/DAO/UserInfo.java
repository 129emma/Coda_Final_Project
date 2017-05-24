package DAO;

/**
 * Represents an article, which has a title and a body of text.
 *
 */
public class UserInfo {

	private String firstName,lastName,username,email;

	public UserInfo(String firstName, String lastName, String username, String email) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLink() {
		String link = "";
		if(firstName.isEmpty()||lastName.isEmpty()||username.isEmpty()||email.isEmpty()){
			link = "<td><a href=\"/Entry?firstName="+firstName+"&lastName="+lastName+"&username="+username+"&email="+email+"&update=true\">Click to update</a></td>";
		}
		return link;
	}
}