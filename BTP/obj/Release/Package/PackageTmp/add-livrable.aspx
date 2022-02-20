<%@ Page Title="BTP - Ajouter un livrable" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="add-livrable.aspx.cs" Inherits="BTP.add_livrable" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/adding-style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <div class="form">
            <p>Envoyer un e-mail. Tous les champs marqués d'un astérisque * sont obligatoires.</p>
            <label for="nom">Nom de projet *</label>
            <input type="text" id="nom" runat="server" />
            <label for="respo">Responsable *</label>
            <input type="text" id="respo" runat="server" />
            <label for="tele">Téle *</label>
            <input type="text" id="tele" runat="server" />
            <label for="message">Intitule *</label>
            <textarea id="message" runat="server"></textarea>
        </div>
        <div class="buttons">
            <asp:Button ID="ButtonAjouter" runat="server" Text="Ajouter" OnClick="ButtonAjouter_Click" />
            <asp:Button ID="ButtonModifier" runat="server" Text="Modifier" OnClick="ButtonModifier_Click" />
            <asp:Button ID="ButtonRechercher" runat="server" Text="Rechercher" OnClick="ButtonRechercher_Click" />
            <asp:Button ID="ButtonSupprimer" runat="server" Text="Supprimer" OnClick="ButtonSupprimer_Click" />
            <asp:Button ID="ButtonValider" runat="server" Text="Valider" OnClick="ButtonValider_Click" />
            <asp:Button ID="ButtonAnnuler" runat="server" Text="Annuler" OnClick="ButtonAnnuler_Click" />
        </div>
    </div>
</asp:Content>
