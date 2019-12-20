<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="jquery-3.2.1.js">
   
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="offset-md-3 col-md-6 container-fluid"  style="margin-top: 150px;background-color:#efeeee;border: solid 2px #f6dede ;">
        <div class=" row form-group align-items-start mr-1">
                <div class="col-12 m-auto col-md-6 offset-md-3 pt-3">
                    <h3 style="color:blue">Please sign-in here.</h3>
                    </div>
            </div>
            <div class=" row form-group align-items-start mr-2">
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    <asp:Label ID="Label2" runat="server" Text="Email address" for="txtEmail1"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server"  class="form-control" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>

                </div>
            </div>
            <div class="row form-group align-items-center mr-2">
                
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    
                    <asp:Label ID="Label3" runat="server" Text="Password" for="txtPassword"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server"  class="form-control" aria-describedby="emailHelp" placeholder="Enter password" TextMode="Password"></asp:TextBox>
            </div>
                </div>
            <div class=" row form-group form-check align-items-end mr-1">
                
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    <asp:CheckBox ID="CheckBox1" runat="server" class="form-check-input" />
                    <asp:Label ID="Label4" runat="server" Text="Remember me" class="form-check-label" for="CheckBox1"></asp:Label>
                
            </div>
                </div>
        <div class=" row form-group align-items-start mr-2">
                <div class="col-12 m-auto col-md-3 offset-md-7">
        <asp:Button ID="Button1" runat="server" Text="Signin"  class="btn btn-primary" OnClick="Button1_Click" />

                    
            </div>
            </div>
        <div class=" row form-group align-items-start mr-2">
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </div>
            </div>
        
        <div class=" row form-group align-items-start mr-2 pb-3">
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx">New User? Register here</asp:HyperLink>
                    </div>
            </div>

        </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:visadbConnectionString %>" SelectCommand="SELECT * FROM [register]"></asp:SqlDataSource>
</asp:Content>
