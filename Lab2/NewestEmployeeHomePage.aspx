﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewestEmployeeHomePage.aspx.cs" Inherits="Lab2.NewestEmployeeHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html lang="en-US">

<head>
    <title>Green Valley Auction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/custom-styles.css">
    <script src="https://kit.fontawesome.com/80d9cd143b.js" crossorigin="anonymous"></script>
    <style>
        .cust-button {
            border-color: #095951 !important;

            color: #fff !important;
            background-color: #095951 !important;
        }

        .cust-dropdown {
            border-color: #095951 !important;
            color: #095951 !important;
        }
    </style>
</head>

<body id="page-top" class="bg-light">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white" id="mainNav">
        <div class="navbar-header">
            <a class="navbar-brand js-scroll-trigger text-black" href="../new-employee-index.html">
                <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item "><a class="nav-link text-black" href="reports/reports.html">Reports</a></li>
                <li class="nav-item"><a class="nav-link text-black"
                        href="employee-profile/employee-profile.html">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="EmployeeLoginPageBStrap.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container pt-lg-4">
        <div class="row pb-md-4">
            <div class="col-5 bg-white border shadow-sm p-4">
                <h2 class="pb-3">Customer Statuses</h2>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Order</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a></td>
                            <td>Auction Order</td>
                            <td>Waiting</td>
                        </tr>
                        <tr>
                            <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a></td>
                            <td>Auction Order</td>
                            <td>Waiting</td>
                        </tr>
                        <tr>
                            <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a></td>
                            <td>Auction Order</td>
                            <td>Waiting</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-5 ml-auto bg-white border shadow-sm p-4">
                <h2 class="pb-3">Search Customer</h2>
                <div class="pr-5 pl-5 pb-3 text-center">
                    <div class="input-group">
                        <input type="search" class="form-control rounded mr-3 mt-2" placeholder="Search"
                            aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" class="btn border shadow-none p-sm-3 cust-button">Search</button>
                    </div>
                </div>
                <div class="border p-4 text-center">
                    Results for Search go here.
                </div>
            </div>
        </div>
        <div class="row pb-md-4">
            <div class="col-12 bg-white border shadow-sm p-4">
                <div class="row">
                    <div class="col-12">
                        <h2 class="pb-3">Select Service</h2>
                    </div>
                </div>
                <div class="row pb-3">
                    <div class="col-4">
                        <div class="input-group">
                            <input type="search" class="form-control rounded mr-3 mt-2" placeholder="Search"
                                aria-label="Search" aria-describedby="search-addon" />
                            <button type="button" class="btn border shadow-none p-sm-3 cust-button">Search</button>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="dropdown show">
                            <a class="btn border dropdown-toggle p-3 cust-dropdown" href="#" role="button"
                                id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Dropdown link
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Order</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a>
                                    </td>
                                    <td>Auction Order</td>
                                    <td>Waiting</td>
                                </tr>
                                <tr>
                                    <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a>
                                    </td>
                                    <td>Auction Order</td>
                                    <td>Waiting</td>
                                </tr>
                                <tr>
                                    <td scope="row"><a href="view-customer/customer-information.html">Jenny Murdock</a>
                                    </td>
                                    <td>Auction Order</td>
                                    <td>Waiting</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
</asp:Content>
