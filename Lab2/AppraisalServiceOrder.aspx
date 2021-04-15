<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AppraisalServiceOrder.aspx.cs" Inherits="Lab2.AppraisalServiceOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
<head>
<style>
aside {
  width: 30%;
  padding-left: 15px;
  margin-left: 15px;
  float: right;
  font-style: italic;
  background-color: lightgray;
  border-style: solid;
}
</style>
<script>
</script>
</head>
<body>

<asp:Label ID="titlelbl" runat="server" Text="Appraisal Assessment Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
<br />
<br />
<br />
<asp:Label ID="contactInfolbl" runat="server" Text="Basic Contact Info" Font-Bold="true" Font-Size="X-Large"></asp:Label>

<aside>
<asp:Label ID="Label1" runat="server" Text="CUSTOMER NOTES" Font-Bold="true" Font-Size="Large"></asp:Label>
<p>Name....</p>
<p>Phone Number....</p>
<p>Address....</p>
</aside>
<br />
<br />
<br />
<asp:Label ID="appraisalTitle" runat="server" Text="Appraisal Assessment" Font-Bold="true" Font-Size="X-Large"></asp:Label>
<br />
<br />
<asp:Label ID="purposelbl" runat="server" Text="Purpose of Appraisal: "></asp:Label>
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem>Estate appraisal for tax purposes</asp:ListItem>
    <asp:ListItem>Family division appraisal</asp:ListItem>
</asp:DropDownList>
<br />
<br />
<asp:Label ID="deadlinelbl" runat="server" Text="Deadline: "></asp:Label>
<asp:TextBox ID="deadlineTB" runat="server"></asp:TextBox>
<br />
<br />
<asp:Label ID="sizelbl" runat="server" Text="Size of Appraisal: "></asp:Label>
<asp:TextBox ID="sizeTB" runat="server"></asp:TextBox>
<br />
<br />
<asp:HyperLink ID="HyperLink1" runat="server">Schedule Appraisal Link Here</asp:HyperLink>
<br />
<br />
<br />
<asp:Label ID="fileuploadLbl" runat="server" Text="Upload Photos" Font-Bold="true" Font-Size="Large"></asp:Label>
<br />
<br />
<asp:FileUpload ID="FileUpload1" runat="server" />
<br />
<br />
<asp:Button ID="fileUploadButton" runat="server" Text="Upload" />
<br />
<br />
<br />
<asp:Label ID="invLbl" runat="server" Text="Inventory: "></asp:Label>
<asp:TextBox ID="invTB" runat="server"></asp:TextBox>
<br />
<br />
<br />
<asp:Label ID="addtlServiceslbl" runat="server" Text="Do you need additional services?"></asp:Label>
<asp:RadioButtonList ID="addtlServicesrl" runat="server">
    <asp:ListItem>Yes</asp:ListItem>
    <asp:ListItem>No</asp:ListItem>
</asp:RadioButtonList>
<br />
<br />
<asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click"/>
</body>
</html>
</asp:Content>
