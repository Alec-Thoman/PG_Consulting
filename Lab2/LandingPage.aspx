<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Lab2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Green Valley Auctions</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/custom-styles.css">
</head>
<body>
    <header>
        <img class="main-logo" src="image/GVALogo_Green.png"
            alt="Green Valley Auctions Logo">
    </header>
    <div class="row">
        <form id="form_login" runat="server">
            <div class="container-fluid">
                <br />
                <br />
                <div class="row">
                    <aside class="col-md-5.5 mx-auto">
                        <div class="card shadow border-0">
                            <article class="card-body">
                                <%--<a href="employee/employee-login.html" class="btn btn-primary cust">Employee Sign In</a>--%>
                                <asp:Button ID="employeeSignInButton" class="btn btn-primary cust" runat="server" Text="Employee Sign In" OnClick="employeeSignInButton_Click"/>
                                <%--<a href="customer/customer-login.html" class="btn btn-primary cust">Customer Sign In</a>--%>
                                <asp:Button ID="customerSignInButton" class="btn btn-primary cust" runat="server" Text="Customer Sign In" OnClick="customerSignInButton_Click" />
                                <%--<a href="" class="btn btn-primary cust">Sign Up</a>--%>
                                <%--<asp:Button ID="signupButton" runat="server" Text="Sign Up" class="btn btn-primary cust" OnClick="signupButton_Click"/>--%>
                            </article>
                        </div>
                    </aside>
                </div>
            </div>
        </form>
    </div>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
