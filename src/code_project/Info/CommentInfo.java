package code_project.Info;

import java.util.List;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public int commentID, articleID,commentReplyID;
    public String content, postTime, username, editBtn,replyBtn, editComment, deleteBtn, deleteComment, replyComment;


    public void setReplyComment(String username) {
        replyComment = "<a href=\"Comment?action=reply&commentID=" + commentID + "&commentID=" + commentID + "\">Reply</a>";
        replyBtn = "<a class='reply replyBtn'><i class='reply icon'></i></a>";



    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
            editBtn = "<a class='reply editBtn'><i class='write icon'></i></a>";
            editComment = "<a href=\"Comment?action=update&articleID=" + articleID + "&commentID=" + commentID + "\"></a>";
        }
    }

    public String getEditBtn() {
        return editBtn;
    }

    public String getDeleteBtn() {
        return deleteBtn;
    }

    public String getReplyBtn(){return replyBtn;}


    public void setDeleteComment(String username) {
        if (this.username.equals(username)) {
            deleteBtn = "<a href=\"Comment?action=delete&articleID=" + articleID + "&commentID=" + commentID + "\"><i class='trash icon'></i></a>";
        }
    }

    public String getEditComment() {
        return editComment;
    }

    public String getDeleteComment() {
        return deleteComment;
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

    public int getCommentID() {
        return commentID;
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

    public int getArticleID() {
        return articleID;
    }


    private List<CommentReplyInfo> commentReplyInfoList;

    public void setCommentReplyInfoList(List<CommentReplyInfo> commentReplyInfoList) {
        this.commentReplyInfoList = commentReplyInfoList;
    }

    public List<CommentReplyInfo> getCommentReplyInfoList() {

        return commentReplyInfoList;
    }

}
