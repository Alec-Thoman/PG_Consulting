<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="Lab2.CustomerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en-US">

<head>
  <title>Green Valley Auctions</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../../css/styles.css">
  <link rel="stylesheet" href="../../css/custom-styles.css">
</head>

<body id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-white" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger text-black" href="CustomerHomePageBStrap.aspx">
        <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png" alt="Green Valley Auctions Logo"
            width="200" height="100"></div>
      </a> <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
              href="Customer_ServiceViewBStrap.aspx">Services</a>
          </li>
          <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
              href="CustomerContactPage.aspx">Contact</a>
          </li>
          <li class="nav-item"><a class="nav-link text-black" href="#page-top">Profile</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!--Primary Profile-->
  <section class="about-section pr-5 pl-5" style="padding-top: 150px;">
    <h1>Profile</h1>
    <div class="text-center text-md-right">
      <a href="EditProfilePage.aspx" class="btn btn-primary">Edit</a>
    </div>
    <div class="col-md-12">
      <div class="card">
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <form>
                <div class="form-group row">
                  <label for="username" class="col-4 col-form-label">Name</label>
                  <div class="col-8">
                    <%--<input id="name" name="name" placeholder="John" class="form-control here" type="text">--%>
                      <asp:TextBox ID="nameTB" runat="server" placeholder="John" class="form-control here"></asp:TextBox>
                  </div>
                </div>
                <%--<div class="form-group row">--%>
                  <%--<label for="name" class="col-4 col-form-label">Last Name</label>--%>
                  <%--<div class="col-8">--%>
                    <%--<input id="lastname" name="lastname" placeholder="Doe" class="form-control here" type="text">--%>
                      <%--<asp:TextBox ID="lnameTB" runat="server" placeholder="Doe" class="form-control here"></asp:TextBox>--%>

                  <%--</div>--%>
                <%--</div>--%>
                <%--<div class="form-group row">--%>
                  <%--<label for="lastname" class="col-4 col-form-label">User Name</label>--%>
                  <%--<div class="col-8">--%>
                    <%--<input id="lastname" name="lastname" placeholder="john.doe" class="form-control here" type="text">--%>
                      <%--<asp:TextBox ID="unameBox" runat="server" placeholder="john.doe" class="form-control here"></asp:TextBox>--%>
                  <%--</div>--%>
                <%--</div>--%>
                <%--<div class="form-group row">--%>
                  <%--<label for="text" class="col-4 col-form-label">Password</label>--%>
                  <%--<div class="col-8">--%>
                    <%--<input id="text" name="text" placeholder="GV_auctions" class="form-control here" type="text">--%>
                      <%--<asp:TextBox ID="pwordTB" runat="server" placeholder="GV_auctions" class="form-control here"></asp:TextBox>--%>
                  <%--</div>--%>
                <%--</div>--%>
                <div class="form-group row">
                  <label for="select" class="col-4 col-form-label">Address</label>
                  <div class="col-8">
                    <%--<input id="text" name="text" placeholder="In-state" class="form-control here" type="text">--%>
                      <asp:TextBox ID="addressTB" runat="server" placeholder="1234 street way" class="form-control here"></asp:TextBox>
                  </div>
                </div>
                <%--<div class="form-group row">
                  <label for="email" class="col-4 col-form-label">Email</label>
                  <div class="col-8">
                    <%--<input id="email" name="email" placeholder="john.doe@yahoo.com" class="form-control here"--%>
                      <%--type="text">--%>
                      <%--<asp:TextBox ID="emailTB" runat="server" placeholder="john.doe@yahoo.com" class="form-control here"></asp:TextBox>--%>
                  <%--</div>--%>
                <%--</div>--%>
                <div class="form-group row">
                  <label for="website" class="col-4 col-form-label">Phone Number</label>
                  <div class="col-8">
                    <%--<input id="phonenumber" name="phonenuber" placeholder="555-232-0000" class="form-control here"--%>
                      <%--type="text">--%>
                      <asp:TextBox ID="pnTB" runat="server" placeholder="555-232-0000" class="form-control here"></asp:TextBox>
                  </div>
                </div>
                <%--<div class="form-group row">
                  <label for="additionalinfo" class="col-4 col-form-label">Additional Info</label>
                  <div class="col-8">
                    <%--<textarea id="additionalinfo" name="additionalinfo" cols="40" rows="4"--%>
                      <%--class="form-control"></textarea>--%>
                    <%--  <textarea id="addtlInfoTA" cols="40" rows="4" class="form-control"></textarea>
                  </div>
                </div>--%>
            </div>
            <%--</form>--%>
          </div>
        </div>
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
                    <a href="https://www.youtube.com/channel/UCmCfqjE_7F4K_H64jMKSjyA" class="footer-link">Youtube</a>
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
</body>

</html>
</asp:Content>
