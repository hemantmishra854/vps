<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="uploaddocuments.aspx.cs" unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm9" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Attach Documents </h3>
            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label4" runat="server" Text="Your Application N0." for="lblApplication"></asp:Label>
                <asp:Label ID="lblApplication" runat="server" Text="" ForeColor="#cc3300"></asp:Label>
            </div>
            <div class="col-12 m-auto col-md-6">
            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-4">
            <asp:Label ID="Label6" runat="server" Text="Upload Current Photo" for="FileUpload1" CssClass="col-sm-6 col-form-label col-form-label-sm" Font-Size="Large"></asp:Label>

            <div class="col-sm-3">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>

        </div>
        <div class="row mr-1 mr-md-0 mb-4">
            <asp:Label ID="Label1" runat="server" Text="Upload Passport (Scanned Copy)" for="FileUpload2" CssClass="col-sm-6 col-form-label col-form-label-sm "
                Font-Size="Large"></asp:Label>

            <div class="col-sm-3">
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </div>
        </div>

        <div class="row mr-1 mr-md-0 mb-5">
            <asp:Label ID="Label3" runat="server" Text="Upload AADHAR Card(Scanned Copy)" for="FileUpload3" CssClass="col-sm-6 col-form-label col-form-label-sm" Font-Size="Large">

            </asp:Label>
            <div class="col-sm-3">
                <asp:FileUpload ID="FileUpload3" runat="server" />
            </div>

        </div>


        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-8 offset-col-4 col-lg-6">

                <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success btn-lg ml-1 ml-sm-5" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="View Uploaded Files" CssClass="btn btn-success btn-lg mt-3 mt-sm-0 ml-sm-5" OnClick="Button2_Click" />
            </div>
        </div>
        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-8">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Please check the errors"
                    ForeColor="Red" ShowMessageBox="True" ShowSummary="False" />
            </div>

        </div>
    </div>



</asp:Content>
