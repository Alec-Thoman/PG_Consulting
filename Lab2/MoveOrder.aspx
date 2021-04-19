<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveOrder.aspx.cs" Inherits="Lab2.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="servInfolbl" runat="server" Text="Move Service Order" Font-Bold="true" Font-Size="X-Large"></asp:Label>
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
     <asp:Table runat="server" Height="50px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="grdCustomer" runat="server"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
    <br />
    <br />
    <br />
    
    <asp:Label ID="trashRemovallbl" runat="server" Text="Trash Removal/Donation Pickup and Delivery Service Order" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:Label ID="dumpsterlbl" runat="server" Text="Need Dumpster?"></asp:Label>
    <asp:CheckBox ID="dumpsterchkbx" runat="server" />
    <br />
    <asp:Label ID="dumpsterAdd" runat="server" Text="Address:"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="current" Text="Current"></asp:ListItem>
        <asp:ListItem Value="moveTo" Text="Moving To"></asp:ListItem>
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
    <br />
    <br />
    <asp:Label ID="moveInfolbl" runat="server" Text="Move Information for Crew" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:Label ID="inventoryLinklbl" runat="server" Text="Link to Inventory from Assessment Form:"></asp:Label>
    <asp:TextBox ID="inventoryLinkTB" runat="server"></asp:TextBox>
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
    <br />
    <asp:Label ID="moveCostlbl" runat="server" Text="Move Cost:" Font-Bold="true" Font-Size="medium"></asp:Label>
    <asp:TextBox ID="moveCostTB" runat="server" Width="75px"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Label ID="preAssesslbl" runat="server" Text="Preliminary Assessment" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <br />
    <asp:Label ID="moveOutlbl" runat="server" Text="Move out by (Date):"></asp:Label>
    <asp:TextBox ID="moveOutTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="moveWindowlbl" runat="server" Text="Moving Window (Days):"></asp:Label>
    <asp:TextBox ID="moveWindowTB" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="mlslbl" runat="server" Text="MLS listing?"></asp:Label>
    <asp:CheckBox ID="mlschkbox" runat="server" />
    <br />
    <asp:Label ID="photoslbl" runat="server" Text="Can send photos?"></asp:Label>
    <asp:CheckBox ID="photoschkbox" runat="server" />
    <br />
    <asp:Label ID="addOnlbl" runat="server" Text="Add-On Services:"></asp:Label>
    <asp:Label ID="packinglbl" runat="server" Text="Packing"></asp:Label>
    <asp:CheckBox ID="packingchkbox" runat="server" />
    <asp:Label ID="trashlbl" runat="server" Text="Trash Removal/Donation Hauling"></asp:Label>
    <asp:CheckBox ID="trashchkbox" runat="server" />
    <br />
    <asp:Label ID="auctionlbl" runat="server" Text="Need auction service?:"></asp:Label>
    <asp:CheckBox ID="auctionchkbox" runat="server" />
    <br />
    <br />
    <br />
    <asp:Label ID="moveAssesslbl" runat="server" Text="Move Assessment" Font-Bold="true" Font-Size="Large"></asp:Label>
    <br />
    <asp:Label ID="roomslbl" runat="server" Text="Rooms:" Font-Bold="true" Font-Size="Medium"></asp:Label>
    <br />
    <asp:Label ID="livinglbl" runat="server" Text="Living Room:"></asp:Label>
    <asp:Label ID="livingFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="livingFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="livingdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="livingBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallLivingboxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallLivingBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="medLivingBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="medLivingBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeLivingBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeLivingBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeLivingBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeLivingBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artLivingBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artLivingBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="dininglbl" runat="server" Text="Dining Room:"></asp:Label>
    <asp:Label ID="diningFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="diningFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="diningdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="diningBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallDiningBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallDiningBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="medDiningBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="medDiningBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeDiningBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeDiningBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeDiningBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeDiningBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artDiningBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artDiningBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="kitlbl" runat="server" Text="Kitchen:"></asp:Label>
    <asp:Label ID="kitFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="kitFurnlblTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="kitdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="kitBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallKitBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallKitBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumKitBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumKitBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeKitBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeKitBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeKitBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeKitBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artKitBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artKitBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="denlbl" runat="server" Text="Den:"></asp:Label>
    <asp:Label ID="denFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="denFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="dendroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="denBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallDenBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallDenBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mdeiumDenBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumDenBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeDenBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeDenBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeDenBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeDenBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artDenBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artDenBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="offlbl" runat="server" Text="Office:"></asp:Label>
    <asp:Label ID="offFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="offFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="offdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="offBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallOffBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallOffBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumOffBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumOffBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeOffBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeOffBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeOffBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeOffBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artOffBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artOffBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="bedlbl" runat="server" Text="Bedrooms:"></asp:Label>
    <asp:Label ID="bedFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="bedFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="beddroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="bedBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallBedBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallBedBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumBedBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumBedBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeBedBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeBedBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeBedBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeBedBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artBedBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artBedBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="attlbl" runat="server" Text="Attic:"></asp:Label>
    <asp:Label ID="attFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="attFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="attdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="attBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallAttBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallAttBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumAttBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumAttBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeAttBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeAttBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeAttBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeAttBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artAttBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artAttBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="baselbl" runat="server" Text="Basement:"></asp:Label>
    <asp:Label ID="baseFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="baseFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="basedroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="baseBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallBaseBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallBaseBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumBaseBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumBaseBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeBaseBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeBaseBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeBaseBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeBaseBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artBaseBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artBaseBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="garlbl" runat="server" Text="Garage:"></asp:Label>
    <asp:Label ID="garFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="garFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="gardroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="garBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallGarBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallGarBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumGarBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumGarBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeGarBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeGarBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeGarBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeGarBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artGarBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artGarBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="patlbl" runat="server" Text="Patio/Porch:"></asp:Label>
    <asp:Label ID="patFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="patFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="patdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="patBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallPatBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallPatBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumPatBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumPatBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largePatBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largePatBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobePatBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobePatBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artPatBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artPatBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <asp:Label ID="outlbl" runat="server" Text="Out Buildings:"></asp:Label>
    <asp:Label ID="outFurnlbl" runat="server" Text="Furniture:"></asp:Label>
    <asp:TextBox ID="outFurnTB" runat="server"></asp:TextBox>
    <asp:DropDownList ID="outdroplist" runat="server">
        <asp:ListItem Value="Ground" Text="Ground"></asp:ListItem>
        <asp:ListItem Value="Second" Text="2nd"></asp:ListItem>
        <asp:ListItem Value="Third" Text="3rd"></asp:ListItem>
        <asp:ListItem Value="Basement" Text="Basement"></asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="outBoxlbl" runat="server" Text="Boxes:"></asp:Label>
    <asp:Label ID="smallOutBoxlbl" runat="server" Text="Small"></asp:Label>
    <asp:TextBox ID="smallOutBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="mediumOutBoxlbl" runat="server" Text="Medium"></asp:Label>
    <asp:TextBox ID="mediumOutBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="largeOutBoxlbl" runat="server" Text="Large"></asp:Label>
    <asp:TextBox ID="largeOutBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="wardrobeOutBoxlbl" runat="server" Text="Wardrobe"></asp:Label>
    <asp:TextBox ID="wardrobeOutBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <asp:Label ID="artOutBoxlbl" runat="server" Text="Art"></asp:Label>
    <asp:TextBox ID="artOutBoxTB" runat="server" Height="10px" Width="20px"></asp:TextBox>
    <br />
    <br />
    <br />

        </div>
    </form>
</body>
</html>
