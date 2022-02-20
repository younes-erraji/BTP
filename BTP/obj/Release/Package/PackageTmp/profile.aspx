<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="BTP.profile" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
    <div class="card">
        <div class="option">
            <svg style="enable-background: new 0 0 48 48;" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <g>
                    <g>
                        <path d="M24,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C28,26.2,26.2,28,24,28z M24,22c-1.1,0-2,0.9-2,2    c0,1.1,0.9,2,2,2c1.1,0,2-0.9,2-2C26,22.9,25.1,22,24,22z" />
                    </g>
                    <g>
                        <path d="M10,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4s4,1.8,4,4C14,26.2,12.2,28,10,28z M10,22c-1.1,0-2,0.9-2,2c0,1.1,0.9,2,2,2    s2-0.9,2-2C12,22.9,11.1,22,10,22z" />
                    </g>
                    <g>
                        <path d="M38,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4s4,1.8,4,4C42,26.2,40.2,28,38,28z M38,22c-1.1,0-2,0.9-2,2c0,1.1,0.9,2,2,2    s2-0.9,2-2C40,22.9,39.1,22,38,22z" />
                    </g>
                </g><g /></svg></div>
        <img src="../images/users.png">
        <h2>@<asp:Label ID="LabelUserName" runat="server" Text="" /></h2>
        <h3>bio</h3>
        <p class="bio">to know and not to do, is not yet to know.</p>
        <hr>
        <h4>Projets</h4>
        <div class="actual"><span>Actual</span><strong>12</strong></div>
        <div class="finished"><span>Finished</span><strong>69</strong></div>
    </div>
    <div class="projets">
        <h2>Projets by <strong>Younes ERRAJI</strong></h2>
        <ul>
            <li>
                <section></section>
            </li>
        </ul>
    </div>
    </div>
</asp:Content>
