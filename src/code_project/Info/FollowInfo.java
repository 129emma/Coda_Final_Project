package code_project.Info;

import java.util.List;

/**
 * Created by 熊猫 on 2017/6/11.
 */
public class FollowInfo {
    private List<String> follows;
    private List<String> followers;

    public FollowInfo(List<String> follows,List<String> followers){
        this.follows=follows;
        this.followers=followers;
    }

    public List<String> getFollows() {
        return follows;
    }

    public void setFollows(List<String> follows) {
        this.follows = follows;
    }

    public List<String> getFollowers() {
        return followers;
    }

    public void setFollowers(List<String> followers) {
        this.followers = followers;
    }
    
    
    
}
