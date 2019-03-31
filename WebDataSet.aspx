<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebDataSet.aspx.cs" Inherits="PrgAdoNet.WebDataSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>Static DataSet</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
            width: 251px;
        }
        .auto-style6 {
            width: 456px;
        }
        .auto-style7 {
            background-color: #66FF99;
            width: 72%;
            height: 425px;
        }
        .auto-style8 {
            width: 173px;
            padding : 20px;
        }
        .auto-style9 {
            width: 251px;
        }
        .auto-style10 {
            width: 322px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="auto-style1">Static DataSet</h1>

        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td>

        <table style="padding:20px; align-content:center;" class="auto-style7">
            <tr style="padding:15px;">
                <td class="auto-style8">
                        Select a Function:<br />
                        <asp:ListBox ID="lstFunction" runat="server" AutoPostBack="True" Height="190px" OnSelectedIndexChanged="lstFunction_SelectedIndexChanged" Width="145px"></asp:ListBox>
                    </td>
                <td class="auto-style6">
                    <asp:Panel ID="panFunc" runat="server" GroupingText="Function Information">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Title         : "></asp:Label>
                                </td>
                                <td class="auto-style9">
                                    <asp:TextBox ID="txtTitle" runat="server" AutoPostBack="True" Width="201px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="Label1" runat="server" Text="Base Salary : "></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="txtSalary" runat="server" AutoPostBack="True" Width="202px"></asp:TextBox>
                                </td>
                                <td class="auto-style3">
                                    <asp:Button ID="btnEdit" runat="server"  Text="Edit" OnClick="btnEdit_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Diploma : "></asp:Label>
                                </td>
                                <td class="auto-style9">
                                    <asp:TextBox ID="txtDiploma" runat="server" AutoPostBack="True" Width="201px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server"  Text="Delete" OnClick="btnDelete_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    <asp:Label ID="Label4" runat="server" Text="Description : "></asp:Label>
                                </td>
                                <td rowspan="2" class="auto-style9">
                                    <asp:TextBox ID="txtDescription" runat="server" Height="52px" Width="202px" AutoPostBack="True"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnCancel" runat="server"  Text="Cancel" OnClick="btnCancel_Click" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                        <asp:GridView ID="gridTable" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </td>
            </tr>
        </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>

</body>
</html>
