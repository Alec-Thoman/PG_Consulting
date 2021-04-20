<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewestEmployeeHomePage.aspx.cs" Inherits="Lab2.NewestEmployeeHomePage" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

    <html>

    <head>
        <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/styles.css">
        <link rel="stylesheet" href="../css/custom-styles.css">
        <link rel="stylesheet" href="../css/customer-styles.css">
        <script src="https://kit.fontawesome.com/80d9cd143b.js" crossorigin="anonymous"></script>
        <style>
            .cust-button {
                border-color: #095951 !important;
                color: #fff !important;
                background-color: #095951 !important;
            }

            .cust-dropdown {
                border-color: #095951 !important;
                color: #095951 !important;
            }
        </style>
    </head>

    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-white pr-5 pl-5" id="mainNav">
            <div class="navbar-header">
                <a class="navbar-brand js-scroll-trigger text-black" href="NewestEmployeeHomePage.aspx">
                    <div class="logo">
                        <img src="img/Logos/GVALogo_Green_resized.png"
                            alt="Green Valley Auctions Logo" width="200" height="100">
                    </div>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item "><a class="nav-link text-black" href="InitialContactInfo.aspx">New Customer</a></li>
                    <li class="nav-item "><a class="nav-link text-black" href="ReportLandingPage.aspx">Reports</a></li>
                    <li class="nav-item"><a class="nav-link text-black"
                        href="EmployeeProfile.aspx">Profile</a></li>
                    <li class="nav-item"><a class="nav-link text-black" href="EmployeeLoginPageBStrap.aspx">Logout</a></li>
                </ul>
            </div>
        </nav>

        <div class="container pt-lg-4">
            <div class="row pb-md-4">
                <div class="col-6 bg-white border shadow-sm p-4" style="height: 400px; overflow: auto">
                    <h2 class="pb-3">Customer Statuses</h2>
                    <asp:GridView ID="statusGridView" runat="server" class="table table-bordered" EmptyDataText="No Record" OnRowDataBound="StatusRowDataBound" OnSelectedIndexChanged="StatusSelectedIndexChanged">
                    </asp:GridView>
                </div>
                <div class="col-5 ml-auto bg-white border shadow-sm p-4">
                    <h2 class="pb-3">Search Customer</h2>
                    <div class="pr-5 pl-5 pb-3 text-center">
                        <div class="input-group">
                            <asp:TextBox ID="txtCustomerSearch" runat="server" class="form-control rounded mr-3 mt-2" AutoPostBack="true" placeholder="Last Name" Visible="true" aria-label="Search" aria-describedby="search-addon"></asp:TextBox>
                            <%--<input type="search" class="form-control rounded mr-3 mt-2" placeholder="Search"
                            aria-label="Search" aria-describedby="search-addon" />--%>
                            <asp:Button ID="custSearchBtn" class="btn border shadow-none p-sm-3 cust-button" runat="server" Text="Search" OnClick="customerSearch_Click" />
                            <%--<button type="button" class="btn border shadow-none p-sm-3 cust-button" onclick="customerSearch_Click">Search</button>--%>
                        </div>
                    </div>
                    <div class="border p-4 text-center">
                        <asp:GridView ID="customerGridView" runat="server" class="table table-bordered" EmptyDataText="No Record" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged">
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="row pb-md-4">
                <div class="col-12 bg-white border shadow-sm p-4">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="pb-3">Search Records</h2>
                        </div>
                    </div>
                    <div class="row pb-3">
                        <div class="col-4">
                            <asp:DropDownList ID="searchRecordList" AutoPostBack="True"
                                OnSelectedIndexChanged="Selection_Change"
                                runat="server" class="btn border dropdown-toggle p-3 cust-dropdown" aria-haspopup="true" aria-expanded="false">
                                <asp:ListItem Selected="True" Value="ActiveCustomers">Active Customers</asp:ListItem>
                                <asp:ListItem Value="NewCustomers"> New Customers </asp:ListItem>
                                <asp:ListItem Value="DateofService"> Date Of Service </asp:ListItem>
                                <asp:ListItem Value="Storage"> Storage </asp:ListItem>
                            </asp:DropDownList>
                            <div class="input-group">
                                <asp:TextBox ID="txtDate" runat="server" class="form-control rounded mr-3 mt-2" AutoPostBack="true" placeholder="Date" Visible="true" aria-label="Search" aria-describedby="search-addon"></asp:TextBox>

                              
                            </div>
                        </div>
                        <div class="col-4">

                            <div class="dropdown show pb-3">

                                <div class="row">
                                    <div class="col-12">
                                        <asp:DropDownList ID="cityLists" runat="server" Visible="true" DataSourceID="cityList" DataTextField="City" DataValueField="City" class="btn border dropdown-toggle p-3 cust-dropdown" aria-haspopup="true" aria-expanded="false"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <asp:DropDownList ID="storageLists" runat="server" Visible="false" DataSourceID="storageList" DataTextField="Location" DataValueField="Location" class="btn border dropdown-toggle p-3 cust-dropdown" aria-haspopup="true" aria-expanded="false"></asp:DropDownList>
                                    </div>
                                </div>
                             <asp:Button ID="searchBtn" class="btn border shadow-none p-sm-3 cust-button " runat="server" Text="Search" OnClick="searchClick" />

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:GridView ID="recordsGridView" runat="server" class="table table-bordered" EmptyDataText="No Record" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged">
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
    <asp:SqlDataSource runat="server" ID="storageList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="SELECT Location FROM Storage" />
    <asp:SqlDataSource runat="server" ID="cityList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="SELECT DISTINCT City FROM InitialInfo" />
</asp:Content>
