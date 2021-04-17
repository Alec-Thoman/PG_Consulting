<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AppraisalServiceOrder.aspx.cs" Inherits="Lab2.AppraisalServiceOrder" %>
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
    <link rel="stylesheet" href="forms-styles.css">
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
                            href="EmployeeLoginPageBStrap.aspx">Logout</a>
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
                        <%--<h1 class="text-black">Jenny Murdock</h1>--%>
                        <%--<p>Created Account: 01/01/2021</p>--%>
                        <asp:Label ID="custNamelbl" runat="server" Text="" class="text-black" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
                        <br />
                        <asp:Label ID="createAccountDatelbl" runat="server" Text="" class="text-black"></asp:Label>
                    </div>
                </div>
                <!--Body Starts-->

                <body>
                    <section class="about-section pr-5 pl-5" style="padding-top: 0px;">
                        <div class="row">
                            <h1>Appraisal Service Order Form</h1>
                        </div>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Purpose of Appraisal</strong></h7>
                        <div class="form-check">
                            <%--<input class="form-check-input" type="checkbox" name="estate appraisal for tax purposes"
                                id="" value="option1" checked>
                            <label class="form-check-label" for="option 2">Estate appraisal for tax
                                purposes---establishes value of personal property
                            </label>--%>
                            <asp:CheckBox ID="estateappraisalCB" runat="server" class="form-check-input" Text="Estate appraisal for tax purposes---establishes value of personal property"/>
                            <br />
                            <asp:CheckBox ID="familyappraisalCB" runat="server" class="form-check-input" Text="Family division appraisal---establishes fair market value so distribution of items is equal"/>
                        </div>
                        <br>
                      <%--  <div class="form-check">
                            <%--<input class="form-check-input" type="checkbox" name="family division appraisal" id=""
                                value="option2">
                            <label class="form-check-label" for="option 1">Family division appraisal----establishes fair
                                market value so distribution of items is equal
                            </label>--%>
                            <%--<asp:CheckBox ID="familyappraisalCb" runat="server" class="form-check-input" Text="Family division appraisal---establishes fair market value so distribution of items is equal"/>
                        </div>--%>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Is there a deadline?</strong></h7>
                        <div class="form-group row">
                            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">
                                <div class="form-check form-check-inline">
                                    <%--<input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                        value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">Yes</label>--%>
                                    <%--<asp:CheckBox ID="deadlineYesCB" runat="server" Text="Yes" class="form-check-input"/>--%>
                                    <asp:RadioButton ID="deadlineYesRB" runat="server" Text="Yes" AutoPostBack="true"/>
                                </div>
                                <div class="form-check form-check-inline">
                                    <%--<input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                        value="option2">
                                    <label class="form-check-label" for="inlineCheckbox2">No</label>--%>
                                    <%--<asp:CheckBox ID="deadlineNoCB" runat="server" Text="No" class="form-check-input"/>--%>
                                    <asp:RadioButton ID="deadlineNoRB" runat="server" Text="No" AutoPostBack="true"/>
                                </div>
                            </label>
                            <div class="col-sm-6">
                                <%--<input type="date" class="form-control form-control-sm" id="colFormLabelSm"
                                    placeholder="Add date here...">--%>
                                <asp:Label ID="labelDeadline" runat="server" Text="Deadline Date: " Visible="false"></asp:Label>
                                <asp:TextBox ID="deadlineTB" runat="server" TextMode="Date" Visible="false"></asp:TextBox>
                            </div>
                        </div>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Size of Appraisal</strong></h7>
                        <div class="col-sm-8">
                            <%--<input type="date" class="form-control form-control-sm" id="colFormLabelSm"
                                placeholder="Add info here...">--%>
                            <asp:TextBox ID="appraisalSizeTB" runat="server"></asp:TextBox>
                        </div>
                        <hr>
                        <div class="row"></div>
                        <%--<h7><strong>Schedule Appraisal</strong></h7>
                        <button type="button" class="btn btn-outline-primary"><a
                                href="../Forms/scheduling-pop-up.html">Pop-up schedule form</a></button>--%>
                        <%--<hr>--%>
                        <div class="row"></div>
                        <h7><strong>Upload Photos Here</strong></h7>
                        <br>
                        <%--<input type="file" size="60" />--%>
                        <asp:FileUpload ID="FileUploadPhotos" runat="server" />
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Inventory</strong></h7>
                        <br>
                        <%--<textarea id="story" name="story" rows="5" cols="60">
                        </textarea>--%>
                        <textarea id="inventoryTA" cols="60" rows="5" runat="server"></textarea>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Need additional Services?</strong></h7>
                        <%--<button type="button" class="btn btn-outline-primary"><a href="../Forms/move-assessment.html">Move Assessment</a></button>--%>
                        <asp:Button ID="moveassessmentbtn" runat="server" Text="Move Assessment" class="btn btn-outline-primary" OnClick="moveassessmentbtn_Click"/>
                        <button type="button" class="btn btn-outline-primary"><a href="../Forms/auction-assessment.html">Auction Assessment</a></button>
                        <hr>
                        <div class="row"></div>
                        <h7><strong>Invoice</strong></h7>
                        <form>
                            <div class="row mb-4">
                                <div class="col">
                                    <div class="form-outline">
                                        <%--<input type="text" id="Contact name" class="form-control" />--%>
                                        <asp:TextBox ID="contactNameTB" runat="server"></asp:TextBox>
                                        <br />
                                        <label class="form-label" for="contact name">Contact Name</label>
                                        <br />
                                        <asp:TextBox ID="apprNameTB" runat="server"></asp:TextBox>
                                        <br />
                                        <label class="form-label" for="Appraisal Name">Appraisal Name</label>
                                    </div>
                                </div>
                                <%--<div class="col">
                                    <div class="form-outline">
                                        <%--<input type="text" id="Appraisal Name" class="form-control" />--%>
                                       <%-- <asp:TextBox ID="apprNameTB" runat="server" class="form-control"></asp:TextBox>
                                        <br />
                                        <label class="form-label" for="Appraisal Name">Appraisal Name</label>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="form-outline mb-4">
                                <%--<input type="text" id="address" class="form-control" />--%>
                                <asp:TextBox ID="sendToAddressTB" runat="server"></asp:TextBox>
                                <br />
                                <label class="form-label" for="address">Address to send Appraisal</label>
                            </div>
                            <div class="form-outline mb-4">
                                <%--<input type="text" id="date" class="form-control" />--%>
                                <asp:TextBox ID="appraisalDateTB" runat="server" TextMode="Date"></asp:TextBox>
                                <br />
                                <label class="form-label" for="date">Date of Appraisal</label>
                            </div>
                            <div class="form-outline mb-4">
                                <%--<input type="email" id="cost" class="form-control" />--%>
                                <asp:TextBox ID="appraisalCostTB" runat="server"></asp:TextBox>
                                <br />
                                <label class="form-label" for="cost">Cost of Appraisal</label>
                            </div>
                            <div class="form-outline mb-4">
                                <%--<textarea class="form-control" id="payment section" rows="4"></textarea>--%>
                                <textarea id="paymentsectTA" rows="4" runat="server"></textarea>
                                <br />
                                <label class="form-label" for="payment section">Payment Section</label>
                            </div>
                            <hr>
                        <div class="row"></div>
                        <h7><strong>Upload and Share Final Appraisal Form</strong></h7>
                            <div class="row mb-12">
                                <div class="col">
                            <%--<button type="submit" class="btn btn-primary">Upload Final Appraisal</button>--%>
                                 <asp:Button ID="uploadAppraisalButton" runat="server" Text="Upload Final Appraisal" class="btn btn-primary" OnClick="uploadAppraisalButton_Click"/>
                            </div>
                                <div class="col">
                            <%--<button type="submit" class="btn btn-primary">Email final copy of Appraisal</button>--%>
                                    <asp:Button ID="emailButton" runat="server" Text="Email final copy of Appraisal" class="btn btn-primary" OnClick="emailButton_Click"/>
                        </form>
                        </section>
                        </div>
            </div>
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
</body>

</html>
</asp:Content>
