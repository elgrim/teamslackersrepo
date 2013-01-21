using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class NewPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataReader rdr = null;
        //setup our data to insert into the post table
        string postUserName = Page.User.Identity.Name;
        string postTitle = ((TextBox)HeadLoginStatus.FindControl("txtTitle")).Text;
        string postMessage = ((TextBox)HeadLoginStatus.FindControl("txtMessage")).Text;
        DateTime postDateTime = DateTime.Now;
        int topicId = int.Parse(Request.QueryString["id"]);

        //Add appropriate data to the post table
        //setup our connection to the db
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["e6287_1ConnectionString"].ConnectionString);
        //create our sql command object
        SqlCommand cmd = new SqlCommand("Insert INTO Posts(TopicId, PostTitle, PostUserName, PostDateTime) VALUES (@TopicId, @PostTitle, @PostUserName, @PostDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", topicId);
        cmd.Parameters.AddWithValue("@PostTitle", postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", postUserName);
        cmd.Parameters.AddWithValue("@PostDateTime", postDateTime);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
        }


        //setup data to insert into the comment table
        int postId = 0; //set this later when we get it back from the db
        conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["e6287_1ConnectionString"].ConnectionString);
        cmd = new SqlCommand("Select * FROM Posts WHERE TopicId=@TopicId AND PostTitle=@PostTitle AND PostUserName=@PostUserName AND PostDateTime=@PostDateTime", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@TopicId", topicId);
        cmd.Parameters.AddWithValue("@PostTitle", postTitle);
        cmd.Parameters.AddWithValue("@PostUserName", postUserName);
        cmd.Parameters.AddWithValue("@PostDateTime", postDateTime.ToString());

        using (conn)
        {
            conn.Open();
            rdr = cmd.ExecuteReader();

            if (rdr.Read())
            {
                postId = int.Parse(rdr["PostId"].ToString());
            }
        }


        //Add appropriate data to the comments table
        conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["e6287_1ConnectionString"].ConnectionString);
        cmd = new SqlCommand("Insert INTO Comments(PostId, CommentUserName, CommentMessage, CommentDateTime) VALUES (@PostId, @CommentUserName, @CommentMessage, @CommentDateTime)", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PostId", postId);
        cmd.Parameters.AddWithValue("@CommentUserName", postUserName);
        cmd.Parameters.AddWithValue("@CommentMessage", postMessage);
        cmd.Parameters.AddWithValue("@CommentDateTime", postDateTime);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
        }


        //Add appropriate data to the topics table
        conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["e6287_1ConnectionString"].ConnectionString);
        cmd = new SqlCommand("Update Topics Set LastPostTitle=@LastPostTitle, LastPostUserName=@LastPostUserName, LastPostDateTime=@LastPostDateTime WHERE TopicId=@TopicId", conn);

        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@LastPostTitle", postTitle);
        cmd.Parameters.AddWithValue("@LastPostUserName", postUserName);
        cmd.Parameters.AddWithValue("@LastPostDateTime", postDateTime);
        cmd.Parameters.AddWithValue("@TopicId", topicId);

        using (conn)
        {
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("Topic.aspx?id=" + topicId.ToString());
    }

}