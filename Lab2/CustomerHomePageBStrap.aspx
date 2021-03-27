<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerHomePageBStrap.aspx.cs" Inherits="Lab2.CustomerHomePageBStrap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en-US">

    <head>
    <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/custom-styles.css">
    <script src="https://kit.fontawesome.com/80d9cd143b.js" crossorigin="anonymous"></script>
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <div class="logo"><img src="img/Logos/GVALogo_reverse_allwhite_resized.png"
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
                    <li class="nav-item"><a class="nav-link js-scroll-trigger"
                            href="Customer_ServiceViewBStrap.aspx">Services</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="CustomerContactPage.aspx">Contact</a>
                    </li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger"
                            href="CustomerProfile.aspx">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center">
            <div class="ml-5 text-left text-white">
                <h1 class="text-white splash-title">Welcome!</h1>
                <h2 class="text-white mt-2 mb-5">Here you can learn how to contact Green Valley Auctions to schedule an
                    appraisal!</h2>
                <a class="btn btn-primary" href="CustomerContactPage.aspx">Contact</a>
            </div>
        </div>
    </header>
    <!-- Footer -->
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
    <!-- Footer -->
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>

</html>

</asp:Content>