<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReportLandingPage.aspx.cs" Inherits="Lab2.ReportLandingPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html lang="en-US">

<head>
    <title>Green Valley Auction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="../../css/custom-styles.css">
    <script src="https://kit.fontawesome.com/80d9cd143b.js" crossorigin="anonymous"></script>
</head>

<body id="page-top" class="bg-light">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white" id="mainNav">
        <div class="navbar-header">
            <a class="navbar-brand js-scroll-trigger text-black" href="NewestEmployeeHomePage.aspx">
                <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item "><a class="nav-link text-black active" href="#">Reports</a></li>
                <li class="nav-item"><a class="nav-link text-black"
                        href="EmployeeProfile.aspx">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="EmployeeLoginPageBStrap.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1>Reports</h1>
        <asp:Button ID="tableauButton" runat="server" Text="Tableau" OnClick="tableauButton_Click"/>
        <br />
        <br />
        <asp:Button ID="upcomingSvcBtn" runat="server" Text="UpcomingServices" OnClick="upcomingSvcBtn_Click"/>
    </div>
</body>

</html>
</asp:Content>
