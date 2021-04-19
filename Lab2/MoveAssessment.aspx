<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveAssessment.aspx.cs" Inherits="Lab2.MoveAssessment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="title" runat="server" Text="Move Asessment Form" Font-Bold="true" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Contact Info" Font-Bold="true" Font-Size="Large"></asp:Label>
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
            <asp:Label ID="Label10" runat="server" Text="Preliminary Assessment" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Table ID="Table2" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label11" runat="server" Text="Move out by (Date):"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label12" runat="server" Text="Moving Window (Days):"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label13" runat="server" Text="Moving to Address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label14" runat="server" Text="City:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label15" runat="server" Text="State:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label17" runat="server" Text="Zip:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label16" runat="server" Text="MLS listing?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label18" runat="server" Text="Ability to send Photos:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                            <asp:ListItem Value="No" Text="No"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label19" runat="server" Text="Add-On Services:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label20" runat="server" Text="Packing"></asp:Label>
                        <asp:CheckBox ID="CheckBox2" runat="server" />
                    </asp:TableCell>                    
                    <asp:TableCell>
                        <asp:Label ID="Label21" runat="server" Text="Trash Removal / Donation Hauling"></asp:Label>
                        <asp:CheckBox ID="CheckBox3" runat="server" />
                    </asp:TableCell>                   
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label22" runat="server" Text="Request Auction Services?"></asp:Label>
                        <asp:CheckBox ID="CheckBox4" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <asp:Label ID="Label23" runat="server" Text="Move Assessment" Font-Bold="true" Font-Size="Large"></asp:Label>
            <br />
            <asp:Label ID="Label24" runat="server" Text="Rooms:" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:Table ID="Table3" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label25" runat="server" Text="Living Room:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label26" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label27" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label28" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox16" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label29" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox17" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label30" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox18" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label31" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox19" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label32" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox20" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label33" runat="server" Text="Dining Room:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label34" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label35" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label36" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox22" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label37" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox23" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label38" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox24" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label39" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox25" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label40" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox26" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label41" runat="server" Text="Kitchen:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label42" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label43" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label44" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox28" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label45" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox29" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label46" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox30" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label47" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox31" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label48" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox32" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label49" runat="server" Text="Den:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label50" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList5" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label51" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label52" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox34" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label53" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox35" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label54" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox36" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label55" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox37" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label56" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox38" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label57" runat="server" Text="Office:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label58" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox39" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList6" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label59" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label60" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox40" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label61" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox41" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label62" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox42" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label63" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox43" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label64" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox44" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label65" runat="server" Text="Bedrooms:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label66" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox45" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList7" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label67" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label68" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox46" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label69" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox47" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label70" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox48" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label71" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox49" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label72" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox50" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label73" runat="server" Text="Attic:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label74" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox51" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList8" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label75" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label76" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox52" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label77" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox53" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label78" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox54" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label79" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox55" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label80" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox56" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label81" runat="server" Text="Basement:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label82" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox57" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList9" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label83" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label84" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox58" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label85" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox59" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label86" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox60" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label87" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox61" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label88" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox62" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label89" runat="server" Text="Garage:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label90" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox63" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList10" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label91" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label92" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox64" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label93" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox65" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label94" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox66" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label95" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox67" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label96" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox68" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label97" runat="server" Text="Patio/Porch:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label98" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox69" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList11" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label99" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label100" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox70" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label101" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox71" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label102" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox72" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label103" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox73" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label104" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox74" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label105" runat="server" Text="Out Buildings:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label106" runat="server" Text="Furniture:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox75" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownList12" runat="server">
                            <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
                            <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
                            <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
                            <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label107" runat="server" Text="Boxes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label108" runat="server" Text="Small"></asp:Label>
                        <asp:TextBox ID="TextBox76" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label109" runat="server" Text="Medium"></asp:Label>
                        <asp:TextBox ID="TextBox77" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label110" runat="server" Text="Large"></asp:Label>
                        <asp:TextBox ID="TextBox78" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label111" runat="server" Text="Wardrobe"></asp:Label>
                        <asp:TextBox ID="TextBox79" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label112" runat="server" Text="Art"></asp:Label>
                        <asp:TextBox ID="TextBox80" runat="server" Height="10px" Width="20px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <asp:Label ID="Label113" runat="server" Text="Other Information" Font-Bold="true" Font-Size="Large"></asp:Label>
            <asp:Table ID="Table4" runat="server">
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
            <asp:Label ID="Label127" runat="server" Text="Costs:" Font-Bold="true" Font-Size="Medium"></asp:Label>
            <asp:Table ID="Table6" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label128" runat="server" Text="Move Estimate:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox87" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label129" runat="server" Text="Fixed Rate:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox88" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label130" runat="server" Text="Packing Fees:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox89" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label131" runat="server" Text="Storage Fees:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox90" runat="server"></asp:TextBox>
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
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click"/>
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
