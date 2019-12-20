<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" unobtrusivevalidationmode="none"
    CodeBehind="register.aspx.cs" Inherits="WebApplication2.WebForm23" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://www.google.com/recaptcha/api.js'></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="offset-md-3 col-md-6 container-fluid" style="margin-top: 150px; background-color: #efeeee; border: solid 2px #f6dede;">
        <div class=" row form-group align-items-start mr-1">
            <div class="col-12 m-auto col-md-6 offset-md-3 pt-3">
                <h3 style="color: blue">Please sign-up here.</h3>
            </div>
        </div>

        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label5" runat="server" Text="Name" for="txtName"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ForeColor="Red" ControlToValidate="txtName" Text="*">

                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label2" runat="server" Text="Email address" for="txtEmail1"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtEmail" Text="*" 
                    Display="Dynamic">

                </asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                    ErrorMessage="Invalid email format" Display="Dynamic" Text="*" ControlToValidate="txtEmail"
                    ForeColor="Red" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            
            </div>
        </div>
        <div class="row form-group align-items-center mr-2">

            <div class="col-12 m-auto col-md-6 offset-md-3">

                <asp:Label ID="Label3" runat="server" Text="Password" for="txtPass"></asp:Label>
               
               <asp:TextBox ID="txtPass" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtPass" Text="*"
                      Display="Dynamic">

                </asp:RequiredFieldValidator>
               
            </div>
        </div>
        <div class="row form-group align-items-center mr-2">

            <div class="col-12 m-auto col-md-6 offset-md-3">

                <asp:Label ID="Label4" runat="server" Text="Confirm password" for="txtConfirmPass"></asp:Label>
                
                <asp:TextBox ID="txtConfirmPass" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Re-enter password" TextMode="Password">

                </asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" Confirm Password is required" ForeColor="Red" 
                     ControlToValidate="txtConfirmPass" Text="*" Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password does not match" ControlToValidate="txtConfirmPass" 
                    ControlToCompare="txtPass" ForeColor="Red" Text="*" Display="Dynamic">
                </asp:CompareValidator>

            </div>
        </div>
        
        <div class="row form-group align-items-center mr-2">
        <div class=" col-12 m-auto col-md-6 offset-md-3 g-recaptcha" data-sitekey="6LfyqGMUAAAAAN3ggg1ci-Exjfc-aM6jAJJ_4JDw"></div>
         </div>

        <div class=" row form-group align-items-center mr-2">
            <div class="col-12 m-auto col-md-3 offset-md-7">
                <asp:Button ID="Button1" runat="server" Text="Signup" class="btn btn-primary" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class=" row form-group align-items-end mr-2 pb-3">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">Already registerd? Login here</asp:HyperLink>
            </div>
        </div>

    </div>
</asp:Content>
