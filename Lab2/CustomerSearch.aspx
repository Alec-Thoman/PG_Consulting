<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerSearch.aspx.cs" Inherits="Lab2.CustomerSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <fieldset>
                <legend>Selected Customer Past Event</legend> 
                <br />
                    <asp:Button ID="Result" runat="server" Text="Show Result" OnClick="Result_Click" />
                <asp:GridView ID="grdCustomer" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                </fieldset>
                 <br />
                <fieldset>
                <legend>Select ServiceTicket to view the TicketHistory</legend>
                 <asp:Table ID="Table2"  runat="server" >
                    <asp:TableRow>
                    <asp:TableCell>
                 <asp:DropDownList ID="Ticket" runat="server"                  
                    AutoPostBack="true" OnselectedIndexChanged="ServiceTicketSelected"></asp:DropDownList>
                <br />
                <asp:GridView ID="TicketHistory" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Select Note Title to view the details: "></asp:Label>
                    <asp:DropDownList ID="Note" runat="server"                  
                    AutoPostBack="true" OnSelectedIndexChanged="Note_SelectedIndexChanged" ></asp:DropDownList>
                <br />
                <asp:GridView ID="NoteBody" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                 </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                </fieldset>
     <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
                <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
                ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC"/>
                <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
                ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee"/>
            
</asp:Content>
