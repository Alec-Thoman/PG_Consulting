<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InitialContactInfo.aspx.cs" Inherits="Lab2.InitialContactInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="TblInitialContact" runat="server" Height="297px" Width="629px">

        <%--Create Header For Form--%>
        <asp:TableHeaderRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Label ID="lblTitle" runat="server" Text="Initial Contact Form: "></asp:Label>
            </asp:TableCell>
        </asp:TableHeaderRow>

        <%--Notes Section--%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNotes" runat="server" Text="Notes:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Customer Name Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
                <asp:TextBox ID="txtFirstName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtFirstName" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>

            <asp:TableCell>
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
                <asp:TextBox ID="txtLastName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Customer Address Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvAddress" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtAddress" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Phone Number Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhone" runat="server" Text="Phone Number: "></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvPhone" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtPhone" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Email Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvEmail" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Initial Contact Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInitialContact" runat="server" Text="How to Contact Us Initially: "></asp:Label>
   
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="In Person"></asp:ListItem>
                    <asp:ListItem Text="By Phone"></asp:ListItem>
                    <asp:ListItem Text="Email"></asp:ListItem>
                    <asp:ListItem Text="Text"></asp:ListItem>
                    <asp:ListItem Text="Other"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

         <%-- Initial Date Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInitialDate" runat="server" Text="Initial Contact Date: "></asp:Label>
                <asp:TextBox ID="txtInitialDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvInitialDate" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtInitialDate" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

         <%-- Service Request Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServiceRequest" runat="server" Text="Requested Service:  "></asp:Label>
   
                <asp:DropDownList ID="ddlServiceRequest" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
</asp:Content>

