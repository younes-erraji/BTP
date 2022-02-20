<%@ Page Title="BTP - Utilisateurs" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="utilisateurs.aspx.cs" Inherits="BTP.utilisateurs" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-users.css" rel="stylesheet" />
    <script>
        window.onload = _ => {
            $('.container .buttons span').on('click', function () {
                $(this).addClass('active').siblings().removeClass('active');
                $(`.${$(this).data('content')}`).fadeIn(800).css('display', 'grid').siblings('section').fadeOut(100);
            });
        };
    </script>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <div class="buttons">
            <span data-content="liste" class="active">Liste Des Utilisateurs</span>
            <span data-content="mise">Mise A Jour Des Utilisiteurs</span>
        </div>
        <hr />
        <div class="navigation">
            <section class="liste">
                <asp:GridView ID="GridViewUtilisateurs" runat="server" CssClass="grid" BorderWidth="0" ShowHeaderWhenEmpty="true" />
            </section>
            <section class="mise">
                <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <p style="color: red;"><asp:Label ID="LabelErreur" runat="server" Text=" "></asp:Label></p>
                <table>
                    <tr>
                        <td>CIN</td>
                        <td colspan="2"><asp:TextBox ID="TextBoxCIN" runat="server" /><td>
                    </tr>
                    <tr>
                        <td>Prenom</td>
                       <td colspan="2"><asp:TextBox ID="TextBoxPrenom" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Nom</td>
                        <td colspan="2"><asp:TextBox ID="TextBoxNom" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Nom D'Utilisateur</td>
                        <td colspan="2">
                            <asp:TextBox ID="TextBoxUsername" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Mot De Passe</td>
                        <td colspan="2">
                            <asp:TextBox ID="TextBoxMP" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td colspan="2"><asp:DropDownList ID="DropDownListType" runat="server" /></td>
                    </tr>
                </table>
                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ButtonRechercher" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="vr"></div>
                <div class="edit-users">
                    <asp:Button ID="ButtonAjouter" runat="server" Text="Ajouter" OnClick="ButtonAjouter_Click" style="height: 21px" />
                    <asp:Button ID="ButtonRechercher" runat="server" Text="Rechercher" OnClick="ButtonRechercher_Click" />
                    <asp:Button ID="ButtonAfficher" runat="server" Text="Afficher" OnClick="ButtonAfficher_Click" />
                </div>
            </section>
        </div>
    </div>
</asp:Content>