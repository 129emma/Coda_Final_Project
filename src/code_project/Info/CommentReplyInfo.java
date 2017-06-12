package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentReplyInfo {
    public int commentReplyID, commentID;
    public String content, postTime, username, editBtn, replyBtn,editComment, deleteBtn, deleteComment, replyComment;

    public void setReplyComment(String username) {
        replyBtn = "<a  class='reply replyBtn' href=\"Comment?action=reply&commentReplyID=" + commentReplyID + "&commentID=" + commentID + "\"><i class='reply icon'></i></a>";
       /* replyComment = "<a href=\"Comment?action=reply&commentID=" + commentID + "&commentReplyID=" + commentReplyID + "\">Reply</a>";
        replyBtn = "<a class='reply replyBtn'><i class='reply icon'></i></a>";*/
    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
           /* editBtn = "<a class='editBtn reply'><i class='write icon'></i></a>";*/
            editBtn = "<a class='editBtn reply' href=\"Comment?action=update&commentReplyID=" + commentReplyID + "&commentID=" + commentID + "\"><i class='write icon'></i></a>";
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
            deleteBtn = "<a href=\"Comment?action=delete&commentReplyID=" + commentReplyID + "&commentID=" + commentID + "\"><i class='trash icon'></i></a>";
        }
    }

    public String getReplyComment() {
        return replyComment;
    }

    public String getEditComment() {
        return editComment;
    }

    public String getDeleteComment() {
        return deleteComment;
    }

    public CommentReplyInfo(int commentReplyID, String content, String postTime, String username, int commentID) {
        this.commentReplyID = commentReplyID;
        this.content = content;
        this.postTime = postTime;
        this.username = username;
        this.commentID = commentID;
        editComment = "";
        deleteComment = "";
        replyComment ="";
    }

    public int getCommentReplyID() {
        return commentReplyID;
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

    public int getcommentID() {
        return commentID;
    }
}
