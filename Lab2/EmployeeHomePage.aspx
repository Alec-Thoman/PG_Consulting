<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmployeeHomePage.aspx.cs" Inherits="Lab2.LoginAwareHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
     <asp:Label ID="lblUserLoggedIn" runat="server" Text=""></asp:Label>
            <br />
            <fieldset>
                <legend>Select the page You want to Visit </legend>
                 <asp:Table ID="Table1" runat="server">
             <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="lblHeaderMessage" runat="server" Text="Select the page You want to view" Font-Bold="true" Font-Size="Larger"></asp:Label>
                        <br />
             </asp:TableCell>
             </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblInitialContact" runat="server" Text=" View the Initial Contact Page:" ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="BtnInitialContact" runat="server" Text="Add Initial Information" Onclick="btnInitialContact_Click"/>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceEvent" runat="server" Text=" View the ServiceEvent Page:" ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="serviceEvent" runat="server" Text="Create And View the Service Event" Onclick="serviceEvent_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblWorkflow" runat="server" Text="View the workflow Page: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="workflow" runat="server" Text="Check Create and Update the workflow" Onclick="workflow_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                      <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmployee" runat="server" Text="View Employee Page: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="employee" runat="server" Text="View Employee Information" OnClick="employee_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblInventory" runat="server" Text="View Inventory Page:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="invenory" runat="server" Text="View Inventory Information" OnClick="invenory_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                      <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="ViewCustomer" runat="server" Text="Enter Customers Name: "></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnDetails" runat="server" Text="View details" Onclick="btnDetails_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                       <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="lbl" runat="server" Text="Populate" Onclick="lbl_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </fieldset>
              <asp:Table ID="Table2" runat="server">
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblNotification" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:Button ID="Remove" runat="server" Text="Remove"  OnClick="Remove_Click" Visible="false"/>
                    </asp:TableCell>
                </asp:TableRow>
              </asp:Table>


            
            <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" />

            
</asp:Content>

