package code_project.Info;

import java.util.List;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public int commentID, articleID;
    public String content, postTime, username, editBtn,replyBtn, editComment, deleteBtn, deleteComment, replyComment;


    private List<CommentReplyInfo> commentReplyInfoList;

    public void setCommentReplyInfoList(List<CommentReplyInfo> commentReplyInfoList) {
        this.commentReplyInfoList = commentReplyInfoList;
    }

    public List<CommentReplyInfo> getCommentReplyInfoList() {

        return commentReplyInfoList;
    }

    public void setReplyComment(String username) {
        replyBtn = "<a class='reply replyBtn' name='"+commentID+"'><i class='reply icon'></i></a>";
        replyComment = "<a class='reply replyBtn' href=\"Comment?action=reply&commentID=" + commentID + "\">";
    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
            editBtn = "<a class='reply editBtn' name='"+commentID+"'><i class='write icon'></i></a>";
        }
    }

    public void setDeleteComment() {
        deleteBtn = "<a href=\"Comment?action=delete&articleID=" + articleID + "&commentID=" + commentID + "\"><i class='trash icon'></i></a>";
    }

    public CommentInfo(int commentID, String content, String postTime, String username, int articleID) {
        this.commentID = commentID;
        this.content = content;
        this.postTime = postTime;
        this.username = username;
        this.articleID = articleID;
        editComment = "";
        deleteComment = "";
        replyComment ="";
    }


    public String getEditBtn() {
        return editBtn;
    }

    public String getDeleteBtn() {
        return deleteBtn;
    }

    public String getReplyBtn(){return replyBtn;}

    public int getCommentID() {
        return commentID;
    }

    public int getArticleID() {
        return articleID;
    }

    public String getEditComment() {
        return editComment;
    }

    public String getDeleteComment() {
        return deleteComment;
    }

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
