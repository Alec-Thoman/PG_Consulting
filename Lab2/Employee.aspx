<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Lab2.Employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <fieldset>
                <legend>Select Employee view the Employee Information</legend> <asp:DropDownList ID="ddlCustomerList" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="EmployeeName" DataValueField="EmployeeID" 
                    AutoPostBack="true" OnselectedIndexChanged="customerSelected"></asp:DropDownList>
                <br />
                <asp:GridView ID="grdCustomer" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                <asp:Button ID="Button1" runat="server" Text="Show All" onclick="Button1_Click"/>
                </fieldset>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Created by Yuhui and Jocab"></asp:Label>
            <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
         <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee Order By EmployeeName ASC"/>
</asp:Content>
