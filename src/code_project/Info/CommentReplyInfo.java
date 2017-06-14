package code_project.Info;

import java.util.List;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentReplyInfo {
    public int commentReplyID,articleID, commentID;
    public String content, postTime, deleteCommentBtn, username,editComment, deleteCommentReply, replyComment;


    private List<CommentReplyInfo> commentReplyInfoList;

    public void setCommentReplyInfoList(List<CommentReplyInfo> commentReplyInfoList) {
        this.commentReplyInfoList = commentReplyInfoList;
    }

    public List<CommentReplyInfo> getCommentReplyInfoList() {

        return commentReplyInfoList;
    }



    public CommentReplyInfo(int commentReplyID, String content, String postTime, String username, int commentID, int articleID) {
        this.commentReplyID = commentReplyID;
        this.content = content;
        this.postTime = postTime;
        this.username = username;
        this.commentID = commentID;
        this.articleID = articleID;
        editComment = "";
        deleteCommentReply = "";
        replyComment ="";
    }

    public void setDeleteCommentReply(int commentReplyID,String username) {
        if (this.username.equals(username)) {
            deleteCommentBtn = "<a href=\"Comment?action=deleteCommentReply&articleID=" + articleID + "&commentReplyID=" + commentReplyID + "\"><i class='trash icon'></i></a>";
        }
    }

    public String getDeleteCommentBtn(){
        return deleteCommentBtn;
    }

    public int getCommentID() {
        return commentID;
    }

    public int getCommentReplyID(){return commentReplyID;}

    public int getArticleID(){return articleID;}

    public String getContent() {
        return content;
    }

    public String getPostTime() {
        return postTime;
    }

    public String getUsername() {
        return username;
    }


}
