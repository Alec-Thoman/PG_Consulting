<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AuctionLookAt.aspx.cs" Inherits="Lab2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="title" runat="server" Text="Auction Look At Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="customerSelectLabel" runat="server" Text="Select Customer:"></asp:Label>
    <asp:DropDownList ID="customerddl" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="fileUploadLabel" runat="server" Text="Upload Inventory Form & Photos Below!" Font-Bold="true"></asp:Label>
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <br />
    <asp:Button ID="fileUploadbtn" runat="server" Text="Upload File" OnClick="fileUploadbtn_Click" CausesValidation="false"/>
    <br />
    <asp:Label ID="fileStatus" runat="server" Text="" Font-Bold="true"></asp:Label>
    <br />
    <br />
    <asp:Label ID="TruckAccesslbl" runat="server" Text="Truck Accessibility:"></asp:Label>
    <asp:TextBox ID="truckAccesstb" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="supNeedlbl" runat="server" Text="Supplies Needed:"></asp:Label>
    <asp:TextBox ID="supNeedtb" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="boxTypelbl" runat="server" Text="Boxes (Select & Enter Quantity)" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
   <%-- <asp:CheckBoxList ID="CheckBoxList1" runat="server">
        <asp:ListItem Text="Small"></asp:ListItem>
        <asp:ListItem Text="Medium"></asp:ListItem>
        <asp:ListItem Text="Large"></asp:ListItem>
        <asp:ListItem Text="Art"></asp:ListItem>
        <asp:ListItem Text="Small Pads"></asp:ListItem>
        <asp:ListItem Text="Large Pads"></asp:ListItem>
    </asp:CheckBoxList>--%>
    <asp:CheckBox ID="smallBox" runat="server" Text="Small"/>
    <asp:TextBox ID="smallTB" runat="server" Height="10px" Width="20px" ></asp:TextBox>
    <br />
    <asp:CheckBox ID="mediumBox" runat="server" Text="Medium"/>
    <asp:TextBox ID="mediumTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="largeBox" runat="server" Text="Large"/>
    <asp:TextBox ID="largeTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="artBox" runat="server" Text="Art"/>
    <asp:TextBox ID="artTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="smallPads" runat="server" Text="Small Pads"/>
    <asp:TextBox ID="spTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="largePads" runat="server" Text="Large Pads" />
    <asp:TextBox ID="lpTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="empTitle" runat="server" Text="Crew" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:CheckBoxList ID="employeeList" runat="server"></asp:CheckBoxList>
    <br />
    <br />
    <asp:Label ID="trucklbl" runat="server" Text="Trucks (Select & Enter Quantity)" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:CheckBox ID="check2015" runat="server" Text="2015" />
    <asp:TextBox ID="tb2015" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="check2011" runat="server" Text="2011" />
    <asp:TextBox ID="tb2011" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="cubecheck" runat="server" Text="Cube" />
    <asp:TextBox ID="cubetb" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="etcheck" runat="server" Text="Enclosed Trailer" />
    <asp:TextBox ID="ettb" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="otcheck" runat="server" Text="Open Trailer" />
    <asp:TextBox ID="ottb" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:CheckBox ID="vancheck" runat="server" Text="Van" />
    <asp:TextBox ID="vantb" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="HomePage" runat="server" Text="Return to Home Page" OnClick="HomePage_Click"/>
    <asp:Button ID="logoutButton" runat="server" Text="Log Out" OnClick="logoutButton_Click"/>
    <asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click"/>
</asp:Content>
