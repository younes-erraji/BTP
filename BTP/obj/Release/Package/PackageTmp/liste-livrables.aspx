<%@ Page Title="BTP - Liste des livrables" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="liste-livrables.aspx.cs" Inherits="BTP.liste_livrables" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-liste.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:GridView ID="GridViewLivrables" runat="server"></asp:GridView>
    </div>
    <a class="add" href="#"><img src="icons/add.svg"/></a>
</asp:Content>
