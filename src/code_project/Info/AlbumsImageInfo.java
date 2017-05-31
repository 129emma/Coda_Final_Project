package code_project.Info;

/**
 * Created by txie936 on 31/05/2017.
 */
public class AlbumsImageInfo {
    private int id;
    private String username;
    private String address;
    private String postTime;

    public AlbumsImageInfo(int id, String username, String address, String postTime) {
        this.id = id;
        this.username = username;
        this.address = address;
        this.postTime = postTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }





}
