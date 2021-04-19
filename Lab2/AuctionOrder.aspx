<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuctionOrder.aspx.cs" Inherits="Lab2.AuctionOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:Label ID="servInfolbl" runat="server" Text="Auction Service Order" Font-Bold="true" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Service Info" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:Label ID="servDatelbl" runat="server" Text="Date: "></asp:Label>
    <asp:TextBox ID="servDatetb" runat="server"></asp:TextBox>
    <asp:Label ID="servTimelbl" runat="server" Text="Time: "></asp:Label>
    <asp:TextBox ID="servTimetb" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="contactInfolbl" runat="server" Text="Customer Info" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
            <asp:Table runat="server" Height="19px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="grdCustomer" runat="server"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
    <br />
    <br />
    <br />
    
   
    <asp:Label ID="trashRemovallbl" runat="server" Text="Trash Removal Service Order" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:Label ID="dumpsterlbl" runat="server" Text="Need Dumpster?"></asp:Label>
    <asp:CheckBox ID="dumpsterchkbx" runat="server" />
    <br />
    <asp:Label ID="dumpsterAdd" runat="server" Text="Address:"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="current" Text="Current"></asp:ListItem>
        <asp:ListItem Value="pickUp" Text="Pick Up"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Label ID="dumpAddlbl" runat="server" Text="Address:"></asp:Label>
    <asp:TextBox ID="dumbAddTB" runat="server"></asp:TextBox>
    <asp:Label ID="dumpCitylbl" runat="server" Text="City:"></asp:Label>
    <asp:TextBox ID="dumpCityTB" runat="server"></asp:TextBox>
    <asp:Label ID="dumpStatelbl" runat="server" Text="State:"></asp:Label>
    <asp:TextBox ID="dumpStateTB" runat="server"></asp:TextBox>
    <asp:Label ID="dumpZiplbl" runat="server" Text="Zip:"></asp:Label>
    <asp:TextBox ID="dumpZipTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="noMenlbl" runat="server" Text="No. of Men:"></asp:Label>
    <asp:TextBox ID="noMenTB" runat="server" Width="30px"></asp:TextBox>
    <br />
    <asp:Label ID="chargeAmountlbl" runat="server" Text="Charge Amount:"></asp:Label>
    <asp:TextBox ID="chargeAmountTB" runat="server" Width="75px"></asp:TextBox>
    <br />
    <asp:Label ID="scheduledlbl" runat="server" Text="Scheduled for:"></asp:Label>
    <asp:TextBox ID="scheduledTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="trashDesclbl" runat="server" Text="Trash Decription:"></asp:Label>
    <asp:TextBox ID="trashDescTB" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
     <asp:Label ID="pickUpservicelbl" runat="server" Text="Pick Up Service Order" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="pickUpCrewlbl" runat="server" Text="Crew Assigned:"></asp:Label>
    <asp:TextBox ID="pickUpCrewTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="inventoryLinklbl" runat="server" Text="Link to Inventory from Assessment Form:"></asp:Label>
    <asp:TextBox ID="inventoryLinkTB" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="assessmentInfolbl" runat="server" Text="Assessment Information" Font-Bold="true" Font-Size="medium"></asp:Label>
    <br />
    <asp:Label ID="homeTypelbl" runat="server" Text="Home Type:"></asp:Label>
    <asp:TextBox ID="homeTypeTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="truckAccesslbl" runat="server" Text="Truck Accessibilty:"></asp:Label>
    <asp:TextBox ID="truckAccessTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="walklbl" runat="server" Text="Distance to loading door:"></asp:Label>
    <asp:TextBox ID="walkTB" runat="server" Width="30px"></asp:TextBox>
    <br />
    <asp:Label ID="stepslbl" runat="server" Text="Steps up to house:"></asp:Label>
    <asp:TextBox ID="stepsTB" runat="server" Width="30px"></asp:TextBox>
    <br />
    <asp:Label ID="specEquiplbl" runat="server" Text="Special Equipment:"></asp:Label>
    <asp:TextBox ID="specEquipTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="truckslbl" runat="server" Text="Trucks Taken:"></asp:Label>
    <asp:TextBox ID="trucksTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="estCostlbl" runat="server" Text="Estimated Costs:"></asp:Label>
    <asp:TextBox ID="estCostTB" runat="server" Width="75px"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="storagelbl" runat="server" Text="Assign Storage:" Font-Bold="true" Font-Size="medium"></asp:Label>
    <asp:TextBox ID="storageTB" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="setDatelbl" runat="server" Text="Auction Set Date:" Font-Bold="true" Font-Size="medium"></asp:Label>
    <asp:TextBox ID="setDateTB" runat="server"></asp:TextBox>



        </div>
    </form>
</body>
</html>
