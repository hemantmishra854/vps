<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="getpassportdetails.aspx.cs" Inherits="WebApplication2.WebForm29" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mb-5" style="margin-top: 60px; background-color: #efeeee; border: solid 2px #f6dede;">

        <div class="row mt-3 mb-3">

            <div class="col-12 m-auto">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                     GridLines="None" Caption="Passport Details Table" CaptionAlign="Top" 
                     OnRowEditing="GridView1_RowEditing1" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1"
                     OnRowUpdating="GridView1_RowUpdating1"   DataKeyNames="Id" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="PassportNo" HeaderText="PassportNo" SortExpression="PassportNo" />
                        <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" />
                        <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />
                        <asp:BoundField DataField="IssuePlace" HeaderText="IssuePlace" SortExpression="IssuePlace" />
                        <asp:BoundField DataField="VisaType" HeaderText="VisaType" SortExpression="VisaType" />
                        <asp:BoundField DataField="VisaCategory" HeaderText="VisaCategory" SortExpression="VisaCategory" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:visadbConnectionString %>" DeleteCommand="DELETE FROM [passportDetails] WHERE [Id] = @Id" InsertCommand="INSERT INTO [passportDetails] ([PassportNo], [IssueDate], [ExpiryDate], [IssuePlace], [VisaType], [VisaCategory], [UserId]) VALUES (@PassportNo, @IssueDate, @ExpiryDate, @IssuePlace, @VisaType, @VisaCategory, @UserId)" SelectCommand="SELECT * FROM [passportDetails]" UpdateCommand="UPDATE [passportDetails] SET [PassportNo] = @PassportNo, [IssueDate] = @IssueDate, [ExpiryDate] = @ExpiryDate, [IssuePlace] = @IssuePlace, [VisaType] = @VisaType, [VisaCategory] = @VisaCategory, [UserId] = @UserId WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PassportNo" Type="String" />
                        <asp:Parameter Name="IssueDate" Type="String" />
                        <asp:Parameter Name="ExpiryDate" Type="String" />
                        <asp:Parameter Name="IssuePlace" Type="String" />
                        <asp:Parameter Name="VisaType" Type="String" />
                        <asp:Parameter Name="VisaCategory" Type="String" />
                        <asp:Parameter Name="UserId" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PassportNo" Type="String" />
                        <asp:Parameter Name="IssueDate" Type="String" />
                        <asp:Parameter Name="ExpiryDate" Type="String" />
                        <asp:Parameter Name="IssuePlace" Type="String" />
                        <asp:Parameter Name="VisaType" Type="String" />
                        <asp:Parameter Name="VisaCategory" Type="String" />
                        <asp:Parameter Name="UserId" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                 
                <br />
                <br />
                
                </div>
        </div>
        <div class="row mb-4">
            <div class="col-12 m-auto  col-lg-10">
                <asp:Button ID="btnSavaData" runat="server" Text="Save Data To DataBase" CssClass="btn btn-primary" OnClick="btnSavaData_Click" />
                
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>


    </div>
</asp:Content>
