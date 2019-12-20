<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="visastatus.aspx.cs" Inherits="WebApplication2.WebForm31" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
<div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5 mt-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Your Current Visa Status</h3>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label1" runat="server" Text="User Id:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="lblUserId" runat="server" Text="" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label3" runat="server" Text="Applied Date:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="lblAppliedDate" runat="server" Text="" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
     <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label5" runat="server" Text="Application No:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="lblApplicationNo" runat="server" Text="" CssClass="text-info"></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-12 m-auto col-md-3">
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label7" runat="server" Text="Visa Status:" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="lblVisaStatus" runat="server" Text=""></asp:Label>
            </div>

            <div class="col-12 m-auto col-md-2">
            </div>
        </div>
       
       
    </div>
</asp:Content>
