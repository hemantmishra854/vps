<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication2.WebForm20" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/footerpages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container-fluid" style="margin-top: 100px; margin-bottom: 50px;">
        <div class="row mb-5">

            <div class="col-12 m-auto col-md-8">
                <h3 class="text-center text-primary">Contact Us for Any Query Regarding This Site</h3>
            </div>
        </div>

        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label1" runat="server" Text="Contact Person:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label2" runat="server" Text="Hemant Kumar Mishra" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label3" runat="server" Text="Email:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label4" runat="server" Text="hemantmishra854@gmail.com" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label9" runat="server" Text="Contact Number:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label10" runat="server" Text="7704850129" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
        
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label5" runat="server" Text="Address:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label6" runat="server" Text="458/11 Thammenhalli,Near Acharya Insitute,Bangalore-Karnataka(560107) " CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>

        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label7" runat="server" Text="Time To visit:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label8" runat="server" Text="EveryDay Except Holidays(From 10:00AM-5:00PM)" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>

    </div>
</asp:Content>
