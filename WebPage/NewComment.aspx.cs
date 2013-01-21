using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class NewComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //setup data to insert into the comment table
        string commentUserName = Page.User.Identity.Name;
        string commentMessage = ((TextBox)HeadLoginStatus.FindControl("txtMessage")).Text;
        DateTime commentDateTime = DateTime.Now;
        int postId = int.Parse(Request.QueryString["id"]);

        //Add appropriate data to the post table
        //setup our connection to the db
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["e6287_1ConnectionString"].ConnectionString);
        //create our sql command object
        SqlCommand cmd = new SqlCommand("Insert INTO Comments(PostId, CommentUserName, CommentMessage, CommentDateTime) VALUES (@PostId, @CommentUserName, @CommentMessage, @CommentDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", postId);
        cmd.Parameters.AddWithValue("@CommentUserName", commentUserName);
        cmd.Parameters.AddWithValue("@CommentMessage", commentMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", commentDateTime);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("Post.aspx?id=" + postId.ToString());
    }
}