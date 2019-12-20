<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="WebApplication2.changepassword" %>

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
        <div class="offset-md-3 col-md-6 container-fluid" style="margin-top: 150px; background-color: #efeeee; border: solid 2px #f6dede;">
            <div class=" row form-group align-items-start mr-1">
                <div class="col-12 m-auto col-md-6 offset-md-3 pt-3">
                    <a class="navbar-brand first" href="#">VisaProcessingSystem
                    </a>

                </div>
            </div>

            <div class=" row form-group align-items-start mr-1">
                <div class="col-12 m-auto col-md-6 offset-md-3 pt-3">
                    <h3 style="color: blue">Change Your Password</h3>
                </div>
            </div>
            <div class="row form-group align-items-center mr-2">

                <div class="col-12 m-auto col-md-6 offset-md-3">

                    <asp:Label ID="Label3" runat="server" Text=" New Password" for="txtPass"></asp:Label>
                    <asp:TextBox ID="txtPass" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group align-items-center mr-2">

                <div class="col-12 m-auto col-md-6 offset-md-3">

                    <asp:Label ID="Label4" runat="server" Text="Confirm New Password" for="txtConfirmPass"></asp:Label>
                    <asp:TextBox ID="txtConfirmPass" runat="server" class="form-control" aria-describedby="emailHelp" placeholder="Re-enter password" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class=" row form-group align-items-center mr-2">
                <div class="col-12 m-auto col-md-3 offset-md-7">
                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class=" row form-group align-items-center mr-2">
                <div class="col-12 m-auto col-md-3 offset-md-7">
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
            </div>

        </div>

    </form>

    <script src="jQuery/jquery-3.3.1.js"></script>
    <script src="Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
