<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AuctionOrder.aspx.cs" Inherits="Lab2.AuctionOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="servInfolbl" runat="server" Text="Service Info" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <asp:Label ID="servDatelbl" runat="server" Text="Date: "></asp:Label>
    <asp:TextBox ID="servDatetb" runat="server"></asp:TextBox>
    <asp:Label ID="servTimelbl" runat="server" Text="Time: "></asp:Label>
    <asp:TextBox ID="servTimetb" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="contactInfolbl" runat="server" Text="Basic Contact Info" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <asp:Label ID="fnlbl" runat="server" Text="First Name: "></asp:Label>
    <asp:TextBox ID="fnTB" runat="server"></asp:TextBox>
    <asp:Label ID="lnlbl" runat="server" Text="Last Name: "></asp:Label>
    <asp:TextBox ID="lnTB" runat="server"></asp:TextBox>
    <asp:Label ID="homePhonelbl" runat="server" Text="Home Phone: "></asp:Label>
    <asp:TextBox ID="homePhoneTB" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="mobilePhonelbl" runat="server" Text="Mobile Phone: "></asp:Label>
    <asp:TextBox ID="mobilePhoneTB" runat="server"></asp:TextBox>
    <asp:Label ID="curAddresslbl" runat="server" Text="Current Address: "></asp:Label>
    <asp:TextBox ID="curAddressTB" runat="server"></asp:TextBox>
    <asp:Label ID="pickupAddresslbl" runat="server" Text="Pickup Address: "></asp:Label>
    <asp:TextBox ID="pickupAddressTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="packServiceOrderlbl" runat="server" Text="Packing Service Order" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="trashRemovallbl" runat="server" Text="Trash Removal Service Order" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />

</asp:Content>
