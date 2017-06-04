package code_project.Info;

/**
 * Created by txie936 on 3/06/2017.
 */
public class AlbumsAudioInfo {
    private int id;
    private String fileName;
    private String username;
    private String address;
    private String postTime;


    public AlbumsAudioInfo(int id,String fileName, String username, String address, String postTime) {
        this.fileName=fileName;
        this.username = username;
        this.address = address;
        this.postTime = postTime;
        this.id=id;
    }
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
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
