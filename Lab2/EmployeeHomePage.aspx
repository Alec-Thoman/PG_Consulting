﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeHomePage.aspx.cs" Inherits="Lab2.LoginAwareHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="lblUserLoggedIn" runat="server" Text=""></asp:Label>
    <br />
    <fieldset>
        <legend>Select the page You want to Visit </legend>
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Label ID="lblHeaderMessage" runat="server" Text="Select the page You want to view" Font-Bold="true" Font-Size="Larger"></asp:Label>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInitialContact" runat="server" Text=" View the Initial Contact Page:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="BtnInitialContact" runat="server" Text="Add Initial Information" OnClick="btnInitialContact_Click" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblServiceEvent" runat="server" Text=" Add new Service:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="serviceEvent" runat="server" Text="Add Service" OnClick="serviceEvent_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblViewService" runat="server" Text=" Search and View Customer Services:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="viewServiceBtn" runat="server" Text="GO" OnClick="viewService_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblWorkflow" runat="server" Text="View and Add Notes to Services: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="workflow" runat="server" Text="GO" OnClick="workflow_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblEmployee" runat="server" Text="View Employee Page: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="employee" runat="server" Text="View Employee Information" OnClick="employee_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblInventory" runat="server" Text="View Inventory Page:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="invenory" runat="server" Text="View Inventory Information" OnClick="invenory_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </fieldset>
    <asp:Table ID="Table2" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNotification" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="Remove" runat="server" Text="Remove" OnClick="Remove_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>



    <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />


</asp:Content>
