<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebDBDataSet.aspx.cs" Inherits="PrgAdoNet.WebDBDataSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            height: 20px;
        }
        .auto-style3 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1">Music Box _ Dataset</h1>
            <p class="auto-style1">
                &nbsp;</p>
            <asp:Panel ID="Panel1" runat="server" Height="325px">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style2"></td>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style2">
                            <asp:Button ID="btnAdd" runat="server" Text="ADD" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style3">
                            <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                        </td>
                        <td class="auto-style3">
                            <asp:Button ID="btnEdit" runat="server" Text="EDIT" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Genre"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Text="SAVE" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="BirthDate"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBirthDate" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="padding:10px;">
                        <td colspan="4" class="auto-style1"><asp:Button ID="btnFirst" runat="server" Text="&lt;&lt; First" Width="150px" />
                            <asp:Button ID="btnNext" runat="server" Text="Next &gt;&gt;" Width="150px" />
                            <asp:Button ID="btnPrevious" runat="server" Text="&lt;&lt; Previous" Width="150px" />
                            <asp:Button ID="btnLast" runat="server" Text="Last &gt;&gt;" Width="150px" /></td>
                        
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="4">
                            <div style="margin-left:auto; margin-right:auto;">
                            <asp:GridView ID="gridResult" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                                </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="auto-style1">
        </div>
    </form>
</body>
</html>
