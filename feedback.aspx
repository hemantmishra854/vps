<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm5" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="offset-md-3 col-md-6 container-fluid" style="margin-top: 150px; background-color: #efeeee; border: solid 2px #f6dede;">
        <div class=" row form-group align-items-start mr-1">
            <div class="col-12 m-auto col-md-6 offset-md-3 pt-3">
                <h3 style="color: blue">Give Your Feedback Here</h3>
            </div>
        </div>

        <div class="row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label5" runat="server" Text="Name" for="txtName"></asp:Label>
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" aria-describedby="emailHelp" placeholder="Enter your name"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtName"
                    Text="*" ForeColor="Red" ErrorMessage="Name is required"> </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label2" runat="server" Text="Email" for="txtEmail"></asp:Label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" aria-describedby="emailHelp" placeholder="Enter your email"></asp:TextBox>
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
                <asp:Label ID="Label3" runat="server" Text="Subject" for="txtSubject"></asp:Label>
                <asp:TextBox runat="server" ID="txtSubject" CssClass="form-control" aria-describedby="emailHelp" placeholder="Enter your subject"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*"
                    ControlToValidate="txtSubject" ErrorMessage="Please give your subject" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class=" row form-group align-items-start mr-2">
            <div class="col-12 m-auto col-md-6 offset-md-3">
                <asp:Label ID="Label4" runat="server" Text="Comments" for="txtComments"></asp:Label>
                <asp:TextBox runat="server" ID="txtComments" CssClass="form-control" aria-describedby="emailHelp" placeholder="Enter your comments" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComments"
                    Text="*" ErrorMessage="Please give you comments" ForeColor="Red"></asp:RequiredFieldValidator>
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
