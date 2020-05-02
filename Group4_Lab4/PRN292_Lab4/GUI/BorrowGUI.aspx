<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowGUI.aspx.cs" Inherits="Group4_Lab4.GUI.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style2 {
        width: 129px;
    }
    .auto-style3 {
        width: 876px;
        height: 20px;
        margin-left: 23px;
    }
    .auto-style4 {
        width: 135px;
    }
    .auto-style5 {
        width: 108px;
    }
    .auto-style6 {
        width: 98%;
    }
    .auto-style7 {
        width: 365px;
    }
    .auto-style8 {
        width: 179px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style3">
    <asp:Label ID="Label1" runat="server" Text="Borrow a copy"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
<p>
    <table class="auto-style6">
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label2" runat="server" Text="Borrower Numner:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtBorrowerNumber" runat="server" Height="22px"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnCheckButton" runat="server" Text="Check member" OnClick="btnCheckButton_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label4" runat="server" Text="Copy number:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtCopyNumber" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Button ID="btnCheckCondition" runat="server" Text="Check condition" OnClick="btnCheckCondition_Click" />
            </td>
        </tr>
    </table>
</p>
<p>
    <asp:Label ID="Label5" runat="server" Text="Number of borrowed copy: "></asp:Label>
    <asp:Label ID="lblNoOfBorrowedCopy" runat="server"></asp:Label>
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" Width="375px">
    </asp:GridView>
    </p>
    <p>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBorrowedCopies" TypeName="QuyPV_Lab4.CirculatedCopyDAO">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBorrowerNumber" DefaultValue="2" Name="borrowerNumber" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>
<p>
    <table style="width:100%;">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label6" runat="server" Text="Borrowed date : "></asp:Label>
            </td>
            <td class="auto-style8">
                <asp:Label ID="Label7" runat="server" Text="Due date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDueDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Calendar ID="Calendar1" runat="server" Width="400px" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
            </td>
            <td class="auto-style8">
                <asp:Button ID="btnBorrow" runat="server" Text="Borrow" Width="141px" OnClick="btnBorrow_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8"></td>
            <td>&nbsp;</td>
        </tr>
    </table>
</p>
</asp:Content>
