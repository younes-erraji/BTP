<%@ Page Title="BTP - Projets" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="add-projet.aspx.cs" Inherits="BTP.add_projet" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/adding-style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
        <ContentTemplate>
        <div class="form">
            <p>Tous les champs marqués d'un astérisque * sont obligatoires.</p>
            <div><asp:Label ID="LabelError" runat="server" ForeColor="Red" /></div>
            <label for="codeProjet">Code de projet <asp:RequiredFieldValidator ID="RequiredFieldValidatorCodeProjet" runat="server" ErrorMessage="*" ControlToValidate="codeProjet" ForeColor="Red" ValidationGroup="Mise" /></label>
            <input type="text" id="codeProjet" runat="server" />
            <label for="nomProjet">Nom de projet *</label>
            <input type="text" id="nomProjet" runat="server" />
            <label for="intitule">Intitule *</label>
            <textarea id="intitule" runat="server"></textarea>
            <label for="DropDownListRespo">Responsable *</label>
            <asp:DropDownList ID="DropDownListRespo" runat="server" />
            <label for="DropDownListStatut">Statut *</label>
            <asp:DropDownList ID="DropDownListStatut" runat="server" />
            <label for="txtDateDebutP">Date Debut de projet *</label>
            <asp:TextBox ID="txtDateDebutP" runat="server" TextMode="Date" />
            <label for="DatePrevueFin">Date Prévue : La fin de projet *</label>
            <asp:TextBox ID="txtDatePrevueFin" runat="server" TextMode="Date" />
        </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="ButtonModifier" EventName="Click"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="ButtonSupprimer" EventName="Click"></asp:AsyncPostBackTrigger>
            <asp:AsyncPostBackTrigger ControlID="ButtonRechercher" EventName="Click"></asp:AsyncPostBackTrigger>
        </Triggers>
        </asp:UpdatePanel>
        <div class="buttons">
            <asp:Button ID="ButtonAjouter" runat="server" Text="Ajouter" OnClick="ButtonAjouter_Click" ValidationGroup="Mise" />
            <asp:Button ID="ButtonModifier" runat="server" Text="Modifier" OnClick="ButtonModifier_Click" ValidationGroup="Mise" />
            <asp:Button ID="ButtonRechercher" runat="server" Text="Rechercher" OnClick="ButtonRechercher_Click" ValidationGroup="Mise" />
            <asp:Button ID="ButtonSupprimer" runat="server" Text="Supprimer" OnClick="ButtonSupprimer_Click" ValidationGroup="Mise" />
            <asp:Button ID="ButtonAfficher" runat="server" Text="Afficher" OnClick="ButtonAfficher_Click" />
        </div>
    </div>
</asp:Content>
