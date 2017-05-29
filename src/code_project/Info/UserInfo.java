package code_project.Info;

/**
 * Represents an article, which has a title and a body of text.
 *
 */
public class UserInfo {

	private String username,firstName,lastName,email,birthDate,gender,icon;


	public UserInfo(String username, String firstName, String lastName, String email, String date_birth, String gender, String icon) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.birthDate = date_birth;
		this.gender = gender;
		this.icon = icon;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setBirthDate(String date_birth) {
		this.birthDate = date_birth;
	}

	public void setGender(String tags) {
		this.gender = tags;
	}

	public void setIcon(String friends) {
		this.icon = friends;
	}

	public String getUsername() {
		return username;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public String getGender() {
		return gender;
	}

	public String getIcon() {
		return icon;
	}
}