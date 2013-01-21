using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Game : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Check_Gallery();
        
    }

    // Checks session data for opened gallery pictures
    protected void Check_Gallery()
    {
        
            if (Session["yuri1"] != null)
            { btn_yuri1.Enabled = true; }

            if (Session["yuri2"] != null)
            { btn_yuri2.Enabled = true; }

            if (Session["yuri3"] != null)
            { btn_yuri3.Enabled = true; }

            if (Session["yuri4"] != null)
            { btn_yuri4.Enabled = true; }

            if (Session["yuri5"] != null)
            { btn_yuri5.Enabled = true; }
        

    }
       
    
    protected void btn_yuri1_Click(object sender, EventArgs e)
    {
        img_reward.ImageUrl = "~/Img/yuri1.jpg";
    }
    protected void btn_yuri2_Click(object sender, EventArgs e)
    {
        img_reward.ImageUrl = "~/Img/yuri2.jpg";
    }
    protected void btn_yuri3_Click(object sender, EventArgs e)
    {
        img_reward.ImageUrl = "~/Img/yuri3.jpg";
    }
    protected void btn_yuri4_Click(object sender, EventArgs e)
    {
        img_reward.ImageUrl = "~/Img/yuri4.jpg";
    }
    protected void btn_yuri5_Click(object sender, EventArgs e)
    {
        img_reward.ImageUrl = "~/Img/yuri5.jpg";
    }
}