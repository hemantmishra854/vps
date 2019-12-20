<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cancelvisa.aspx.cs" Inherits="WebApplication2.WebForm22"  
    unobtrusivevalidationmode="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="offset-md-3 col-md-6 container-fluid mb-5" style="margin-top: 60px; background-color: #efeeee; border: solid 2px #f6dede;">
        <div class=" row form-group align-items-start mr-1">
            <div class="col-12 m-auto  pt-3">
                <h3 style="color: blue ;text-align:center">Send Visa Cancellation Message To The User</h3>
            </div>
        </div>

        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label2" runat="server" Text="Email" for="txtEmail"></asp:Label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" aria-describedby="emailHelp" placeholder="Enter user's email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                    Text="*" ForeColor="Red" Display="Dynamic" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                    ErrorMessage="Invalid email format" Display="Dynamic" Text="*" ControlToValidate="txtEmail"
                    ForeColor="Red" SetFocusOnError="True"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="lblMessage" runat="server" Text="" ></asp:Label>
            </div>
        </div>
        
        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Button1_Click" />
            </div>
        </div>

        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
            HeaderText="Please fix the following errors" ShowMessageBox="true" ShowSummary="false" />
            </div>
        </div>

    </div>

</asp:Content>
