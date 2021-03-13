<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ServiceEvent.aspx.cs" Inherits="Lab2.ServiceEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="Label13" runat="server" Text="Service Form: "></asp:Label>
                    </asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server" Text="Customer Full Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlCustomerList" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="ServiceType: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ServiceList" runat="server"
                    DataSourceID="dtasrcServiceList" DataTextField="ServiceType" DataValueField="ServiceID" AutoPostBack="true" OnSelectedIndexChanged="ServiceList_SelectedIndexChanged"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="Initiating Employee: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="employeeList" runat="server"
                    DataSourceID="dtasrcEmployeeList" DataTextField="EmployeeName" DataValueField="EmployeeID" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>                                          
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label6" runat="server" Text="Ticket Open Date: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" Text=""></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox1" Text="Field Can Not Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label9" runat="server" Text="TicketStatus: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox7" runat="server" Text="" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox7" Text="Field Can Not Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Address: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox2" runat="server" Text="" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox2" Text="Field Can Not Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label4" runat="server" Text="Destination: " Visible="false"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox3" runat="server" Text="" visible="false"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox3" Text="Field Can Not Be Blank" ForeColor="Red" EnableClientScript="false" Enabled="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Deadline For Service: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox4" runat="server" Text="" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox4" Text="Field Can Not Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <br />
            <asp:Table runat="server">
            <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="Button2" runat="server" Text="Populate" OnClick="Button2_Click" CausesValidation="false" />
                    </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                    <asp:TableCell>
                    <asp:Button ID="Button1" runat="server" Text="Request Service" OnClick="Button1_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                     <asp:Button ID="Button3" runat="server" Text="Clear Form" OnClick="Button3_Click" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="requestDetail" runat="server" Text="" ForeColor="Blue"></asp:Label>
                    </asp:TableCell>
             </asp:TableRow>
            </asp:Table>

             <%--<fieldset> //No longer Needed. Delete after completion
                <legend>Select Customer view the Event</legend> <asp:DropDownList ID="ddlCustomerList1" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" 
                    AutoPostBack="true" OnselectedIndexChanged="customerSelected"></asp:DropDownList>
                <br />
                <asp:GridView ID="grdCustomer" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                </fieldset>--%>
            <br />
            <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
            <asp:Label ID="Label8" runat="server" Text="Created by jacob and Yuhui"></asp:Label>
             <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName desc"/>
        <asp:SqlDataSource runat="server" ID="dtasrcServiceList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select ServiceID, ServiceType from Service"/>
        <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee"/>
</asp:Content>
