<%@ Page Title="BTP - Liste des projets" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="liste-projets.aspx.cs" Inherits="BTP.liste_projets" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-liste.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:GridView ID="GridViewProjets" runat="server" BorderWidth="0"></asp:GridView>
    </div>
    <% if (Session["type"].ToString() == "Directeur") { %>
    <a class="add" href="add-projet.aspx"><img src="icons/add.svg"/></a>
    <% } %>
</asp:Content>
