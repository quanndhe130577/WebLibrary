<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookGUI.aspx.cs" Inherits="Group4_Lab4.GUI.BookCopy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="stylesheet" href="../Styles/baseCss.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- book content--%>
    <div id="bookP" runat="server">
        <div class="firstPart">
            <h2>List of books&nbsp; </h2>
            <h2>&nbsp;<asp:Label ID="lbErrorBook" runat="server" Font-Size="Smaller" ForeColor="#CC0000" Text="lbError" Visible="False"></asp:Label>
            </h2>

            <asp:Label ID="Label1" runat="server" Text="Label">Title</asp:Label>
            &nbsp;
        <asp:TextBox ID="txtTitleFilter" runat="server" Width="307px"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btFilter" runat="server" Text="Filter" Width="139px" OnClick="Button1_Click" />
            <p>
                Number of books:
                <asp:Label ID="Label2" runat="server" Text="null"></asp:Label>
            </p>

        </div>

        <table>
            <tr>
                <td>
                    <br />

                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="272px" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AllowSorting="True" OnPageIndexChanged="GridView1_PageIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
                        <Columns>
                            <%-- not let name = delete -> execute withou delete eventhandle--%>
                            <asp:ButtonField CommandName="Del" Text="Delete" runat="server" />
                            <asp:ButtonField CommandName="Select" Text="Select" runat="server" />
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

                </td>
                <td>
                    <div class="subFirstPart">
                        <asp:Label ID="Label3" class="compSub" runat="server" Text="Title"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtTitle" runat="server" Width="242px" ReadOnly="True"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lbErrorTitleAdd" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label4" class="compSub" runat="server" Text="Author"></asp:Label>&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<asp:TextBox ID="txtAuthor" runat="server" Width="242px" ReadOnly="True"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label5" class="compSub" runat="server" Text="Publisher"></asp:Label>&nbsp; &nbsp;<asp:TextBox ID="txtPublisher" runat="server" Width="242px" ReadOnly="True"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="footFirstPart">
                        <asp:Button ID="btAddBook" runat="server" Text="Add" OnClick="Button2_Click" CausesValidation="False" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btEditBook" runat="server" Text="Edit" OnClick="Button3_Click" CausesValidation="False" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btCopies" runat="server" Text="Copies" OnClick="Button4_Click" CausesValidation="False" />

                    </div>
                </td>
                <td>

                    <div class="subFootFirst">
                        <asp:Button ID="btSaveBook" runat="server" Text="Save" Enabled="false" OnClick="Button5_Click" CausesValidation="False" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btCancelBook" runat="server" Text="Cancel" Enabled="false" OnClick="Button6_Click" CausesValidation="False" />
                    </div>
                </td>
            </tr>
        </table>

        <%-- not let name = delete -> execute withou delete eventhandle--%>

        <br />
        <br />

    </div>

    <%-- not let name = delete -> execute withou delete eventhandle--%>
    <div id="copyP" runat="server">
        <div class="firstPart">
            <h2>List of copies</h2>
            <p>
                &nbsp;</p>
            <p>&nbsp;</p>

            <asp:Label ID="Label6" runat="server" Text="Book number"></asp:Label>
            &nbsp;
        <asp:TextBox ID="txtBookNumberCopies" runat="server" Width="302px" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;
                   <asp:Label ID="Label10" runat="server" Text="Title"></asp:Label>
            &nbsp;
                   <asp:TextBox ID="txtTitleCopy" runat="server" Width="257px" ReadOnly="True"></asp:TextBox>
            &nbsp;<p>
                Number of copies:
                <asp:Label ID="Label7" runat="server" Text="null"></asp:Label>
            </p>

        </div>

        <table>
            <tr>
                <td>
                    <br />

                    <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="272px" OnRowCommand="GridView1_RowCommand" AllowPaging="True" AllowSorting="True" OnPageIndexChanged="GridView1_PageIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
                        <Columns>
                            <%-- not let name = delete -> execute without delete eventhandle--%>
                            <asp:ButtonField CommandName="Del" Text="Delete" runat="server" />
                            <asp:ButtonField CommandName="Select" Text="Select" runat="server" />
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

                </td>
                <td>
                    <div class="subFirstPart">
                        <asp:Label ID="Label8" class="compSub" runat="server" Text="Type"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtTypecopy" runat="server" Width="239px" ReadOnly="True"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lbErrorCopies" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label9" class="compSub" runat="server" Text="Price"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtPrice" runat="server" Width="238px" ReadOnly="True"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="footFirstPart">
                        <asp:Button ID="btAddCopies" runat="server" Text="Add" OnClick="Button2_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btEditCopies" runat="server" Text="Edit" OnClick="Button3_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                    </div>
                </td>
                <td>

                    <div class="subFootFirst">
                        <asp:Button ID="btSaveCopies" runat="server" Text="Save" Enabled="false" OnClick="Button5_Click" />
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btCancelCopies" runat="server" Text="Cancel" Enabled="false" OnClick="Button6_Click" />
                    </div>
                </td>
            </tr>
        </table>

        <%-- not let name = delete -> execute withou delete eventhandle--%>

        <br />
        <br />

    </div>

</asp:Content>
