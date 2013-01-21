<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to the hydeout of Team Slackers.
        <asp:Label ID="lbl_test" runat="server" Text=".."></asp:Label>
    </h2>
   
   <div>
   <asp:ListView ID="ListNews" runat="server" DataSourceID="XmlDataSource1">
   <LayoutTemplate>
   <div id="ItemPlaceHolderContainer" runat ="server">
        <span id="ItemPlaceHolder" runat ="server"/>
   </div>
   </LayoutTemplate>
   <ItemTemplate>
   <br/>
  
   <br/>
   <h2><%#XPath("title") %></h2>
   <p>
   <%#XPath("contents")%>
   </p>
   <br/>
   <%#XPath("date")%>
   <br/>
   ------------------------------------------------------------------------------
   <br/>
   </ItemTemplate>
   
   
   
   </asp:ListView>
   
       <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML/News.xml">
       </asp:XmlDataSource>
   
   </div>
   
   <%if (Session["Login"] != null)
     { %>

   <div>
   <h3 style="font-family: 'Bodoni MT Black'; color: #000000;">Lisää uutisen otsikko</h3>
   <asp:TextBox runat="server" ID="txtTitle" BorderColor="Black" 
           ></asp:TextBox>
   <br/>
   <h3 style="font-family: 'Bodoni MT Black'; color: #000000;">Lisää uutisen sisältö</h3>
   <asp:TextBox runat="server" ID="txtContents" TextMode="Multiline" 
           BorderColor="Black" Height="166px" Width="411px"></asp:TextBox>
   <br/>


   <asp:Button runat="server" Text="Tallenna Tiedosto" ID="btnLisaa" 
           onclick="btnLisaa_Click" />
<% } %>

   </div>
   
  
   
        

     




</asp:Content>
