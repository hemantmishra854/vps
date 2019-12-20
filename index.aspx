<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/home.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">


    <div class="container-fluid text-justify" style="margin-top: 100px; margin-bottom: 100px;">
        <div class="row">
            <div class="col-12 m-auto">
                <div id="visaCarousel" class="carousel slide" data-ride="carousel" data-interval="3000" data-pause="hover">
                    <ol class="carousel-indicators">
                        <li data-target="#visaCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#visaCarousel" data-slide-to="1"></li>
                        <li data-target="#visaCarousel" data-slide-to="2"></li>
                    </ol>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="img-fluid d-block  w-100" src="images/1.jpg" alt="First slide" style="height: 350px" />
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid d-block w-100" src="images/2.jpg" alt="Second slide" style="height: 350px" />
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid d-block w-100" src="images/3.jpg" alt="Third slide" style="height: 350px" />
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#visaCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#visaCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-md-3 col-lg-3 m-auto">
                <h3 style="margin-top: 10px; color: #ff6a00">Visa Information</h3>

                <asp:Menu ID="Menu2" runat="server" DynamicHorizontalOffset="0" Font-Names="Verdana"
                    Font-Size="14px" StaticSubMenuIndent="10px"
                    Height="350px">
                    <DynamicHoverStyle BackColor="Black" ForeColor="#CC3300" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#FFFBD6" />
                    <DynamicSelectedStyle BackColor="#FFCC66" />
                    <Items>
                        <asp:MenuItem Text="What Is Visa " Value="What Is Visa" NavigateUrl="~/index.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Types Of Visa" Value="Types Of Visa" NavigateUrl="~/typesofvisa.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Process To Get Visa" Value="Process To Get Visa" NavigateUrl="~/processtogetvisa.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Visa Free Countries" Value="Visa Free Countries"></asp:MenuItem>
                        <asp:MenuItem Text="Countries Required Visa" Value="Countries Required Visa"></asp:MenuItem>
                        <asp:MenuItem Text="Travelling Charges" Value="Travelling Charges"></asp:MenuItem>
                        <asp:MenuItem Text="Indian Passengers" Value="Indian Passengers" NavigateUrl="~/indianpassengers.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="ENCR/ECR" Value="ENCR/ECR" NavigateUrl="~/encr.aspx"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#333333" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="5px" />
                    <StaticMenuStyle HorizontalPadding="20px" VerticalPadding="15px" />
                    <StaticSelectedStyle BackColor="#333333" />
                </asp:Menu>
            </div>
            <div class="col-12 col-sm-12 col-md-9 col-lg-9 m-auto">
                <h1 style="margin-top: 10px; color: #ff6a00; text-decoration: underline;">Overview</h1>
                <p class="paragraph">
                    Visa is a mandate to enjoy trip to any country.It is an administrative restriction that is forced by the authorities  of other countries on Indian
             citizens when they desire to visit the particular country .Thus ,visa for Indian are made easy by most of the countries of the world in 2016 and
             Indian citizens have an opportunity to facilitate no visa while travelling to around 52 countries of the world. 
                </p>
                <p class="paragraph">
                    A visa generally gives non-citizens clearance to enter a country and to remain there within specified constraints, such as a time frame for entry, a limit on the
               time spent in the country, and a prohibition against employment. Some countries do not require a visa in some situations, such as a result of reciprocal treaty 

                 arrangements. The possession of a visa is not in itself a guarantee of entry into the country that issued it, and a visa can be revoked at any time.

            A visa application in advance of arrival gives the country a chance to consider the applicant's circumstance, such as financial security, reason for applying, and 

          details of previous visits to the country. A visitor may also be required to undergo and pass security or health checks upon arrival at the border.


                </p>
                <p class="paragraph">
                    Indian are permitted to Bhutan and Nepal without any visa despite of the purpose of trip.Indian passport is ranked at the 85th  position in the 
            world and  easily avails the permission of visiting various countries of world. Thus here the complete datails is provided on visa requirements for
             Indian citizens to various disputed areas,territories, restricted zones,and partially recognized countries.
                </p>


            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6">
                

            </div>
            <div class="col-12 col-sm-6">
                

            </div>

        </div>

    </div>

</asp:Content>
