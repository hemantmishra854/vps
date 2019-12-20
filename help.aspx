<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="WebApplication2.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="master" runat="server">
   <div class="container-fluid" style="margin-top: 100px; margin-bottom: 50px;">
        <div class="row">
            <div class="col-12 m-auto text-justify">
                <h2 class="text-info" style="text-decoration: underline">Help</h2>
             <p class="paragraph">The about us section contain essential information about the developer/sponsor and comprise of the following information:-</p>
            <ul>
                <li>Program and Schemes</li>
                <p>Welfare programs and Schemes benefitting the individual, citizens and businesses/community are presented in this section.</p>

                <li>Application Forms </li>
                <p>
                    All application forms available on the website are presented in this section of the website. These forms can be downloaded from the website for availing 
                 services of this website.
                </p>
                <li>Acts and Rules</li>
                <p>
                    All Acts passed by the Parliament/State legislative assembly of the concerned Ministry are presented in this section of the website. Further, 
                  the Rules/Sub-ordinate legislations issued by the Ministry based on those Acts are also displayed for reference.
                </p>
                <li>Document and Reports</li>
                <p>
                    All documents, Reports and Articles published by the sponsor  are presented in the Document and Report section of the website. This section is frequently
                  updated and all recent articles are added to this section.
                </p>
                <li>Circular and Notifications </li>
                <p>
                    Various Circulars/Notifications that are released from time to time by the sponsor are provided in this section. Information about the  Circular/Notification
               Tender's Procurement notices and tenders released by the Ministry for goods, services and other works can be viewed by the tenders section.
                </p>
            </ul>
            <h3>Feedback</h3>
            <p>
                For receiving feedbacks from the Users and citizens the owner  has provided the  Feedback module. All users can provide the feedback through the feedback 
                 form provided in this section of the website.
            </p>
            <h3>Using the Search Facility</h3>
            <p>
                Simple search will be available on home page from where user can search on basis of content and keyword available in documents/reports/picture/press release/news.
                 Specific search is given on specific pages with the functionality of searching with Keywords, location, title, subject, Ministry etc.
            </p>

            <h3>Searching Tips</h3>
            <p>
                When searching, don't enter plural forms such as "press releases" because the server will only find documents with releases (plural) in the title or keywords. 
                 If you enter release (singular), the server will list entries with both release and releases.All searches are case-insensitive. That is, words are looked for regardless of capitalization.
            </p>
    </div>
            </div>
       </div>
</asp:Content>
