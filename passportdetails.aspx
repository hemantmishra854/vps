<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="passportdetails.aspx.cs"
    unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    s
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-lg-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Fill Passport Details</h3>
            </div>
        </div>
        <div class="row mr-1 mr-lg-0  mt-3">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label3" runat="server" Text="Passport Number" for="txtPassport"></asp:Label>
                <asp:TextBox ID="txtPassport" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter passport number"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="display" SetFocusOnError="true" 
                    ErrorMessage=" Passport number is required" ControlToValidate="txtPassport" Text="*"  Display="Dynamic"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid passport number" CssClass="display" SetFocusOnError="true" 
                     ControlToValidate="txtPassport" ForeColor="Red" Text="*" ValidationExpression="^[A-Z]{1}[0-9]{7}$" Display="Dynamic">
                </asp:RegularExpressionValidator>
            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label2" runat="server" Text="Date of issue" for="txtIssueDate"></asp:Label>
                <asp:TextBox ID="txtIssueDate" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter passport issue date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="display" SetFocusOnError="true" 
                    ErrorMessage="Passport issue date is required" ControlToValidate="txtIssueDate" Text="*"  Display="Dynamic"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <script type="text/javascript">
                    var picker = new Pikaday(
                        {
                            field: document.getElementById('<%=txtIssueDate.ClientID%>'),
                            firstDay: 1,
                            minDate: new Date('2000-01-01'),
                            maxDate: new Date('2020-12-31'),
                            numberOfMonths: 1,
                            theme:'dark-theme'
                        });

                </script>
            </div>
        </div>
        <div class="row mr-1 mr-lg-0 mt-3">
            <div class="col-12 m-auto col-lg-6">
                <asp:Label ID="Label1" runat="server" Text="Date of expiry" for="txtExpiryDate"></asp:Label>
                <asp:TextBox ID="txtExpiryDate" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter passport expiry date"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  Display="Dynamic"
                    ErrorMessage=" Passport expiry date  is required" ControlToValidate="txtExpiryDate" Text="*" CssClass="display" SetFocusOnError="true" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                 <script type="text/javascript">
                     var picker = new Pikaday(
                         {
                             field: document.getElementById('<%=txtExpiryDate.ClientID%>'),
                            firstDay: 1,
                            minDate: new Date('2000-01-01'),
                            maxDate: new Date('2020-12-31'),
                            numberOfMonths: 1,
                            theme: 'dark-theme'
                        });

                </script>
            </div>

            <div class="col-12 m-auto col-lg-6">
                <asp:Label ID="Label7" runat="server" Text="Place of issue " for="txtIssuePlace"></asp:Label>
                <asp:TextBox ID="txtIssuePlace" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter place of passport issue"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="display" SetFocusOnError="true"  Display="Dynamic"
                    ErrorMessage="Passport issue place is required" ControlToValidate="txtIssuePlace" Text="*"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="row mr-1 mr-lg-0 mt-3">
            <div class="col-12 m-auto col-lg-6">
                <asp:Label ID="Label4" runat="server" Text="Visa Category" for="txtVisaCategory"></asp:Label>
                <asp:DropDownList ID="txtVisaCategory" runat="server"  Font-Names="Tahoma" CssClass="form-control" DataTextField="Category" DataValueField="ID"
                     OnSelectedIndexChanged="txtVisaCategory_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                

                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="display" SetFocusOnError="true" 
                    ErrorMessage="Visa category is required" ControlToValidate="txtVisaCategory" Text="*" InitialValue="-1"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

            </div>
            <div class="col-12 m-auto col-lg-6">
                <asp:Label ID="Label5" runat="server" Text="Visa Type" for="txtVisaType"></asp:Label>
                <asp:DropDownList ID="txtVisaType" runat="server"  Font-Names="Tahoma" CssClass="form-control" DataTextField="VisaType" DataValueField="ID">
                </asp:DropDownList>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="display" SetFocusOnError="true"  
                    ErrorMessage="Visa type is required" ControlToValidate="txtVisaType" Text="*" InitialValue="-1"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row mr-1 mr-lg-0 mt-3">
            <div class="col-12 m-auto col-md-8 col-lg-6">
                <asp:Button ID="Button2" runat="server" Text="Save and Continue" CssClass="btn btn-success btn-lg ml-1 ml-sm-5" OnClick="Button1_Click" />

            </div>
        </div>

        <div class="row mr-1 mr-lg-0">
            <div class="col-12 m-auto col-md-8">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Please check the errors"
                    ForeColor="Red" ShowMessageBox="True" ShowSummary="False" />
            </div>
        </div>
    </div>





</asp:Content>
