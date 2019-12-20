<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="documents.aspx.cs" Inherits="WebApplication2.WebForm42" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
     <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5 mt-5">s
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Your Uploaded Documents Details</h3>
            </div>
        </div>
        <div class="row mr-1 mr-md-0  mb-3">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label13" runat="server" Text="Your Current Photo" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Image ID="imgPhoto" runat="server"  CssClass=" h-25 w-100 img-fluid" />
            </div>
        </div>

        <div class="row mr-1 mr-md-0  mb-3">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label17" runat="server" Text="Your Passport Copy" Font-Bold="true"></asp:Label>

            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                <asp:Image ID="imgPassport" runat="server" CssClass="h-25 w-100 img-fluid" />

            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-3">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label21" runat="server" Text="Your AADHAR Card Copy" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Image ID="imgAadhar" runat="server" CssClass=" h-25 w-100 img-fluid"/>

            </div>
        </div>
          <div class="row mr-1 mr-md-0 mt-5">
            <div class="col-12 m-auto col-md-8 offset-lg-6 col-lg-6">
                
                <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-success btn-lg ml-1 ml-sm-5" PostBackUrl="~/uploaddocuments.aspx" />
                
                </div>
            </div>
       
         </div>
</asp:Content>
