<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StatusBar.aspx.cs" Inherits="Lab2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <fieldset>
                <legend>Client Status Bar</legend> 
                <br />
                <asp:GridView ID="grdCustomerStatus" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record" ForeColor="Red">
                </asp:GridView>
                <asp:Label ID="lblCreate" runat="server" Text="Create/Update Client Status"></asp:Label>
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                     <asp:TableCell>
                         <asp:Label ID="lblName" runat="server" Text="Customer Name"></asp:Label>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:DropDownList ID="ddlCustomerList" runat="server"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" AutoPostBack="true"></asp:DropDownList>
                     </asp:TableCell>
                     </asp:TableRow>

                    <asp:TableRow>
                     <asp:TableCell>
                         <asp:Label ID="lblservice" runat="server" Text="ServiceType"></asp:Label>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:DropDownList ID="ServiceList" runat="server"
                    DataSourceID="dtasrcServiceList" DataTextField="ServiceType" DataValueField="ServiceID" AutoPostBack="true" ></asp:DropDownList> 
                     </asp:TableCell>
                     </asp:TableRow>
                    
                    <asp:TableRow>
                     <asp:TableCell>
                         <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                     </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     </asp:TableRow>
                </asp:Table>
                <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click"/>
                </fieldset>
            <br />
            <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" onclick="Back_Click"/>


    <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
                ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC"/>
    <asp:SqlDataSource runat="server" ID="dtasrcServiceList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select ServiceID, ServiceType from Service"/>


</asp:Content>
