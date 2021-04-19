<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerInfoPage-Forms.aspx.cs" Inherits="Lab2.CustomerInfoPage_Forms" EnableEventValidation = "false"%>
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
    <link rel="stylesheet" href="../../css/customer-styles.css">
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
                <div class="logo"><img src="img/Logos/GVALogo_Green_resized.png"
                        alt="Green Valley Auctions Logo" width="200" height="100"></div>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item "><a class="nav-link text-black" href="ReportLandingPage.aspx">Reports</a></li>
                <li class="nav-item"><a class="nav-link text-black"
                        href="EmployeeProfile.aspx">Profile</a></li>
                <li class="nav-item"><a class="nav-link text-black" href="EmployeeLoginPageBStrap.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="jumbotron">
        <div class="container-fluid text-left">
            <asp:Label ID="namelbl" runat="server" class="text-black" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
            <br/>
            <asp:Label ID="createDatelbl" runat="server" class="text-black"></asp:Label>
        </div>
    </div>

    <div class="container-fluid bg-3 mb-3">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" aria-current="page" href="CustomerInfoPage.aspx">Customer Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#">Forms</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="CustomerInfoPage-StatusTab.aspx">Statuses</a>
            </li>
        </ul>
    </div>
    <div class="container-fluid bg-white pb-5">
        <div class="tab-content">
            <div class="tab-pane fade show active pt-3 text-center pr-5 pl-5">
                
                <asp:Button ID="Orders" class="btn btn-primary" runat="server" Text="Orders" OnClick="order_Click"/>
                    <asp:Button ID="Assessments" class="btn btn-primary" runat="server" Text="Assessments" OnClick="assessments_Click" />
                    <asp:Button ID="LookAts" class="btn btn-primary" runat="server" Text="LookAts" OnClick="lookAt_Click" />
                <asp:Button ID="Appraisal" class="btn btn-primary" runat="server" Text="Appraisals"  OnClick="appraisals_Click" />
                
                <br />
                <asp:GridView ID="formsGridView" runat="server" class="table table-bordered" EmptyDataText="No Record" OnRowDataBound = "OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField ="Id" HeaderText="ID" InsertVisible="false" Visible ="false"/>
                        <asp:BoundField DataField =" " HeaderText=" " />
                        <asp:BoundField DataField =" " HeaderText=" " />
                        <asp:BoundField DataField ="" HeaderText="" />
                    </Columns>
                                </asp:GridView>
                </div>
                <div class="row ">
                    <div class="col-12 text-center pr-5 pl-5 pt-3 pb-3">
                         <asp:Button ID="addForm" class="btn btn-primary" runat="server" Visible="true" Text="Add Form" OnClick="addForm_Click" />
                        <asp:Button ID="addMoveForm" class="btn btn-primary" runat="server" Visible="false" Text="Add Move Form" OnClick="addMoveForm_Click" />
                        <asp:Button ID="addAuctionForm" class="btn btn-primary" runat="server" Visible="false" Text="Add Auction Form" OnClick="addAuctionForm_Click" />
                    
                    </div>

                </div>
            <iframe ID="formFrame" visible="false" runat="server" height="2000" width="2000" title="Iframe Example" ></iframe>
            </div>
        </div>
        <button class="btn open-button" id="openBtn">Notes</button>

        <div class="form-popup" id="myForm">
            <form action="/action_page.php" class="form-container">
                <h2>Notes</h2>
                <div class="text-center">
                   <%-- <asp:TextBox ID="notesTA" runat="server" placeholder="Type notes here..." class="p-2" rows="10"
                        cols="55" AutoPostBack="true"></asp:TextBox>
                   <asp:TextBox ID="TextBox1" runat="server" placeholder="Type notes here..." class="p-2" rows="10"
                        cols="55"></asp:TextBox>--%>
                    <textarea class="p-2" id="notesTA" runat="server" type="text" placeholder="Type notes here..." name="email" rows="10"
                        cols="55" AutoPostBack="true"></textarea>
                </div>
                <button type="button" id="closeBtn" class="btn cancel">Close</button>
                <asp:Button ID="saveBtn" runat="server" Text="Save" class="btn cancel" OnClick="notesSave_Click" OnClientClick="return saveNotes();"/>
                
            </form>
        </div>

        <script>

            var popUp = document.getElementById('myForm');

            var openBtn = document.getElementById('openBtn');

            var closeBtn = document.getElementById('closeBtn');


            openBtn.onclick = function (event) {
                event.preventDefault();
                popUp.style.display = "block";
            }

            closeBtn.onclick = function (event) {
                popUp.style.display = "none";
            }
        </script>
    </div>
</body>

</html>
</asp:Content>
