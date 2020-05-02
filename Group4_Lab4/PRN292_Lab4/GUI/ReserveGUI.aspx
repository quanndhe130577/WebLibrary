<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReserveGUI.aspx.cs" Inherits="Group4_Lab4.GUI.ReserveGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 80px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            width: 246px;
        }
        .auto-style10 {
            width: 246px;
            height: 27px;
        }
        .auto-style12 {
            height: 27px;
        }
        .auto-style13 {
            width: 154px;
            height: 27px;
        }
        .auto-style14 {
            width: 154px;
        }
        .auto-style16 {
            width: 106px;
            height: 27px;
        }
        .auto-style17 {
            width: 106px;
        }
        .auto-style19 {
            width: 205px;
            height: 27px;
        }
        .auto-style20 {
            width: 205px;
        }
        .auto-style23 {
            height: 23px;
        }
        .auto-style24 {
            width: 293px;
        }
        .auto-style25 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p class="auto-style1" style="font-family: 'times New Roman', Times, serif; font-size: 30px;">
        <strong>Reserve a book</strong></p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lbError" runat="server" CssClass="auto-style25" Text="Label"></asp:Label>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style19">Borrower number :</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtMemberCode" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">Name :</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:Button ID="btCheckMember" runat="server" OnClick="btCheckMember_Click" Text="Check member" Width="140px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style20">Book number</td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtBookNumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">Title :
                    <br />
                </td>
                <td class="auto-style14">
                    <asp:TextBox ID="txtTitle" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btCheckReservation" runat="server" Text="Check condition" OnClick="btCheckReservation_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">The number of reserved books :
                    <asp:Label ID="lbNumberOfReservedBooks" runat="server" Text="0"></asp:Label>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="5">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                </td>
            </tr>
        </table>
    </p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style23" colspan="2">Reserved Date :</td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </td>
                <td>
                    <asp:Button ID="btReserve" runat="server" Text="Reserve" OnClick="btReserve_Click" />
                </td>
            </tr>
        </table>
    </p>
    <p>
&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
