<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerContactPage.aspx.cs" Inherits="Lab2.CustomerContactPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en-US">

<head>
    <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="../css/custom-styles.css">
    <script src="https://kit.fontawesome.com/80d9cd143b.js" crossorigin="anonymous"></script>
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-white" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="CustomerHomePageBStrap.aspx">
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
                            href="Customer_ServiceViewBStrap.aspx">Services</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black" href="#page-top">Contact</a>
                    </li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="CustomerProfile.aspx">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--Section: Contact v.2-->
    <section class="mb-4 mt-4 pr-5 pl-5" style=" padding-top: 150px;">

        <!--Section heading-->
        <h2 class="h1-responsive font-weight-bold text-left my-4">Contact us</h2>
        <!--Section description-->
        <p class="text-left w-responsive mx-auto mb-5">Interested in one of our services? Get in contact below or call
            our office at (540) 434-4260.</p>

        <div class="row">

            <!--Grid column-->
            <div class="col-md-9 mb-md-0 mb-5">
                <form id="contact-form" name="contact-form" action="mail.php" method="POST">

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-3">
                                <label for="name" class="">Your name</label>
                                <%--<input type="text" id="name" name="name" class="form-control">--%>
                                <asp:TextBox ID="nameTB" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-3">
                                <label for="email" class="">Your email</label>
                                <%--<input type="text" id="email" name="email" class="form-control">--%>
                                <asp:TextBox ID="emailTB" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="md-form mb-3">
                                <label for="subject" class="">Subject</label>
                                <%--<input type="text" id="subject" name="subject" class="form-control">--%>
                                <asp:TextBox ID="subjectTB" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-12">

                            <div class="md-form mb-3">
                                <label for="message">Your message</label>
                                <%--<textarea type="text" id="message" name="message" rows="3"--%>
                                    <%--class="form-control md-textarea"></textarea>--%>

                                <textarea id="bodyTA" rows="3" class="form-control md-textarea" name="bodyTA"></textarea>


                            </div>

                        </div>
                    </div>
                    <!--Grid row-->

                </form>

                <div class="text-center text-md-left">
                    <%--<a class="btn btn-primary" onclick="document.getElementById('contact-form').submit();">Send</a>--%>
                    <asp:Button ID="sendButton" runat="server" Text="Send" OnClick="sendClick" class="btn btn-primary"/>
                </div>
                <div class="status"></div>
            </div>
            <!--Grid column-->

        </div>

    </section>
    <!--Section: Contact v.2-->
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
