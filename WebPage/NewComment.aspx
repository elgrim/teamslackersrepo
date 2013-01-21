<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewComment.aspx.cs" Inherits="NewComment" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <asp:LoginView ID="HeadLoginStatus" runat="server">
        <AnonymousTemplate>
            
            <table>
                <tr>
                    <td>
                        Message:</td>
                    <td>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" Columns="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                            ErrorMessage="Message is required." Text="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                            onclick="btnSubmit_Click" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
            </table>
            
        </AnonymousTemplate>
        <LoggedInTemplate>
            <table>
                <tr>
                    <td>
                        Message:</td>
                    <td>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6" Columns="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                            ErrorMessage="Message is required." Text="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                            onclick="btnSubmit_Click" />
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
            </table>
        </LoggedInTemplate>
    </asp:LoginView>

</asp:Content>

