<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



            <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="False"
NavigateUrl="~/NewPost.aspx">New Post</asp:HyperLink>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
        <HeaderTemplate>
            <table border="1" width="800px" cellpadding="5px">
            <tr>
                <td>
                    Topic:
                </td>
                <td>
                    Last Post:
                </td>
                <td>
                    By:
                </td>
                <td>
                    Time:
                </td>
            </tr>
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td>
                    <a href="Topic.aspx?id=<%# Eval("TopicId") %>"><%# Eval("TopicName") %></a>
                </td>
                <td>
                    <%# Eval("LastPostTitle") %>
                </td>
                <td>
                    <%# Eval("LastPostUserName") %>
                </td>
                <td>
                    <%# Eval("LastPostDateTime") %>
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
    SelectCommand="SELECT * FROM Topics"></asp:SqlDataSource>
</asp:Content>