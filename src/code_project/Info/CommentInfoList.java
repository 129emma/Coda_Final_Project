package code_project.Info;

import java.util.List;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfoList {
    public List<CommentInfo> commentInfoList;

    public CommentInfoList(List<CommentInfo> commentInfoList) {
        this.commentInfoList = commentInfoList;
    }

    public void setCommentInfoList(List<CommentInfo> commentInfoList) {
        this.commentInfoList = commentInfoList;
    }

    public List<CommentInfo> getCommentInfoList() {

        return commentInfoList;
    }
}
