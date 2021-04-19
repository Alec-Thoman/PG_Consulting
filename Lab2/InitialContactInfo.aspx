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
                <asp:Label ID="lblNotes" runat="server" Text="Notes:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="400px" Height="200px"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="TblInitialContact" runat="server" Height="297px" Width="862px">

        
        <%-- Customer Name Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFirstName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtFirstname" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>

            <asp:TableCell>
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
           </asp:TableCell>
           <asp:TableCell>
                <asp:TextBox ID="txtLastName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtLastName" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>



        <%-- Phone Type Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhoneType" runat="server" Text="PhoneType: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlPhoneType" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="Home Phone"></asp:ListItem>
                    <asp:ListItem Text="Mobile Phone"></asp:ListItem>
               </asp:DropDownList>
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

        <%-- Preferred Contact Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPreferredContact" runat="server" Text="Preferred Contact: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlPreferredContact" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="By Home Phone"></asp:ListItem>
                    <asp:ListItem Text="By Mobile Phone"></asp:ListItem>
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

        <%-- Deadline Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDeadline" runat="server" Text="Deadline: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvDeadline" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtDeadline" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
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
                <%--<asp:DropDownList ID="ddlServiceRequest" runat="server">
                    <asp:ListItem Text="-Select-" Selected="True" Value="default"></asp:ListItem>
                    <asp:ListItem Text="Moving"></asp:ListItem>
                    <asp:ListItem Text="Auction"></asp:ListItem>
                </asp:DropDownList>--%>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                            <asp:ListItem> Auction </asp:ListItem>
                            <asp:ListItem> Move </asp:ListItem>
                            <asp:ListItem> Appraisal </asp:ListItem>
                </asp:CheckBoxList>
            </asp:TableCell>
        </asp:TableRow>

        <%-- Customer Address Row --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStreet" runat="server" Text="Street:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStreet" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtStreet" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell> 
        <asp:TableCell>
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCity" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvCity" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtCity" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell> 
        </asp:TableRow>


        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtState" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvState" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtState" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell> 
             <asp:TableCell>
                <asp:Label ID="lblZipcode" runat="server" Text="Zipcode:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtZipcode" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvZipcode" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="txtZipcode" ForeColor="Red" Display="Dynamic" EnableClientScript="false" Text="Field Required">
                </asp:RequiredFieldValidator>
            </asp:TableCell> 
        </asp:TableRow>

        <%-- Submit Info Button --%>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="Back" runat="server" Text="Back to Navigate Page" Onclick="Back_Click"/>
                <asp:Button ID="popButton" runat="server" Text="Populate" OnClick="popButton_Click"/>
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
</asp:Content>

