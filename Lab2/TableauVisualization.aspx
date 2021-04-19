<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TableauVisualization.aspx.cs" Inherits="Lab2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <iframe src="img/Tableau.png"
 width="645" height="955"></iframe>
    <br />
    <br />
    <asp:Button ID="backbtn" runat="server" Text="Back" OnClick="backbtn_Click"/>
</asp:Content>