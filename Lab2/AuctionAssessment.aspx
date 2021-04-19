<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuctionAssessment.aspx.cs" Inherits="Lab2.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="title" runat="server" Text="Auction Assessment Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            
            <asp:Table ID="Table1" runat="server" Height="52px" Width="147px">
                <asp:TableRow>
                    <asp:TableCell>
                        <%--<asp:Label ID="customerSelectLabel" runat="server" Text="Select Customer:"></asp:Label>
                        <asp:DropDownList ID="customerddl" runat="server" OnSelectedIndexChanged="customerddl_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>--%>
                    </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="grdCustomer" runat="server"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Auction Assessment" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Table ID="Table3" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label12" runat="server" Text="What do you have to sell:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label13" runat="server" Text="Why are you considering auction services?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="Estate" Text="Settling an Estate"></asp:ListItem>
                            <asp:ListItem Value="Moving" Text="Moving/Need to downsize"></asp:ListItem>
                            <asp:ListItem Value="Stuff" Text="Getting rid of stuff"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="Deadline (if required):"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <br />            
            <asp:Table ID="Table4" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label15" runat="server" Text="What needs to be scheduled:"></asp:Label>
                    </asp:TableCell>                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label16" runat="server" Text="Bring In"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                        <asp:Label ID="Label17" runat="server" Text="Auction Walk-Through"></asp:Label>                  
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="Customer Requests Auction Look At" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Green Valley Requests Auction Look At" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox3" runat="server" />
                        <asp:Label ID="Label18" runat="server" Text="Pick Up"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox4" runat="server" />
                        <asp:Label ID="Label19" runat="server" Text="Trash/Donation"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label20" runat="server" Text="Description:"></asp:Label>
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <br />            
            <asp:Table ID="Table7" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox9" runat="server" />
                        <asp:Label ID="Label21" runat="server" Text="Asked for Photos"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox10" runat="server" />
                        <asp:Label ID="Label22" runat="server" Text="Asked for Item List"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                 <br />
            <asp:Label ID="Label23" runat="server" Text="Need additional services:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="Move" Text="Move"></asp:ListItem>
                <asp:ListItem Value="Appraisal" Text="Appraisal"></asp:ListItem>
                <asp:ListItem Value="Trash" Text="Trash/Donation"></asp:ListItem>                 
            </asp:DropDownList> 
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Other Information" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label114" runat="server" Text="Type of Home:"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox6" runat="server"/>
                        <asp:Label ID="Label115" runat="server" Text="Apartment"></asp:Label>                       
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label116" runat="server" Text="Floor:"></asp:Label>
                        <asp:TextBox ID="TextBox81" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label117" runat="server" Text="Elevator?"></asp:Label>
                        <asp:DropDownList ID="DropDownList13" runat="server">
                            <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                            <asp:ListItem Value="No" Text="No"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label118" runat="server" Text="Distance From Elevator to Apt:"></asp:Label>
                        <asp:TextBox ID="TextBox82" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox5" runat="server"/>
                        <asp:Label ID="Label119" runat="server" Text="House"></asp:Label>                       
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox7" runat="server"/>
                        <asp:Label ID="Label120" runat="server" Text="Storage Unit"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList14" runat="server">
                            <asp:ListItem Value="Indoor" Text="Indoor/Climate Controlled"></asp:ListItem>
                            <asp:ListItem Value="Outdoor" Text="Outdoor Self Storage"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                    <asp:CheckBox ID="CheckBox8" runat="server"/>
                        <asp:Label ID="Label121" runat="server" Text="Place of Business:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox83" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Table ID="Table5" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label122" runat="server" Text="Truck Accessibilty:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox84" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label123" runat="server" Text="Distance to Loading Door:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox85" runat="server" Height="10px" Width="30px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label124" runat="server" Text="Steps up to house:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox86" runat="server" Height="10px" Width="30px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <asp:Label ID="Label125" runat="server" Text="Special Equipment:"></asp:Label>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem Value="Appliance Cart" Text="Appliance Cart"></asp:ListItem>
                <asp:ListItem Value="Dolly" Text="Piano Dolly"></asp:ListItem>
                <asp:ListItem Value="Board" Text="Piano Board"></asp:ListItem>
                <asp:ListItem Value="Safe" Text="Gun Safe Cart"></asp:ListItem>
                <asp:ListItem Value="Blankets" Text="Extra Blankets"></asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="Label126" runat="server" Text="Trucks:"></asp:Label>
            <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                <asp:ListItem Value="2015" Text="2015"></asp:ListItem>
                <asp:ListItem Value="2011" Text="2011"></asp:ListItem>
                <asp:ListItem Value="Cube" Text="Cube"></asp:ListItem>
                <asp:ListItem Value="Enclosed Trailer" Text="Enclosed Trailer"></asp:ListItem>
                <asp:ListItem Value="Open Trailer" Text="Open Trailer"></asp:ListItem>
                <asp:ListItem Value="Van" Text="Van"></asp:ListItem>
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="Label24" runat="server" Text="Boxes and Quantity:"></asp:Label>
            <br />
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
            <asp:Label ID="Label127" runat="server" Text="Costs:" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:Table ID="Table6" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label128" runat="server" Text="Pick Up Fee:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox87" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label129" runat="server" Text="Consignment Rate:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox88" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label132" runat="server" Text="Trash Removal:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox91" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label25" runat="server" Text="Additional Fees:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnPopulateAuctionA" runat="server" Text="Populate" OnClick="btnPopulateAuctionA_Click" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Onclick="btnSubmit_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>            

        </div>
    </form>
</body>
</html>
