<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerInfoPage.aspx.cs" Inherits="Lab2.CustomerInfoPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!DOCTYPE html>

<html lang="en-US">

<head>
    <title>Green Valley Auctions</title>
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
    </style>
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="navbar-header">
            <a class="navbar-brand js-scroll-trigger text-black" href="NewestEmployeeHomePage.aspx">
                <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item "><a class="nav-link text-black" href="#">Reports</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="EmployeeProfile.aspx">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="EmployeeLoginPageBStrap.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="jumbotron">
                    <div class="container-fluid text-left">
                      <%--  <h1 class="text-black">Customer Name</h1>--%>
                        <asp:Label ID="namelbl" runat="server" class="text-black" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
                        <br/>
                        <asp:Label ID="createDatelbl" runat="server" class="text-black"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-3 mb-3">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Customer Information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CustomerInfoPage-Forms.aspx">Forms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CustomerInfoPage-StatusTab.aspx">Statuses</a>
                </li>
            </ul>
        </div>
        <div class="container-fluid pr-5 pl-5">
            <div class="tab-content">
                <div class="tab-pane fade show active">
                 <%--   <a class="btn btn-primary" href="#">Edit</a>--%>
                    <asp:Button ID="editButton" runat="server" Text="Edit" Class="btn btn-primary" OnClick="editButton_Click" />
                    <form class="border p-3">
                        <div class="form-group row">
                            <div class="col-3">
                                <label for="fnlbl" class="col-form-label">First Name:</label>
                                <div class="ml-2">
                                    <%--<input type="first-name" class="form-control" id="firstName"
                                        placeholder="First Name Placeholder" readonly>--%>
                                    <asp:TextBox ID="fnTB" class="form-control" runat="server" Text=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="lastName" class="col-form-label">Last Name:</label>
                                <div class="ml-2">
                                    <asp:TextBox ID="lnTB" runat="server" class="form-control" Text=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="email" class="col-form-label">Email Address:</label>
                                <div class="ml-2">
                                    <%--<input type="email" class="form-control" id="email" placeholder="email@email.com"
                                        readonly>--%>

                                    <asp:TextBox ID="emailTB" class="form-control" runat="server" Text=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="phone" class="col-form-label">Phone Number:</label>
                                <div class="ml-2">
                                    <%--<input type="phone" class="form-control" id="phone" placeholder="(555) 555-5555"
                                        readonly>--%>
                                    <asp:TextBox ID="phoneTB" runat="server" class="form-control" Text=""></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-3">
                                <label for="streetAddress" class="col-form-label">Street Address:</label>
                                <div class="ml-2">
                                    <%--<input type="street-address" class="form-control" id="streetAddress"
                                        placeholder="555 Elk St." readonly>--%>
                                    <asp:TextBox ID="addressTB" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="city" class="col-form-label">City:</label>
                                <div class="ml-2">
                                    <%--<input type="city" class="form-control" id="city" placeholder="Harrisonburg"
                                        readonly>--%>
                                    <asp:TextBox ID="cityTB" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="state" class="col-form-label">State:</label>
                                <div class="ml-2">
                                    <%--<input type="state" class="form-control" id="state" placeholder="VA" readonly>--%>
                                    <asp:TextBox ID="stateTB" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="zip" class="col-form-label">ZIP Code:</label>
                                <div class="ml-2">
                                    <%--<input type="zip" class="form-control" id="zip" placeholder="22801" readonly>--%>
                                    <asp:TextBox ID="zipTB" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <button class="btn open-button" onclick="openForm()">Notes</button>

        <div class="form-popup" id="myForm">
            <form action="/action_page.php" class="form-container">
                <h2>Notes</h2>
                <div class="text-center">
                    <textarea class="p-2" type="text" placeholder="Type notes here..." name="email" rows="10"
                        cols="55"></textarea>
                </div>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            </form>
        </div>
                         <%-- <asp:Button ID="submitButton" runat="server" Text="Submit" class="btn btn-primary" OnClick="submitButton_Click"/>
                          <asp:Button ID="cancelButton" runat="server" Text="Cancel" class="btn btn-default" OnClick="cancelButton_Click"/>--%>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
</asp:Content>


