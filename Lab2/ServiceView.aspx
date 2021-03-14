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
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnViewAll" runat="server" Text="View All" OnClick="btnViewAll_Click" />
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
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
                <asp:Label ID="serviceTitle" runat="server" Text="Select ServiceTicket to view the TicketHistory"></asp:Label>
                <br />
                <asp:DropDownList ID="Ticket" runat="server"
                    AutoPostBack="true" OnSelectedIndexChanged="ServiceTicketSelected">
                </asp:DropDownList>
                <br />
                <asp:GridView ID="TicketHistory" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="Label5" runat="server" Text="Select Note Title to view the details: "></asp:Label>
                <asp:DropDownList ID="Note" runat="server"
                    AutoPostBack="true" OnSelectedIndexChanged="Note_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:GridView ID="NoteBody" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
            </asp:TableCell>



        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="backToNavigateBtn" runat="server" Text="Back to Navigate Page" OnClick="btnBack_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC" />
    <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee" />

</asp:Content>
