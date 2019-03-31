<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebDataReader2.aspx.cs" Inherits="PrgAdoNet.WebDataReader2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            height: 63px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1>School - Course - Student Data Reader</h1>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:Label ID="lblSchool" runat="server" Text="Select School"></asp:Label>
                    <asp:RadioButtonList ID="RadioLstSchool" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioLstSchool_SelectedIndexChanged">
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblProgram" runat="server" Text="Select a program"></asp:Label>
                    <asp:RadioButtonList ID="RadioLstProg" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioLstProg_SelectedIndexChanged">
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;<asp:Label ID="lblCourse" runat="server" Text="Select a Course"></asp:Label>
                    <br />
                    <asp:CheckBoxList ID="chklistCourse" runat="server" AutoPostBack="True" OnSelectedIndexChanged="chklistCourse_SelectedIndexChanged">
                    </asp:CheckBoxList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td colspan="2" class="auto-style1">
                    <asp:GridView ID="gridStudent" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
