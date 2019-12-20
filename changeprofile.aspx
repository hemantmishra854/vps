<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="changeprofile.aspx.cs" Inherits="WebApplication2.WebForm32" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Your Profile</h3>
            </div>
        </div>

        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-4">
                <asp:Image ID="imgPhoto" runat="server" CssClass="img-fluid w-50 h-25" />

                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />

                <asp:Label ID="lblStatus" runat="server" Text=""  ></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-8">
                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label4" runat="server" Text="Name" for="txtName" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </div>

                </div>
                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label5" runat="server" Text="Email" for="txtEmail" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label7" runat="server" Text="Date of birth" for="txtDOB" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label ID="Label2" runat="server" Text="Contact Number" for="txtContact" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:TextBox ID="txtContact" runat="server" ></asp:TextBox>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto col-md-6">

                        <asp:Label runat="server" ID="Label11" Text="Gender" for="txtGender" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-12 m-auto col-md-6">

                        <asp:TextBox ID="txtGender" runat="server" ></asp:TextBox>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-12 m-auto">
                        
                        <asp:Button ID="Button2" runat="server" Text="Back" CssClass="btn btn-primary mr-sm-3" OnClick="Button2_Click"  />
                        <asp:Button ID="Button1" runat="server" Text="Update Profile" CssClass="btn btn-success" OnClick="Button1_Click" />
                        
                        <asp:Label runat="server" ID="lblChangeProfileMessage" Text=""></asp:Label>
                    </div>

                </div>



            </div>
        </div>

    </div>

</asp:Content>
