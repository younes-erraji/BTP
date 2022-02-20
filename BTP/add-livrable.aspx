<%@ Page Title="BTP - Livrables" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="add-livrable.aspx.cs" Inherits="BTP.add_livrable" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/adding-style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <div class="form">
        <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
        <ContentTemplate>
            <p>Tous les champs marqués d'un astérisque * sont obligatoires.</p>
            <div><asp:Label ID="LabelError" runat="server" ForeColor="Red" /></div>
            <label for="IDLivrable">ID Livrable </label>
            <input type="text" id="IDLivrable" runat="server" />
            <label for="DropDownListProjets">projet *</label>
            <asp:DropDownList ID="DropDownListProjets" runat="server" />
            <label for="intitule">Intitule *</label>
            <input type="text" id="intitule" runat="server" />
            <label for="description">Description *</label>
            <textarea id="description" runat="server"></textarea>
            <label for="DateDebLes">Date Debut *</label>
            <input type="date" id="DateDebLes" runat="server" />
            <label for="DateFinLes">Date Fin *</label>
            <input type="date" id="DateFinLes" runat="server" />
            <label for="DateDebLR">Date Debut *</label>
            <input type="date" id="DateDebLR" runat="server" />
            <label for="DateFinLR">Date Debut *</label>
            <input type="date" id="DateFinLR" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ButtonModifier" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ButtonRechercher" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="ButtonSupprimer" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
        </div>
        <div class="buttons">
            <asp:Button ID="ButtonAjouter" runat="server" Text="Ajouter" OnClick="ButtonAjouter_Click" />
            <asp:Button ID="ButtonModifier" runat="server" Text="Modifier" OnClick="ButtonModifier_Click" />
            <asp:Button ID="ButtonRechercher" runat="server" Text="Rechercher" OnClick="ButtonRechercher_Click" />
            <asp:Button ID="ButtonSupprimer" runat="server" Text="Supprimer" OnClick="ButtonSupprimer_Click" />
            <asp:Button ID="ButtonAfficher" runat="server" Text="Afficher" OnClick="ButtonAfficher_Click" />
            <asp:Button ID="ButtonSuivant" runat="server" Text="Suivant" OnClick="ButtonSuivant_Click" />
        </div>
    </div>
</asp:Content>
