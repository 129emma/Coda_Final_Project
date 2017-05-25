package code_project.Info;

/**
 * Represents an article, which has a title and a body of text.
 *
 */
public class UserInfo {

	private String username,firstName,lastName,email,data_birth,tags,friends;


	public UserInfo(String username, String firstName, String lastName, String email, String data_birth, String tags, String friends) {
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.data_birth = data_birth;
		this.tags = tags;
		this.friends = friends;
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

	public void setData_birth(String data_birth) {
		this.data_birth = data_birth;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public void setFriends(String friends) {
		this.friends = friends;
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

	public String getData_birth() {
		return data_birth;
	}

	public String getTags() {
		return tags;
	}

	public String getFriends() {
		return friends;
	}
}