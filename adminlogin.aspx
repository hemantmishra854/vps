<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication2.adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="CSS/masterpage.css" rel="stylesheet" />

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 m-auto">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                        <a class="navbar-brand first" href="#">VisaProcessingSystem</a>
                    </nav>

                </div>

            </div>

        </div>
        <div class="offset-md-3 col-md-6 container" style="margin-top: 150px; background-color: #efeeee; border: solid 2px #f6dede;">
            <div class=" row form-group align-items-start mr-1">
                <div class="col-12 m-auto  pt-3">
                    <h3 style="color: blue;text-align:center">Admin Login Panel</h3>
                </div>
            </div>
            <div class=" row form-group align-items-start mr-2">
                <div class="col-12 m-auto col-md-6 offset-md-3">
                    <asp:Label ID="Label2" runat="server" Text="Email address" for="txtEmail1"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter email"></asp:TextBox>

                </div>
            </div>
            <div class="row form-group align-items-center mr-2">

                <div class="col-12 m-auto col-md-6 offset-md-3">

                    <asp:Label ID="Label3" runat="server" Text="Password" for="txtPassword"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter password" TextMode="Password"></asp:TextBox>
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
                    <asp:Button ID="Button1" runat="server" Text="Signin" class="btn btn-primary" OnClick="Button1_Click" />


                </div>
            </div>
            <div class=" row form-group align-items-start mr-2">
                <div class="col-12 m-auto col-md-6 offset-md-3">

                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>


    </form>

    <script src="jQuery/jquery-3.3.1.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
