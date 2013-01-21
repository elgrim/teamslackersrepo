using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class _Default : System.Web.UI.Page
{
  



    protected void btnLisaa_Click(object sender, EventArgs e)
    {
        //create new instance of XmlDocument
        XmlDocument theNews = new XmlDocument();
        
        //load from file
        theNews.Load(Server.MapPath("~/XML/News.xml"));
        
        //create nodes
        XmlElement theNewsTag = theNews.CreateElement("news");
        XmlElement theTitleTag = theNews.CreateElement("title");      
        XmlElement theContentsTag = theNews.CreateElement("contents");
        XmlElement theDateTag = theNews.CreateElement("date");

        //create what data nodes have
        XmlText theTitleText = theNews.CreateTextNode(txtTitle.Text);
        XmlText theContentsText = theNews.CreateTextNode(txtContents.Text);
        XmlText theDateText = theNews.CreateTextNode(System.DateTime.Now.ToString("r"));

        //append them

        theTitleTag.AppendChild(theTitleText);
        theContentsTag.AppendChild(theContentsText);
        theDateTag.AppendChild(theDateText);


        theNewsTag.AppendChild(theTitleTag);
        theNewsTag.AppendChild(theContentsTag);
        theNewsTag.AppendChild(theDateTag);

        

        //put all under the News tag
        theNews.DocumentElement.PrependChild(theNewsTag);

        
        
     
        // save the file
        theNews.Save(Server.MapPath("~/XML/News.xml"));
        


    }




    
}
