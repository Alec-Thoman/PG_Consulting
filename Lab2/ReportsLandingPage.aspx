<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReportsLandingPage.aspx.cs" Inherits="Lab2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Reports" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
    <br />
    <br />
    <asp:Button ID="tableauButton" runat="server" Text="Tableau" OnClick="tableauButton_Click"/>
    <asp:Button ID="upcomingSvcBtn" runat="server" Text="UpcomingServices" OnClick="upcomingSvcBtn_Click"/>
</asp:Content>
