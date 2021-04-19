<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RecentSvcReport.aspx.cs" Inherits="Lab2.RecentSvcReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="titlelabel" runat="server" Text="Upcoming Services" Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
    <asp:GridView ID="servicesGridview" runat="server" AutoGenerateColumns="true" />
    <br />
    <br />
    <asp:Button ID="backbtn" runat="server" Text="Back" OnClick="backbtn_Click"/>
</asp:Content>
