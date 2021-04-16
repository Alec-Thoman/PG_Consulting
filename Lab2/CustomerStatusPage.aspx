﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerStatusPage.aspx.cs" Inherits="Lab2.WebForm6" %>
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
    <style>
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }

        .drop-dwn {
            text-transform: none;
            padding: 10px 20px;
            font-size: 1rem;
        }
    </style>
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="navbar-header">
            <a class="navbar-brand js-scroll-trigger text-black" href="../new-employee-index.html">
                <div class="logo"><img src="../../assets/img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item "><a class="nav-link text-black" href="../reports/reports.html">Reports</a></li>
                <li class="nav-item"><a class="nav-link text-black"
                        href="../employee-profile/employee-profile.html">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="../employee-login.html">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="jumbotron">
        <div class="container-fluid text-left">
            <h1 class="text-black">Customer Name</h1>
            <p>Date this customer account was created</p>
        </div>
    </div>

    <div class="container-fluid bg-3 mb-3">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="customer-information.html">Customer Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customer-forms.html">Forms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">Statuses</a>
            </li>
        </ul>
    </div>
    <div class="container-fluid pr-5 pl-5">
        <div class="tab-content">
            <div class="tab-pane fade show active">
                <div class="row">
                    <div class="dropdown">
                        <button class="btn dropdown-toggle border drop-dwn bg-white" type="button"
                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Select Service
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Service Order</a>
                            <a class="dropdown-item" href="#">Service Order</a>
                            <a class="dropdown-item" href="#">Service Order</a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    Table element of service
                </div>
            </div>
        </div>
    </div>
</body>

</html>
</asp:Content>
