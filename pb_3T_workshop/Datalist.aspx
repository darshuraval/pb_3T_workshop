<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Datalist.aspx.cs" Inherits="pb_3T_workshop.Datalist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Data Listing</h1>
            <asp:DataList ID="DataList1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" RepeatDirection="Horizontal">
                <AlternatingItemStyle BackColor="PaleGoldenrod" />
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                </ItemTemplate>
                <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            </asp:DataList>
            <br />
            <br />
            <asp:LinkButton ID="btnprev" runat="server" Enabled="False" OnClick="btnprev_Click">Previous</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnnext" runat="server" OnClick="btnnext_Click">Next</asp:LinkButton>
        </div>
    </form>
</body>
</html>
