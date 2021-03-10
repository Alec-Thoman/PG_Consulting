<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Workflow.aspx.cs" Inherits="Lab2.Workflow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <fieldset>
                <legend>Select Customer to view the Service Ticket</legend> <asp:DropDownList ID="ddlCustomerList" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" 
                    AutoPostBack="true" OnselectedIndexChanged="customerSelected"></asp:DropDownList>
                <br />
                <asp:GridView ID="grdWorkflow" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                <asp:Button ID="Button1" runat="server" Text="Show All" OnClick="Button1_Click" CausesValidation="false" />
                <asp:Button ID="Button2" runat="server" Text="Clear" Onclick="Button2_Click" CausesValidation="false"/>
                </fieldset>
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
                    AutoPostBack="true" OnselectedIndexChanged="Note_SelectedIndexChanged"></asp:DropDownList>
                <br />
                <asp:GridView ID="NoteBody" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                 </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                </fieldset>

             <asp:Table ID="Table1" runat="server" Height="235px" Width="392px">
                <asp:TableHeaderRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="Label13" runat="server" Text="Update the ticket details（For the ServiceTicket Selected Above）: "></asp:Label>
                    </asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="TicketChangedDate: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" Text="" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox1"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Note Title: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox2" runat="server" Text="" AutoPostBack="true" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox2"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:Button ID="btnAuctionEvent" runat="server" Text="Update Auction Event" Visible="false" OnClick="btnAuctionEvent_Click" CausesValidation="false"/>
                     </asp:TableCell> 
                     <asp:TableCell>
                         <asp:Button ID="btnShow" runat="server" Text="Show Update Result" Visible="false"  CausesValidation="false" OnClick="btnShow_Click"/>
                     </asp:TableCell>  
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="Note Body: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox3" runat="server" Text="" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox3"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="EmployeeInCharge: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="employeeList" runat="server"
                    DataSourceID="dtasrcEmployeeList" DataTextField="EmployeeName" DataValueField="EmployeeID" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="Populate" runat="server" Text="Populate" onclick="Populate_Click" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>      
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="Update" runat="server" Text="Update" onclick="Update_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="Clear" runat="server" Text="Clear" onclick="Clear_Click" CausesValidation="false"/>
                    </asp:TableCell>
                       <asp:TableCell>
                        <asp:Label ID="UpdateDetail" runat="server" Text="" ForeColor="Blue"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow> 
                </asp:Table>  

                 <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
                <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
                ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC"/>
                <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
                ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee"/>

                  <asp:Label ID="Label1" runat="server" Text="Created by Yuhui and Jacob" ForeColor="Blue"></asp:Label>
</asp:Content>
