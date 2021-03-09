<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StartPage.aspx.cs" Inherits="Lab2.StartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
             <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="lblHeaderMessage" runat="server" Text="Welcome!" Font-Bold="true" Font-Size="Larger"></asp:Label>
                        <br />
             </asp:TableCell>
             </asp:TableRow>
             <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="EmployeeSignin" runat="server" Text="Employee Sign In--->" OnClick="EmployeeSignin_Click"/>
                    </asp:TableCell>
             </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="CustomerSignin" runat="server" Text="Customer Sign In--->" Onclick="CustomerSignin_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="CustomerSignup" runat="server" Text="Sign up as New Customer" Onclick="CustomerSignup_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
</asp:Content>
