<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ServiceOrderFormBStrap.aspx.cs" Inherits="Lab2.ServiceOrderFormBStrap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html lang="en-US">

<head>
    <title>Green Valley Auction</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="../../css/custom-styles.css">
</head>

<body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-white" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger text-black" href="EmployeeHomePageBStrap.aspx">
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
                            href="ServiceViewBStrap.aspx">Services</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black" href="EmployeeCustomerViewBStrap.aspx">Customers</a>
                    </li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="InventoryBStrap.aspx">Inventory</a>
                    </li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger text-black"
                            href="EmployeeViewBStrap.aspx">Employees</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="about-section pr-5 pl-5" style="padding-top: 150px;">
        <div class="row">
            <h1>Add a Service</h1>
        </div>
        <div class="row">
            <div class="col-12">
                <form>
                    <div class="form-group">
                        <div class="form-group">
                        <label for="exampleFormControlSelect1">Service Type</label>
                        <asp:DropDownList ID="ServiceList" runat="server" class="form-control"
                    DataSourceID="dtasrcServiceList" DataTextField="ServiceType" DataValueField="ServiceID" AutoPostBack="true" OnSelectedIndexChanged="ServiceList_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <label for="exampleFormControlTextarea1" id="requestDetail" runat="server" forecolor = "Blue"> </label>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Date of Service</label>
                        <input class="form-control" runat="server" id="deadlineDate" placeholder="01/01/2021">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Time of Service</label>  <%--D--%>
                        <input class="form-control" runat="server" id="serviceTime" placeholder="04:50 AM">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Customer Name</label>
                        <asp:DropDownList ID="ddlCustomerList" runat="server" class="form-control"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" AutoPostBack="true"></asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" id="addressLbl" runat="server">Current Address</label>
                        <input class="form-control" runat="server" id="addressTxt" >
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" id="destinationLbl" Visible="true" runat="server">Destination Address</label>
                        <input class="form-control" runat="server" id="destinationTxt" visible="true" >  
                    </div>
                     <label for="exampleFormControlTextarea1" id="packingLbl" Visible="true" runat="server">Packing Service Order</label>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" id="boxLbl" Visible="true" runat="server">Boxes Needed:</label>
                        <br />
                        <label for="exampleFormControlTextarea1" id="smallLbl" Visible="true" runat="server">Small:</label>
                        <input class="form-control" runat="server" id="txtSmall" visible="true" >  
                        <label for="exampleFormControlTextarea1" id="mediumLbl" Visible="true" runat="server">Medium:</label>
                        <input class="form-control" runat="server" id="txtMedium" visible="true" > 
                        <label for="exampleFormControlTextarea1" id="largeLbl" Visible="true" runat="server">Large:</label>
                        <input class="form-control" runat="server" id="txtLarge" visible="true" > 
                        <label for="exampleFormControlTextarea1" id="wardrobeLbl" Visible="true" runat="server">Wardrobe:</label>
                        <input class="form-control" runat="server" id="txtWardrobe" visible="true" > 
                        <label for="exampleFormControlTextarea1" id="artLbl" Visible="true" runat="server">Art:</label>
                        <input class="form-control" runat="server" id="txtArt" visible="true" > 
                        <label for="exampleFormControlTextarea1" id="assignedCrewLbl" Visible="true" runat="server">Assigned Crew:</label>
                        <input class="form-control" runat="server" id="txtCrew" visible="true" >
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Dumpster Needed?</label>
                        <asp:DropDownList ID="dumpsterOption" runat="server">
                            <asp:ListItem Enabled="true" Text="No" Value="No"></asp:ListItem>
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        </asp:DropDownList>
                        <label for="exampleFormControlTextarea1" id="addressLbl2" runat="server">Address</label>
                        <input class="form-control" runat="server" id="txtTrashAddress" >
                        <label for="exampleFormControlTextarea1" id="countMenLbl" runat="server">Number of Men</label>
                        <input class="form-control" runat="server" id="txtCountMen" >
                        <label for="exampleFormControlTextarea1" id="chargeLbl" runat="server">Amount Charging</label>
                        <input class="form-control" runat="server" id="txtCharging" >
                        <label for="exampleFormControlTextarea1" id="scheduleLbl" runat="server">Scheduling</label> <%--needs scheduling popup?--%>
                        <input class="form-control" runat="server" id="txtScheduling" >
                        <label for="exampleFormControlTextarea1" id="trashLbl" runat="server">Trash Description</label> <%--D--%>
                        <input class="form-control" runat="server" id="txtTrashDescription" >
                    </div>

                    <%--<div class="form-group">
                        <label for="exampleFormControlSelect1">Requested Service</label>
                        <asp:DropDownList ID="ddlCustomerList" runat="server" class="form-control"
                    DataSourceID="dtasrcCustomerList" DataTextField="CustomerName" DataValueField="CustomerID" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Service Type</label>
                        <asp:DropDownList ID="ServiceList" runat="server" class="form-control"
                    DataSourceID="dtasrcServiceList" DataTextField="ServiceType" DataValueField="ServiceID" AutoPostBack="true" OnSelectedIndexChanged="ServiceList_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Employee</label>
                        <asp:DropDownList ID="employeeList" runat="server" class="form-control"
                    DataSourceID="dtasrcEmployeeList" DataTextField="EmployeeName" DataValueField="EmployeeID" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Ticket Open Date</label>
                        <input class="form-control" id="ticketOpenDate" runat="server" placeholder="01/01/2021">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Deadline Date</label>
                        <input class="form-control" runat="server" id="deadlineDate" placeholder="01/01/2021">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlSelect1">Ticket Status</label>
                        <input class="form-control" runat="server" id="ticketStatus" placeholder="Created">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" id="addressLbl" runat="server">Address</label>
                        <input class="form-control" runat="server" id="addressTxt" >
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1" id="destinationLbl" Visible="false" runat="server">Destination Address</label>
                        <input class="form-control" runat="server" id="destinationTxt" visible="false" >
                        
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Notes</label>
                        <textarea class="form-control" id="notesTxt" rows="3" runat="server"></textarea>
                    </div>--%>
                </form>
            </div>
            <div class="row">
                
                
                    <asp:Button ID="requestBtn" class="btn btn-primary" runat="server" Text="Submit" /> <%--OnClick="request_Click"--%>
                    <asp:Button ID="populateBtn" class="btn btn-primary" runat="server" Text="Populate" /> <%--OnClick="populate_Click"--%>
                
            </div>
        </div>
    </section>
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
      <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName desc"/>
    <asp:SqlDataSource runat="server" ID="dtasrcServiceList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select ServiceID, ServiceType from Service"/>
        <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee"/>
</asp:Content>
