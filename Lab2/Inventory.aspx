<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Lab2.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
                <legend>Select Customer view the Inventory</legend> <asp:DropDownList ID="ddlCustomerList" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" 
                    AutoPostBack="true" OnselectedIndexChanged="customerSelected"></asp:DropDownList>
                <br />
                <asp:GridView ID="grdInventory" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                  <asp:Button ID="Button1" runat="server" Text="Show All" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Clear" Onclick="Button2_Click"/>
            </fieldset>
              <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC"/>
        <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
</asp:Content>
