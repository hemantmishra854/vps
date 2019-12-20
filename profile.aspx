<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication2.WebForm43" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-10">
                <h3 class="text-primary text-center">Your Profile</h3>
            </div>
            <div class="col-12 m-auto col-md-2">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="~/changeprofile.aspx">Change Profile</asp:HyperLink>
            </div>
        </div>

        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-4">
                <asp:Image ID="imgPhoto" runat="server" CssClass="img-fluid w-50 h-25" />

                <asp:Label ID="lblStatus" runat="server" Text="" CssClass="text-left"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-8">
                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label4" runat="server" Text="Name" for="lblName" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    </div>

                </div>
                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label5" runat="server" Text="Email" for="lblEmail" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label7" runat="server" Text="Date of birth" for="lblDOB" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label2" runat="server" Text="Contact Number" for="lblContact" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="lblContact" runat="server" Text=""></asp:Label>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label runat="server" ID="Label11" Text="Gender" for="lblGender" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                    </div>

                </div>



            </div>
        </div>
       
    </div>


</asp:Content>
