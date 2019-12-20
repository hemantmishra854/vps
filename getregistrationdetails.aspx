<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="getregistrationdetails.aspx.cs" Inherits="WebApplication2.WebForm27" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mb-5" style="margin-top: 60px; background-color: #efeeee; border: solid 2px #f6dede;">

        <div class="row mt-3 mb-3">

            <div class="col-12 m-auto">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                     GridLines="None" Caption="Registration Table" CaptionAlign="Top" 
                     OnRowEditing="GridView1_RowEditing1" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1"
                     OnRowUpdating="GridView1_RowUpdating1"   DataKeyNames="Email"  >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
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
