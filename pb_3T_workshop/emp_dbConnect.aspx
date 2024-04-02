<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emp_dbConnect.aspx.cs" Inherits="pb_3T_workshop.emp_dbConnect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Label ID="lblwc" runat="server" Text="Label"></asp:Label>
    <form id="form1" runat="server">
        <div>
            <center>
                <table >
                    <tr>
                        <td>First name:</td>
                        <td>
                            <asp:TextBox ID="txtfnm" runat="server"></asp:TextBox>
                        </td>
                    </tr> 
                    <tr>
                        <td>Last name:</td>
                        <td>
                            <asp:TextBox ID="txtlnm" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="txteml" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>City:</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="---select---"></asp:ListItem>
                                <asp:ListItem Value="Amreli"></asp:ListItem>
                                <asp:ListItem Value="Babra"></asp:ListItem>
                                <asp:ListItem Value="Rajkot"></asp:ListItem>
                                <asp:ListItem Value="Nadiad"></asp:ListItem>
                                <asp:ListItem Value="Ahmedabad"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Mobile:</td>
                        <td>
                            <asp:TextBox ID="txtmbl" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td>
                            <asp:FileUpload ID="flupimg" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="padding-top:5px">
                            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                        </td>
                    </tr>

                </table>

            </center>
        </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%# Eval("Image") %>' Width="50px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </form>
    </body>
</html>
