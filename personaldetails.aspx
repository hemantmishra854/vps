<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="personaldetails.aspx.cs" unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm35" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row mr-1 mr-md-0 mb-5">
            <div class="col-12 m-auto col-md-6">
                <h3 class="text-primary text-center">Fill Your Personal Details</h3>
            </div>
        </div>
        <div class="row mr-1 mr-md-0 mb-3">
            <div class="col-12 col-md-6">
                <asp:Label ID="Label3" runat="server" Text="Father's Name" for="txtFather"></asp:Label>
                <asp:TextBox ID="txtFather" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter father's name"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" SetFocusOnError="true"
                    ErrorMessage=" Father's name is required" ControlToValidate="txtFather" Display="Dynamic"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid name" SetFocusOnError="true"
                    ControlToValidate="txtFather" ForeColor="Red" ValidationExpression="^[a-zA-Z]*$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label2" runat="server" Text="Mother's Name" for="txtMother"></asp:Label>
                <asp:TextBox ID="txtMother" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter mother's name"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" Display="Dynamic"
                    ErrorMessage=" mother's name is required" ControlToValidate="txtMother"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid name" SetFocusOnError="true"
                    ControlToValidate="txtMother" ForeColor="Red" ValidationExpression="^[a-zA-Z]*$" Display="Dynamic"></asp:RegularExpressionValidator>


            </div>
        </div>
        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Date of birth" for="txtDOB"></asp:Label>
                <asp:TextBox ID="txtDOB" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter date of birth"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="true"
                    ErrorMessage=" Date of birth is required" ControlToValidate="txtDOB"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <script type="text/javascript">
                    var picker = new Pikaday(
                        {
                            field: document.getElementById('<%=txtDOB.ClientID%>'),
                            firstDay: 1,
                            minDate: new Date('1950-01-01'),
                            maxDate: new Date('2020-12-31'),
                            yearRange: [1950, 2020],
                            numberOfMonths: 1,
                            theme: 'dark-theme'
                        });

                </script>

            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label6" runat="server" Text="Contact Number" for="txtContact"></asp:Label>
                <asp:TextBox ID="txtContact" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter contact number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ErrorMessage="contact number is required" ControlToValidate="txtContact" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid mobile number" SetFocusOnError="true"
                    ControlToValidate="txtContact" ForeColor="Red" ValidationExpression="^[7-9]{1}[0-9]{9}$">
                </asp:RegularExpressionValidator>

            </div>
        </div>
        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-4 form-control">
                <div class="form-check form-check-inline">
                    <label class="form-check-label" for="gender">Gender:</label>
                </div>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rdoMale" runat="server" GroupName="gender" CssClass="form-check-input" Text="Male" Checked="true" />
                    <label class="form-check-label" for="rdoMale"></label>
                </div>
                <div class="form-check form-check-inline">
                    <asp:RadioButton ID="rdoFemale" runat="server" GroupName="gender" CssClass="form-check-input" Text="Female" />
                    <label class="form-check-label" for="rdoFemale"></label>
                </div>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label10" runat="server" Text="Qualification" for="txtDegree"></asp:Label>
                <asp:DropDownList ID="txtDegree" runat="server" CssClass="form-control" aria-describedby="emaihelp">
                    <asp:ListItem Value="1" Text="Metric"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Graduate"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Post Graduate"></asp:ListItem>
                    <asp:ListItem Value="4" Text="None"></asp:ListItem>
                    <asp:ListItem Selected="True" Value="-1" Text="-Select one-"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true"
                    ErrorMessage="Degree  is required" ControlToValidate="txtDegree" ForeColor="Red" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label11" runat="server" Text="Marritul Status" for="txtStatus"></asp:Label>
                <asp:DropDownList ID="txtStatus" runat="server" CssClass="form-control" aria-describedby="emaihelp">
                    <asp:ListItem Value="1" Text="Single"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Married"></asp:ListItem>
                    <asp:ListItem Selected="True" Value="-1" Text="-Select one-"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="display" SetFocusOnError="true"
                    ErrorMessage="Marritul status  is required" ControlToValidate="txtStatus" ForeColor="Red" InitialValue="-1">
                </asp:RequiredFieldValidator>
            </div>

        </div>
        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label7" runat="server" Text="Street" for="txtStreet"></asp:Label>
                <asp:TextBox ID="txtStreet" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter street name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ErrorMessage="street name is required" ControlToValidate="txtStreet" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="Label5" runat="server" Text="City" for="txtCity"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter city name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ErrorMessage="city name is required" ControlToValidate="txtCity" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-4">
                <asp:Label ID="Label8" runat="server" Text="State" for="txtState"></asp:Label>
                <asp:TextBox ID="txtState" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter state name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="state name is required" ControlToValidate="txtState" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-12 m-auto col-md-5">
                <asp:Label ID="Label9" runat="server" Text="Country" for="txtCounty"></asp:Label>
                <asp:TextBox ID="txtCountry" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="India" ReadOnly="true" Text="India"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="country name is required" ControlToValidate="txtCountry" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-12 m-auto col-md-3">
                <asp:Label ID="Label4" runat="server" Text="Zip Code" for="txtZip"></asp:Label>
                <asp:TextBox ID="txtZip" runat="server" class="form-control" aria-describedby="emaihelp" placeholder="Enter zip code"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ErrorMessage="zip code is required" ControlToValidate="txtZip" SetFocusOnError="true"
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

        </div>

        <div class="row mr-1 mr-md-0 mb-3">
            <div class="col-12 m-auto col-md-6">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row mr-1 mr-md-0 ">
            <div class="col-12 m-auto col-md-8 col-lg-6">

                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary btn-lg" NavigateUrl="~/welcome.aspx">
                            Back</asp:HyperLink>

                <asp:Button ID="Button1" runat="server" Text="Save and Continue" CssClass="btn btn-success btn-lg ml-1 ml-sm-5" OnClick="Button1_Click" />

            </div>
        </div>


        <div class="row mr-1 mr-md-0">
            <div class="col-12 m-auto col-md-8">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fix the following errors:" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ShowModelStateErrors="False" />
            </div>
        </div>
    </div>
</asp:Content>
