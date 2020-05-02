<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReturnGUI.aspx.cs" Inherits="Group4_Lab4.GUI.ReturnGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 203px;
        }
        .auto-style2 {
            width: 154px;
        }
        .auto-style3 {
            width: 203px;
            height: 26px;
        }
        .auto-style4 {
            width: 154px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style8 {
            height: 80px;
        }
        .auto-style9 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-family: 'times New Roman', Times, serif; font-size: large">
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <strong><span class="auto-style9" style="font-family: 'times New Roman', Times, serif; font-size: 30px">Return a copy</span></strong></p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbError" runat="server" Text="Label"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="BorrowerNumber"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtMemberCode" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btCheckMember" runat="server" Text="Check Member" OnClick="btCheckMember_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="The number of borrowed copies : "></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="lbNumberOfBorrowedBooks" runat="server" Text="0"></asp:Label>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="copyNumber" HeaderText="copyNumber" SortExpression="copyNumber" />
                            <asp:BoundField DataField="borrowerNumber" HeaderText="borrowerNumber" SortExpression="borrowerNumber" />
                            <asp:BoundField DataField="borrowedDate" HeaderText="borrowedDate" SortExpression="borrowedDate" />
                            <asp:BoundField DataField="dueDate" HeaderText="dueDate" SortExpression="dueDate" />
                            <asp:BoundField DataField="returnedDate" HeaderText="returnedDate" SortExpression="returnedDate" />
                            <asp:BoundField DataField="fineAmount" HeaderText="fineAmount" SortExpression="fineAmount" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LibraryConnectionString %>" DeleteCommand="DELETE FROM [CirculatedCopy] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CirculatedCopy] ([copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (@copyNumber, @borrowerNumber, @borrowedDate, @dueDate, @returnedDate, @fineAmount)" SelectCommand="SELECT * FROM [CirculatedCopy] WHERE (([borrowerNumber] = @borrowerNumber) AND ([returnedDate] IS NULL))" UpdateCommand="UPDATE [CirculatedCopy] SET [copyNumber] = @copyNumber, [borrowerNumber] = @borrowerNumber, [borrowedDate] = @borrowedDate, [dueDate] = @dueDate, [returnedDate] = @returnedDate, [fineAmount] = @fineAmount WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="copyNumber" Type="Int32" />
                            <asp:Parameter Name="borrowerNumber" Type="Int32" />
                            <asp:Parameter Name="borrowedDate" Type="DateTime" />
                            <asp:Parameter Name="dueDate" Type="DateTime" />
                            <asp:Parameter Name="returnedDate" Type="DateTime" />
                            <asp:Parameter Name="fineAmount" Type="Double" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtMemberCode" Name="borrowerNumber" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="copyNumber" Type="Int32" />
                            <asp:Parameter Name="borrowerNumber" Type="Int32" />
                            <asp:Parameter Name="borrowedDate" Type="DateTime" />
                            <asp:Parameter Name="dueDate" Type="DateTime" />
                            <asp:Parameter Name="returnedDate" Type="DateTime" />
                            <asp:Parameter Name="fineAmount" Type="Double" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" Text="Return Date : "></asp:Label>
&nbsp;</p>
    <p>
        <asp:Calendar ID="Calendar1" runat="server" SelectedDate="03/24/2020 20:53:53" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
            <DayStyle Width="14%" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
            <TodayDayStyle BackColor="#CCCC99" />
        </asp:Calendar>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Find amount :"></asp:Label>
&nbsp;&nbsp;
        <asp:Label ID="txtFindAmount" runat="server" Text="0"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btConfirmFine" runat="server" Text=" Confirm fine" OnClick="btConfirmFine_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btReturn" runat="server" Text="Return" OnClick="btReturn_Click" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
