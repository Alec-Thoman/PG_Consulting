<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AuctionServiceOrder.aspx.cs" Inherits="Lab2.AuctionServiceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html lang="en-US">

<head>
    <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/custom-styles.css">
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-white" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger text-black" href="../new-employee/new-employee-index.html">
                <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="../new-employee/reports/reports.html">Reports</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="../new-employee/employee-profile/employee-profile.html">Profile</a>
                    </li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="../new-employee/employee-login.html">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="about-section pr-5 pl-5" style="padding-top: 150px;">
        <div class="row">
            <div class="col-md-12">
                <div class="jumbotron">
                    <div class="container-fluid text-left">
                        <h1 class="text-black">Jenny Murdock</h1>
                        <p>Created Account: 01/01/2021</p>
                        <div class="row">
                            <div class="col-md-10 mx-auto">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputFirstname">First name</label>
                                            <input type="text" class="form-control" id="inputFirstname"
                                                placeholder="Jenny">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputLastname">Last name</label>
                                            <input type="text" class="form-control" id="inputLastname"
                                                placeholder="Murdock">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputContactNumber">Home Phone</label>
                                            <input type="number" class="form-control" id="inputContactNumber"
                                                placeholder="123-456-7890">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputContactNumber">Mobile Phone</label>
                                            <input type="number" class="form-control" id="inputContactNumber"
                                                placeholder="555-234-5678">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputAddressLine1">Address</label>
                                            <input type="text" class="form-control" id="inputAddressLine1"
                                                placeholder="1452 Bradley Dr.">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputAddressLine2">Address (Line 2)</label>
                                            <input type="text" class="form-control" id="inputAddressLine2"
                                                placeholder="Line 2">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputCity">City</label>
                                            <input type="text" class="form-control" id="inputCity"
                                                placeholder="Harrisonburg">
                                        </div>
                                        <div class="col-sm-3">
                                            <label for="inputState">State</label>
                                            <input type="text" class="form-control" id="inputState" placeholder="VA">
                                        </div>
                                        <div class="col-sm-3">
                                            <label for="inputPostalCode">Postal Code</label>
                                            <input type="text" class="form-control" id="inputPostalCode"
                                                placeholder="20120">
                                        </div>
                                    </div>
                                </form>
                                </section>
                            </div>
                </div>
                <!--Body Starts-->

                <body>
                    <section class="about-section pr-5 pl-5" style="padding-top: 0px;">
                        <div class="row">
                            <div class="col-md-12"></div>
                            <h1>Auction Service Order Form</h1>
                        </div>
                        <div class="row"></div>
                        <label id="date/time"><strong>Date and Time of Service</strong></label>
                        <div class="row">
                            <div class="col-md-12 ">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="inputdate"
                                                placeholder="Add Date...">
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="inputtime"
                                                placeholder="Add Time...">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row"></div>
                                    <h7><strong>Different Address for Pickup?</strong></h7>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                                    value="option1">
                                                <label class="form-check-label" for="inlineCheckbox1">Yes</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                                    value="option2">
                                                <label class="form-check-label" for="inlineCheckbox2">No</label>
                                            </div>
                                        </label>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputAddressLine1">Address</label>
                                            <input type="text" class="form-control" id="inputAddressLine1"
                                                placeholder="Line 1">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputAddressLine2">Address (Line 2)</label>
                                            <input type="text" class="form-control" id="inputAddressLine2"
                                                placeholder="Line 2">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="inputCity">City</label>
                                            <input type="text" class="form-control" id="inputCity" placeholder="City">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputState">State</label>
                                            <input type="text" class="form-control" id="inputState" placeholder="State">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row"></div>
                                    <h7><strong>Packing Service Order Section</strong></h7>
                            </div>
                        </div>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Trash Removal Service Order Section</strong></h7>
                     </div>
                     </div>
                     <hr>
                     <h7><strong>Pick Up Service Order Section</strong></h7>
                     </div>
                    </div>
                    <hr>
                    <h7><strong>Storage Assign & Auction Date</strong></h7>
                    <div class="row"></div>
                        <label id="storage assign/auction date"></label>
                        <div class="row">
                            <div class="col-md-12 ">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <label for="storage">Storage Assign</label>
                                            <input type="text" class="form-control" id="inputstorage"
                                                placeholder="Add Storage info...">
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="Auction Date">Auction Date</label>
                                            <input type="text" class="form-control" id="inputdate"
                                                placeholder="Add Auction Date...">
                                        </div>
                    </div>
                    </section>
            </body>
<!--Footer Starts-->
<footer class="bg-light text-left text-lg-start">
    <!-- Grid container -->
    <div class="container p-4">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-5 col-md-12 mb-4 mb-md-0">
                <h5 class="text-black">Green Valley Auctions</h5>

                <p>2259 Green Valley Lane<br>
                    Mount Crawford, Virginia 22841<br>
                    (540) 434-4260<br><br>
                    Download the Green Valley App<br>
                    for Android or Apple phone
                </p>
            </div>
            <!--Grid column-->

            <div class="col-lg-4 col-md-12 mb-4 mb-md-0">
                <p>Office Hours:<br>
                    Monday—Thursday: 8 a.m. - 4:30 p.m.<br>
                    Friday*-8:30 a.m. - 3:00 p.m.<br>
                    Saturday—Sunday: CLOSED<br>
                    *Auctions held every-other Friday.<br>
                </p>
            </div>

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="mb-0">Links</h5>

                <ul class="list-unstyled" style="color: #095951;">
                    <li>
                        <!-- <a class="btn btn-primary btn-floating m-1"
                                    style="background-color: #3b5998; height: auto; width: auto;" href="#!" role="button"><i
                                        class="fab fa-facebook"></i></a> -->
                        <a href="https://www.facebook.com/greenvalleyauctions/" target="_blank"
                            class="footer-link">Facebook</a>
                    </li>
                    <li>
                        <a href="https://twitter.com/GVAuctions3" target="_blank" class="footer-link">Twitter</a>
                    </li>
                    <li>
                        <a href="https://www.youtube.com/channel/UCmCfqjE_7F4K_H64jMKSjyA"
                            class="footer-link">Youtube</a>
                    </li>
                    <li>
                        <a href="https://greenvalleyauctions.hibid.com/email/subscribe" class="footer-link">Email
                            Notifications</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->
        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3">
        © 2021 Green Valley Auctions
        <!-- <a class=" text-dark" href="https://mdbootstrap.com/">MDBootstrap.com</a> -->
    </div>
    <!-- Copyright -->
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</html>
</asp:Content>
