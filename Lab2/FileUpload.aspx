<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="Lab2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Upload File Here" Font-Bold="true"></asp:Label>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
    <asp:Button ID="fileUploadbtn" runat="server" Text="Upload File" OnClick="fileUploadbtn_Click" CausesValidation="false"/>
    <br />
    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
    <br />
    <br />
    <asp:Button ID="HomePage" runat="server" Text="Return to Home Page" OnClick="HomePage_Click"/>
    <asp:Button ID="logoutButton" runat="server" Text="Log Out" OnClick="logoutButton_Click"/>
</asp:Content>

