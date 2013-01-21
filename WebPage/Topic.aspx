<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Topic.aspx.cs" Inherits="Topic" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
        <HeaderTemplate>
            <table border="1" width="800px" cellpadding="5px">
            <tr>
                <td colspan="2">
                    <a href="NewPost.aspx?id=<%= Request.QueryString["id"] %>">New Post</a>
                </td>
            </tr>
        </HeaderTemplate>

        <ItemTemplate>

            <tr>
                <td>
                    <a href="Post.aspx?id=<%# Eval("PostId") %>"><%# Eval("PostTitle") %></a>
                </td>
                <td>
                    By: <%# Eval("PostUserName") %> @ <%# Eval("PostDateTime").ToString() %>
                </td>
            </tr>
                
        </ItemTemplate>

        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:e6287_1ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:e6287_1ConnectionString.ProviderName %>"  
        SelectCommand="SELECT * FROM Posts WHERE (TopicId = @TopicId) ORDER BY PostDateTime DESC;">
        <SelectParameters>
            <asp:QueryStringParameter Name="TopicId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

