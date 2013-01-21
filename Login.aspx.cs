using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("~/XML/User.xml"));

        XmlNode root = doc.DocumentElement;        
     
        XmlNodeList nodes_name = doc.SelectNodes("/users/user/name");
        XmlNodeList nodes_pwd = doc.SelectNodes("/users/user/pwd");
     

        // Kaksoiserittelyn takia mikä tahansa username/password kombinaatio toimii -> korjaukseen
        ReadXmlNodesNames(nodes_name);
        ReadXmlNodesPwd(nodes_pwd);


        if (Session["Username"] != null && Session["Pwd"] != null)
        {
            lbl_success.Text = "Successfully logged in.";
            Session["Login"] = true;
        }
        else
        {
            lbl_success.Text = "Failed to login.";
        }

    /*    if (name == txt_name.Text && pwd == txt_pwd.Text)
        {
            lbl_success.Text = "Successful login.";
        }
        else
        {
            lbl_success.Text = name;
           // lbl_success.Text = "Login failed.";
        }
     */ 
      
    }



    public void ReadXmlNodesNames(System.Xml.XmlNodeList nodeList)
    {
         foreach (System.Xml.XmlNode n in nodeList)
        {
            if (n.ChildNodes.Count == 0)
            {    
                // Setting the username right/wrong into session
                if (txt_name.Text == n.Value)
                {
                    Session["Username"] = true;                                       
                }
                else
                {
                    //Session["Username"] = null;      
                }

            }
            else
            {                
                ReadXmlNodesNames(n.ChildNodes);
            }
        }
    }

    public void ReadXmlNodesPwd(System.Xml.XmlNodeList nodeList)
    {
        foreach (System.Xml.XmlNode n in nodeList)
        {
            if (n.ChildNodes.Count == 0)
            {
                // Setting the pwd right/wrong into session
                if (txt_pwd.Text == n.Value)
                {
                    Session["Pwd"] = true;   
                }
                else
                {
                    //Session["Pwd"] = null;                    
                }

            }
            else
            {
                ReadXmlNodesPwd(n.ChildNodes);
            }
        }
    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session["Login"] = null;
        Session["Pwd"] = null;
        Session["Username"] = null; 
    }
}