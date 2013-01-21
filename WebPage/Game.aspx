<%@ Page Title="Game" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Game.aspx.cs" Inherits="Game" %>

<script runat="server">
   
    protected void btn_play_Click(object sender, EventArgs e)
    {
        Dice dice = new Dice();
        dice.Roll();

        lbl_roller1.Text = dice.getRoll1().ToString();
        lbl_roller2.Text = dice.getRoll2().ToString();
        bool d = dice.Doubles();        
        
        // If both numbers were the same
        if (d == true)
        {
            lbl_result.Text = dice.Message();
            lbl_result.Visible = true;
            // Getting the image name into a string
            string s = dice.ImageD();

            if (s != "yaoi")
            {
                img_reward.ImageUrl = "~/Img/"+s+".jpg";                
                
                // Enabling gallery view of the unlocked image
                switch (s)
                {                                           
                    case "yuri1":
                        btn_yuri1.Enabled = true;
                        Session["yuri1"] = true;
                        break;
                    case "yuri2":
                        btn_yuri2.Enabled = true;
                        Session["yuri2"] = true;
                        break;
                    case "yuri3":
                        btn_yuri3.Enabled = true;
                        Session["yuri3"] = true;
                        break;
                    case "yuri4":
                        btn_yuri4.Enabled = true;
                        Session["yuri4"] = true;
                        break;
                    case "yuri5":
                        btn_yuri5.Enabled = true;
                        Session["yuri5"] = true;
                        break; 
                    default:
                        break;                           
                }

            }
            else 
            {
                img_reward.ImageUrl = "~/Img/"+s+".jpg";

            }

        }
        else
        {
            lbl_result.Visible = false;
            img_reward.ImageUrl = "~/Img/owl.jpg";
        }        
    }
    
</script>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <center>
    
    <h2>
        Welcome to the yuri roller. Try to get two of the same number for a special reward. Do watch out for rolling 66, though. 
    </h2>
       
    
     
     <div style="height: 49px">
        <asp:Label ID="lbl_roller1" runat="server" Text="0" BorderColor="Black" 
        BorderStyle="Solid" Height="40px" Width="17px" Font-Size="XX-Large"  ></asp:Label>
    
        <asp:Label ID="lbl_roller2" runat="server" Text="0" BorderColor="Black" 
        BorderStyle="Solid" Height="40px" Width="17px" Font-Size="XX-Large" 
        style="margin-left: 11px" ></asp:Label>

        <asp:Button ID="btn_play_" runat="server" Height="26px" style="margin-top: 0px; margin-left: 127px;" 
            Text="Yurify!" onclick="btn_play_Click" />    
    
    </div>  
   
   <div style="height: 507px; width: 491px; float:left">
      
     <asp:Image ID="img_reward" runat="server" Height="401px" BorderWidth="2"  
        Width="480px" ImageUrl="~/Img/owl.jpg" style="margin-top: 14px" />        
        
        

    </div>

    </center> 

    
    <asp:Label ID="lbl_result" runat="server" Text="..." Font-Size="X-Large" Font-Bold="true" Visible="False" style="margin-top: 28px"></asp:Label>
  <div style="float:left; height: 500px; width: 424px;"> 

   
   <!-- Buttons for viewing unlocked images, not enabled before unlocking       -->
<asp:Button ID="btn_yuri1" runat="server" Text="Gallery 1" Height="27px" 
          style="margin-top: 21px; margin-left: 152px;" onclick="btn_yuri1_Click" 
          Width="92px" Enabled="false" />

          <asp:Button ID="btn_yuri2" runat="server" Text="Gallery 2" Height="28px" 
          style="margin-top: 59px; margin-left: 252px;" onclick="btn_yuri2_Click" 
          Width="92px" Enabled="false" />

          <asp:Button ID="btn_yuri3" runat="server" Text="Gallery 3" Height="28px" 
          style="margin-top: 48px; margin-left: 152px;" onclick="btn_yuri3_Click" 
          Width="92px" Enabled="false" />

          <asp:Button ID="btn_yuri4" runat="server" Text="Gallery 4" Height="28px" 
          style="margin-top: 59px; margin-left: 252px;" onclick="btn_yuri4_Click" 
          Width="92px" Enabled="false" />

          <asp:Button ID="btn_yuri5" runat="server" Text="Gallery 5" Height="28px" 
          style="margin-top: 48px; margin-left: 152px;" onclick="btn_yuri5_Click" 
          Width="92px" Enabled="false" />


        
    </div> 
    
  
  
   
    


    
    
    
  

   
    


</asp:Content>
