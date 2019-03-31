<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webDataReader.aspx.cs" Inherits="PrgAdoNet.webDataReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: justify;
        }
        .auto-style3 {
            text-align: right;
            width: 50%;
            height: 294px;
        }
        .auto-style4 {
            width: 100%;
            height: 146px;
        }
        .auto-style6 {
            width: 769px;
        }
        .auto-style7 {
            text-align: center;
            width: 50%;
            height: 294px;
        }
        .auto-style8 {
            width: 175px;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style1">DataReader-Object</h1>
            <p class="auto-style1">&nbsp;</p>
            <p class="auto-style1">
                <table style="width:100%;">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
            <table class="auto-style6" align="center">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="Label1" runat="server" Text="Select a Course : "></asp:Label>
                        <br />
                        <asp:ListBox ID="lstCourse" runat="server" Height="155px" Width="127px" AutoPostBack="True" OnSelectedIndexChanged="lstCourse_SelectedIndexChanged"></asp:ListBox>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style3">
                        <table class="auto-style4" border =" 1" align="center">
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label2" runat="server" Text="Number"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtNumber" runat="server" AutoPostBack="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label3" runat="server" Text="Title"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtTitle" runat="server" AutoPostBack="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label4" runat="server" Text="Duration"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtDuration" runat="server" AutoPostBack="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label5" runat="server" Text="Teacher"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtTeacher" runat="server" AutoPostBack="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label6" runat="server" Text="Description"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="auto-style1" id="gridResultWithParameters"> <asp:GridView ID="gridResult" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:GridView ID="GridTest" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" style="height: 26px" Text="Check the second gridview" />
                    </td>
                  
                    <td class="auto-style1" id="gridResultWithParameters"> &nbsp;</td>
                  
                </tr>
                <tr>
                    <td colspan="3" class="auto-style1" id="gridResultWithParameters"> &nbsp;</td>
                  
                    <td class="auto-style1" id="gridResultWithParameters"> &nbsp;</td>
                  
                </tr>
            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </p>
        </div>
        <div class="auto-style2">
        </div>
                       
    </form>
</body>
</html>
