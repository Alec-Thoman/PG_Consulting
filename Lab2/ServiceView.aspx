<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ServiceView.aspx.cs" Inherits="Lab2.ViewService" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Table ID="SearchServiceTable" runat="server">
             <asp:TableHeaderRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="searchLbl" runat="server" Text="Search Services: "></asp:Label>
                    </asp:TableCell>
             </asp:TableHeaderRow>
            <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="instructionsLbl" runat="server" Text="Fill in information to filter: "></asp:Label>
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="nameLbl" runat="server" Text="Name: "></asp:Label>
                    </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="dateLbl" runat="server" Text="Deadline Date: "></asp:Label>
                    </asp:TableCell>
                <asp:TableCell>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="addressLbl" runat="server" Text="Address: "></asp:Label>
                    </asp:TableCell>
                <asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="btnSearch" runat="server" Text="Search" Onclick="btnSearch_Click" />
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:GridView ID="searchView" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="backToNavigateBtn" runat="server" Text="Back to Navigate Page" Onclick="btnBack_Click" />
                    </asp:TableCell>
            </asp:TableRow>    
        </asp:Table>

</asp:Content>
