<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
    <h2>
        Ongoing projects:
        
    </h2>
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False"
NavigateUrl="~/LoliQuest.aspx">LoliQuest</asp:HyperLink>
    </div>
    
</asp:Content>
