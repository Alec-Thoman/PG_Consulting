<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="Lab2.NewCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Table ID="Table1" runat="server" Height="235px" Width="392px">
                <asp:TableHeaderRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="Label13" runat="server" Text="Please fill out this form: "></asp:Label>
                    </asp:TableCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server" Text="Customer Full Name: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox1" runat="server" Text="" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox1"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Original Address: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox3" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox1"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"> </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>                                      
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label9" runat="server" Text="Phone Number: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox7" runat="server" Text="" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox7"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label10" runat="server" Text="Email: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox8" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox8"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label7" runat="server" Text="UserName: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox5" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox8"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox4" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                            ControlToValidate="TextBox8"  ForeColor="Red"  Display="Dynamic" EnableClientScript="false" Text="Field Required"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>
                         <asp:Label ID="Label4" runat="server" Text="How to Contact Us Initially: "></asp:Label>
                    </asp:TableCell> 
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="In Person"></asp:ListItem>
                            <asp:ListItem Text="By Phone"></asp:ListItem>
                            <asp:ListItem Text="Email"></asp:ListItem>
                            <asp:ListItem Text="Text"></asp:ListItem>
                            <asp:ListItem Text="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>                   
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                         <asp:Label ID="Label2" runat="server" Text="How did you hear about us?"></asp:Label>
                    </asp:TableCell> 
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox2" runat="server" Text="" ></asp:TextBox>
                    </asp:TableCell>                   
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <br />
                           <asp:Button ID="Button2" runat="server" Text="Populate" Onclick="Button2_Click" CausesValidation="False"/>                                         
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <br />
                        <asp:Button ID="Button3" runat="server" Text="Submit" OnClick ="Submit_Click"/> 
                    </asp:TableCell>
                    <asp:TableCell>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text=" Clear " Onclick ="Button1_Click" CausesValidation="False"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="sumbitDetail" runat="server" Text="" ForeColor="Blue"></asp:Label>
                    </asp:TableCell>
                 </asp:TableRow>                
            </asp:Table> 
            <br />
            <asp:Button ID="Back" runat="server" Text="Foward to Customer Login page" Onclick="Back_Click"/>
            <asp:Label ID="Label6" runat="server" Text="Created by Yuhui and Jocab"></asp:Label>
             <asp:SqlDataSource runat="server" ID="dtasrcCustomerList"
        ConnectionString="Server=Localhost;Database=Lab3;Trusted_Connection=Yes;" SelectCommand="Select CustomerID, CustomerName from Customer Order By CustomerName ASC"/>
        
</asp:Content>
