<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeLoginPage.aspx.cs" Inherits="Lab2.EmployeeLoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Table ID="Table1" runat="server">
             <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="lblHeaderMessage" runat="server" Text="Please Login to the Application!(Employee Site)" Font-Bold="true" Font-Size="Larger"></asp:Label>
                        <br />
             </asp:TableCell>
             </asp:TableRow>
             <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUserName" runat="server" Text="Username:  "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUserName" runat="server" Text="" ></asp:TextBox>
                    </asp:TableCell>
             </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassWord" runat="server" Text="PassWord:  "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassWord" runat="server" Text="" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="correct" runat="server" Text="Populate(Correct)" Onclick="correct_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="incorrect" runat="server" Text="Populate(Incorrect)" Onclick="incorrect_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                 <asp:Button ID="btnLogin" runat="server" Text="Login" Onclick="btnLogin_Click"/>
                <br />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="clear" runat="server" Text="Clear" Onclick="clear_Click"/>
                </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnBack" runat="server" Text="Back to the Start Page"  Onclick="btnBack_Click"/>
                     </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
</asp:Content>
