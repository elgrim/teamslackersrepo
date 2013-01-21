<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Login
    </h2>
    <p>
        Username <br />
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
    </p>
    
    <div>
    
    <p>
    Password <br />
    <asp:TextBox ID="txt_pwd" runat="server"></asp:TextBox>
    </p>
    
        
        <asp:Button ID="btn_login" runat="server" Text="Log in" 
            onclick="btn_login_Click" Width="55px" />
    
    
    <%if (Session["Login"] != null)
      { %>
        <asp:Button ID="btn_logout" runat="server" Text="Log out" 
            onclick="btn_logout_Click" />
    <%} %>
    
    
        <asp:Label ID="lbl_success" runat="server"  Text="..." ></asp:Label>
    
    
    
    </div>
</asp:Content>

