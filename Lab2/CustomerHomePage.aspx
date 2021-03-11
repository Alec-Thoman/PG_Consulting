<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerHomePage.aspx.cs" Inherits="Lab2.CustomerHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
     <asp:Label ID="lblUserLoggedIn" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <fieldset>
                <legend>Select The Page You Want To Visit </legend>
                 <asp:Table ID="Table1" runat="server">
             <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <br />
                        <asp:Label ID="lblHeaderMessage" runat="server" Text="Choose What You Want To View" Font-Bold="true" Font-Size="Larger"></asp:Label>
                        <br />
                    </asp:TableCell>
             </asp:TableRow>

             <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="uploadFilePage" runat="server" Text="Upload A File" OnClick="uploadFilePage_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnInformation" runat="server" Text="View the Account Information"  Onclick="btnInformation_Click" CausesValidation="False"/>
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:GridView ID="grdCustomer" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                    </asp:TableCell>
             </asp:TableRow>
              <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnPastEvent" runat="server" Text="View the Past Event      "  Onclick="btnPastEvent_Click" CausesValidation="False"/>
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:GridView ID="grdEvent" runat="server" AlternatingRowStyle-BackColor="#ccffff" EmptyDataText="No Record">
                </asp:GridView>
                    </asp:TableCell>
             </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblRequest" runat="server" Text="Request New Event:" ></asp:Label>
                    </asp:TableCell>       
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblName" runat="server" Text="Full Name:" ></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtName" runat="server" Text=""></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="txtName" Text="Field Cannot Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                     <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblType" runat="server" Text="ServiceType: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ServiceList" runat="server"
                    DataSourceID="dtasrcServiceList" DataTextField="ServiceType" DataValueField="ServiceID" AutoPostBack="true" ></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                     <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDate" runat="server" Text="Event Date: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDate" runat="server" Text=""></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="txtDate" Text="Field Cannot Be Blank" ForeColor="Red" EnableClientScript="false"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                      <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnpopulate" runat="server" Text="Populate"  Onclick="btnpopulate_Click" CausesValidation="False"/>
                    </asp:TableCell>
                </asp:TableRow>

       
                      <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnClear" runat="server" Text="Clear"  Onclick="btnClear_Click" CausesValidation="False"/>
                    </asp:TableCell>
                </asp:TableRow>

                    
                      <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSubmit" runat="server" Text="Request"  Onclick="btnSubmit_Click" />
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:Label ID="Details" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>



                      

                        
                </asp:Table>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </fieldset>
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click"  CausesValidation="False"/>

        <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName desc"/>
        <asp:SqlDataSource runat="server" ID="dtasrcServiceList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select ServiceID, ServiceType from Service"/>
        <asp:SqlDataSource runat="server" ID="dtasrcEmployeeList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select EmployeeID, EmployeeName from Employee"/>
</asp:Content>
