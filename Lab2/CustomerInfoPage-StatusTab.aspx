<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerInfoPage-StatusTab.aspx.cs" Inherits="Lab2.CustomerInfoPage_StatusTab" EnableEventValidation = "false"%>
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
                <li class="nav-item "><a class="nav-link text-black" href="InitialContactInfo.aspx">New Customer</a></li>
                <li class="nav-item "><a class="nav-link text-black" href="ReportLandingPage.aspx">Reports</a></li>
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
                    <a class="nav-link" aria-current="page" href="CustomerInfoPage.aspx">Customer Information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CustomerInfoPage-Forms.aspx">Forms</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Statuses</a>
                </li>
            </ul>
        </div>
        <div class="container-fluid pr-5 pl-5">
            <div class="tab-content">
                <div class="tab-pane fade show active">
                 <%--   <a class="btn btn-primary" href="#">Edit</a>--%>
                    <form class="border p-3">
                        <div class="form-group row">
                            <div class="col-3">
                                <asp:GridView ID="servicesGridView" runat="server" class="table table-bordered" EmptyDataText="No Record" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged">
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-3">
                                <label for="streetAddress" class="col-form-label">Status</label>
                                <div class="ml-2">
                                    <asp:TextBox ID="txtStatus" runat="server" class="form-control" AutoPostBack="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-3">
                                <label for="city" class="col-form-label">Status Notes</label>
                        
                                <div class="ml-2">
                                    <asp:TextBox ID="txtStatusNotes" runat="server" class="form-control" AutoPostBack="true"></asp:TextBox>

                                </div>
                            </div>
          
                        </div>
                         <asp:Button ID="editBtn" class="btn btn-primary" runat="server" Text="Edit" OnClick="Edit_Click"/>
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
