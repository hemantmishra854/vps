<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="visacancellation.aspx.cs" unobtrusivevalidationmode="none"
    Inherits="WebApplication2.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table {
            margin-top:40px;
            margin:auto;
            font-family:Tahoma Arial;   
        }
        .lbl {
            font:20px bold;
            color:white;
            padding-left:20px;
            padding-top:30px;
        
        }
        .btn {
            text-align:center;
            color:#2b2a5f;
            border-radius:10px;
            font-size:large;
            width:50%;
            height:35px ;
            border:none;
            margin-bottom:50px;
        }
            .btn:hover {
                background-color:#2b2a5f;
                color:white ;
            }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
    <div style="width:100%;height:auto ">
        <fieldset style="margin:auto;width:35%;height:auto ;margin-top  :50px;border-color:#000">
            <legend style="font-family: Tahoma; font-size: x-large; font-weight: bold; font-style: oblique; font-variant: small-caps; color: #FF6600;">
            Visa Cancellation
            </legend>
        <table class="table">
            <tr>
                <td class="lbl">Visa Number:</td>
                <td class="lbl">
                    <asp:TextBox ID="visano" runat="server" Height="25px"></asp:TextBox>
                </td>
                <td style="padding-top:30px">
                    <asp:RequiredFieldValidator ID="Required" runat="server" ErrorMessage="Enter Your Visa Number" Text="*" ForeColor="red" ControlToValidate="visano">

                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="lbl" style="text-align:center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn" />
                </td>
            </tr>
        </table>
            </fieldset>

    </div>

</asp:Content>
