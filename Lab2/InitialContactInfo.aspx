<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InitialContactInfo.aspx.cs" Inherits="Lab2.InitialContactInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="TblNotes" runat="server" Height="297px" Width="629px">
 <asp:TableHeaderRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                <asp:Label ID="Label1" runat="server" Text="Initial Contact Form: "></asp:Label>
            </asp:TableCell>
        </asp:TableHeaderRow>

        <%--Notes Section--%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="Label2" runat="server" Text="Notes:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="400px" Height="200px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="TblInitialContact" runat="server" Height="297px" Width="629px">

        
        <%-- Customer Name Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCustomerName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtCustomerName" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>

            <%--<asp:TableCell>
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
                <asp:TextBox ID="txtLastName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>--%>
        </asp:TableRow>

        <%-- Customer Address Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
            <asp:TableCell>
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
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInitialDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvInitialDate" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtInitialDate" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        
         <%-- Hear about Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHearAbout" runat="server" Text="Hear about us: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtHearAbout" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtHearAbout" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>

         <%-- Service Request Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServiceRequest" runat="server" Text="Requested Service:  "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlServiceRequest" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Submit Info Button --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
</asp:Content>

