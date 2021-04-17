<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerInfoPage-Forms.aspx.cs" Inherits="Lab2.CustomerInfoPage_Forms" %>
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
    <link rel="stylesheet" href="customer-styles.css">
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
            <h1 class="text-black">Jenny Murdock</h1>
            <p>Created Account: 01/01/2021</p>
        </div>
    </div>

    <div class="container-fluid bg-3 mb-3">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="customer-information.html">Customer Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">Forms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="customer-statuses.html">Statuses</a>
            </li>
        </ul>
    </div>
    <div class="container-fluid bg-white pb-5">
        <div class="tab-content">
            <div class="tab-pane fade show active pt-3">
                
                <asp:Button ID="Orders" class="btn btn-primary" runat="server" Text="Orders" OnClick="order_Click"/>
                    <asp:Button ID="Assessments" class="btn btn-primary" runat="server" Text="Assessments" OnClick="assessments_Click" />
                    <asp:Button ID="LookAts" class="btn btn-primary" runat="server" Text="LookAts" />
                <asp:Button ID="Appraisal" class="btn btn-primary" runat="server" Text="Appraisals" />
                <asp:Button ID="Completion" class="btn btn-primary" runat="server" Text="Completion" />
                <br />
                <asp:GridView ID="formsGridView" runat="server" class="table table-bordered" EmptyDataText="No Record">
                                </asp:GridView>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <a class="btn btn-primary" href="">Add Form</a>
                    </div>
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

        <script>
            function openForm() {
                document.getElementById( "myForm" ).style.display = "block";
            }

            function closeForm() {
                document.getElementById( "myForm" ).style.display = "none";
            }
        </script>
    </div>
</body>

</html>
</asp:Content>
