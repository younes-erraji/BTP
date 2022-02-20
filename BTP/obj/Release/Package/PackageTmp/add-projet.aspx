<%@ Page Title="BTP - Ajouter une projet" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="add-projet.aspx.cs" Inherits="BTP.add_projet" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/adding-style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <div class="form">
            <p>Envoyer un e-mail. Tous les champs marqués d'un astérisque * sont obligatoires.</p>
            <div><asp:Label ID="LabelError" runat="server" ForeColor="Red" /></div>
            <label for="codeProjet">Code de projet <asp:RequiredFieldValidator ID="RequiredFieldValidatorCodeProjet" runat="server" ErrorMessage="*" ControlToValidate="codeProjet" ForeColor="Red" /></label>
            <input type="text" id="codeProjet" runat="server" />
            <div><asp:RegularExpressionValidator ID="RegularExpressionValidatorCodeProjet" runat="server" ErrorMessage="A0000" ControlToValidate="codeProjet" ForeColor="Red" ValidationExpression="^[A-z]{1}[0-9]+" /></div>
            <label for="nomProjet">Nom de projet *</label>
            <input type="text" id="nomProjet" runat="server" />
            <label for="intitule">Intitule *</label>
            <textarea id="intitule" runat="server"></textarea>
            <label for="respo">Responsable *</label>
            <input type="text" id="respo" runat="server" />
            <label for="statut">Statut *</label>
            <asp:DropDownList ID="DropDownListStatut" runat="server" />
            <label for="DatePrevueFin">Date Prevue Fin *</label>
            <input type="date" id="DatePrevueFin" runat="server" />
        </div>
        <div class="buttons">
            <asp:Button ID="ButtonAjouter" runat="server" Text="Ajouter" OnClick="ButtonAjouter_Click" />
            <asp:Button ID="ButtonModifier" runat="server" Text="Modifier" OnClick="ButtonModifier_Click" />
            <asp:Button ID="ButtonRechercher" runat="server" Text="Rechercher" OnClick="ButtonRechercher_Click" />
            <asp:Button ID="ButtonSupprimer" runat="server" Text="Supprimer" OnClick="ButtonSupprimer_Click" />
        </div>
    </div>
</asp:Content>
