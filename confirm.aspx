<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" unobtrusivevalidationmode="none" Inherits="WebApplication2.WebForm40" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Your Personal Details</h3>
            </div>
        </div>
        <div class="row mr-1 mr-md-0  mb-3">
            <asp:Label ID="Label3" runat="server" Text="Father's Name" for="txtFather" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            <div class="col-12 m-auto col-sm-8 col-lg-4 ">

                <asp:TextBox ID="txtFather" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                    ErrorMessage=" Father's name is required" ControlToValidate="txtFather" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
            <asp:Label ID="Label2" runat="server" Text="Mother's Name" for="txtMother" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtMother" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage=" mother's name is required" ControlToValidate="txtMother" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="form-group row mr-1 mr-md-0 mb-3">
            <asp:Label ID="Label1" runat="server" Text="Date of birth" for="txtDOB" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ErrorMessage=" Date of birth is required" ControlToValidate="txtDOB" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

            <asp:Label ID="Label6" runat="server" Text="Contact Number" for="txtContact" Font-Bold="true" CssClass=" col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="contact number is required" ControlToValidate="txtContact" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-3">
            <asp:Label runat="server" ID="Label33" Text="Gender" for="txtGender" Font-Bold="true" CssClass=" col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtGender" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="gender  is required" ControlToValidate="txtGender" Text="*" ForeColor="Red">
                </asp:RequiredFieldValidator>


            </div>
            <asp:Label ID="Label10" runat="server" Text="Qualification" for="txtDegree" Font-Bold="true" CssClass=" col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">
                <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Degree  is required" ControlToValidate="txtDegree" Text="*" ForeColor="Red" InitialValue="-1">
                </asp:RequiredFieldValidator>

            </div>
        </div>

        <div class="row mr-1 mr-md-0 mb-3">
            <asp:Label ID="Label11" runat="server" Text="Marritul Status" for="txtStatus" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                    ErrorMessage="Marritul status  is required" ControlToValidate="txtStatus" Text="*" ForeColor="Red" InitialValue="-1">
                </asp:RequiredFieldValidator>

            </div>

            <asp:Label ID="Label7" runat="server" Text="Street" for="txtStreet" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>

            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage="street name is required" ControlToValidate="txtStreet" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

        </div>
        <div class="row mr-1 mr-md-0 mb-3">
                <asp:Label ID="Label5" runat="server" Text="City" for="txtCity" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control">

                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="city name is required" ControlToValidate="txtCity" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
                <asp:Label ID="Label8" runat="server" Text="State" for="txtState" Font-Bold="true" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="state name is required" ControlToValidate="txtState" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

        </div>
        <div class="row mr-1 mr-md-0 mb-3">
                <asp:Label ID="Label9" runat="server" Text="Country" Font-Bold="true" for="txtCountry" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
           
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="country name is required" ControlToValidate="txtCountry" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
                <asp:Label ID="Label4" runat="server" Text="Zip Code" Font-Bold="true" for="txtZip" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
         
            <div class="col-12 m-auto col-sm-8 col-lg-4">
                <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                    ErrorMessage="zip code is required" ControlToValidate="txtZip" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

        </div>

        <div class="row mr-1 mr-md-0 mb-5 mt-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Your Passport Details</h3>
            </div>
        </div>
        <div class="row mr-1 mr-md-0  mb-3">
                <asp:Label ID="Label12" runat="server" Text="PassPort Number" Font-Bold="true" for="txtPassportNo" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
          
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                    ErrorMessage=" Passport number is required" ControlToValidate="txtPassportNo" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
                <asp:Label ID="Label14" runat="server" Text="Date of issue" Font-Bold="true" for="txtVisaDate" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
           
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtVisaDate" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                    ErrorMessage=" date of issue  is required" ControlToValidate="txtVisaDate" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>


            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-3">
                <asp:Label ID="Label16" runat="server" Text="Date of expiry" Font-Bold="true" for="txtDuration" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                    ErrorMessage=" date of expiry is required" ControlToValidate="txtDuration" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>

                <asp:Label ID="Label18" runat="server" Text="Place of issue" Font-Bold="true" for="txtDestination" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
            
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                    ErrorMessage="place of issue is required" ControlToValidate="txtDestination" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>


            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-3">
                <asp:Label runat="server" ID="Label20" Text="Visa Type" Font-Bold="true" for="txtVisaType" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
           
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtVisaType" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                    ErrorMessage="Visa type is required" ControlToValidate="txtVisaType" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>


            </div>


                <asp:Label runat="server" ID="Label13" Text="Visa Category" Font-Bold="true" for="txtVisaCategory" CssClass="col-form-label col-sm-4 col-lg-2"></asp:Label>
        
            <div class="col-12 m-auto col-sm-8 col-lg-4">

                <asp:TextBox ID="txtVisaCategory" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                    ErrorMessage="Visa category is required" ControlToValidate="txtVisaCategory" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mr-1 mr-md-0 mt-5">
            <div class="col-12 m-auto col-md-8 col-lg-6">
                <asp:Button ID="Button1" runat="server" Text="Confirm and Submit" CssClass="btn btn-success btn-lg ml-1 ml-sm-5" OnClick="Button1_Click" 
                    OnClientClick="return confirm('Are you sure you want to submit the form?)" />
            </div>
        </div>
    </div>
</asp:Content>
