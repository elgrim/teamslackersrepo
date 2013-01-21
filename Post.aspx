<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>



<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
        <HeaderTemplate>
            <table border="1" width="800px" cellpadding="5px">
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td align="right">
                    By: <%# Eval("CommentUserName") %> @ <%# Eval("CommentDateTime") %>
                </td>
            </tr>
            <tr>
                <td>
                    <%# Eval("CommentMessage") %>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
            <tr>
                <td>
                    <a href="NewComment.aspx?id=<%= Request.QueryString["id"] %>">Comment</a>
                </td>
            </tr>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:e6287_1ConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:e6287_1ConnectionString.ProviderName %>"
        SelectCommand="SELECT * FROM Comments WHERE (PostId = @PostId) ORDER BY CommentDateTime DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="PostId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

