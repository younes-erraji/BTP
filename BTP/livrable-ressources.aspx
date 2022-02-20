<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="livrable-ressources.aspx.cs" Inherits="BTP.livrable_ressources" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style>
        .container table tr td {
            width: 25%;
        }
        .container table tr td input:not([type="submit"]),
        .container table tr td select {
          background-color: #fff;
          border: 0;
          border-bottom: 2px solid #3f3f3f;
          color: #666;
          padding: 0.4rem 1.4rem;
          width: 88%;
          margin-bottom: 0.8rem;
        }
        .container table tr td input[type="submit"] {
            width: 90%;
            padding: 0.3em 1.2em;
            margin: 14px 0;
            border: 1px solid rgba(255, 255, 255, 0);
            border-radius: 4px;
            color: #ffffff;
            transition: border-color 0.8s;
            cursor: pointer;
            background-color: #ff9865;
        }
        .container table tr td input[type="submit"]:hover {
            border-color: white;
        }
        .container table tr td:first-child input[type="submit"] {
            background-color: #f14e4e;
        }
        .container table tr td:nth-child(2) input[type="submit"] {
            background-color: #f1bb4e;
        }
        .container table tr td:nth-child(3) input[type="submit"] {
            background-color: #84f14e;
        }
        .container table tr td:last-child input[type="submit"] {
            background-color: #eebc48;
        }
        hr {
            border: none;
            border-bottom: 2px dotted #aec178;
            margin: 18px 0;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
        }
        .grid tr {
            border: none;
            border-bottom: 0.4px solid #ddd;
            border-top: 0.4px solid #ddd;
        }
        .grid tr td, .grid tr th {
            text-align: center;
            padding: 0.8rem 0;
            border: none;
        }
        .grid tr th {
            color: #888;
        }
        .grid tr:nth-child(even) {
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:scriptmanager runat="server"></asp:scriptmanager>
        <table style="width: 100%;">
            <tr>
                <td>Type Ressource</td>
                <td colspan="3">
                    <asp:updatepanel ID="UpdatePanelTR" runat="server">
                    <ContentTemplate>
                    <asp:dropdownlist ID="DropDownListTypeRessource" runat="server" OnSelectedIndexChanged="DropDownListTypeRessource_SelectedIndexChanged" AutoPostBack="True" />
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ButtonNouveau" EventName="Click" />
                        </Triggers>
                    </asp:updatepanel>
                </td>
            </tr>
            <tr>
                <td>Ressource</td>
                <td colspan="3">
                        <asp:updatepanel ID="UpdatePanelRessource" runat="server">
                        <ContentTemplate>
                            <asp:dropdownlist ID="DropDownListRessource" runat="server"></asp:dropdownlist>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="DropDownListTypeRessource" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="ButtonNouveau" EventName="Click" />
                        </Triggers>
                    </asp:updatepanel>
                </td>
            </tr>
            <tr>
                <td>Quantite</td>
                <td colspan="3">
                    <asp:updatepanel ID="UpdatePanelQt" runat="server">
                    <ContentTemplate>
                    <asp:textbox ID="TextBoxQt" runat="server" />
                    <asp:RequiredFieldValidator ID="RFVQt" runat="server" ErrorMessage="*" ControlToValidate="TextBoxQt" ValidationGroup="Qte" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="ButtonNouveau" EventName="Click" />
                    </Triggers>
                    </asp:updatepanel>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:updatepanel ID="UpdatePanelException" runat="server">
                    <ContentTemplate>
                    <asp:Label ID="LabelException" runat="server" />
                    </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
                        </Triggers>
                    </asp:updatepanel>
                </td>
            </tr>
            <tr>
                <td><asp:button ID="ButtonAjouter" runat="server" text="Ajouter" OnClick="ButtonAjouter_Click" ValidationGroup="Qte" /></td>
                <td><asp:button ID="ButtonValider" runat="server" text="Valider" OnClick="ButtonValider_Click" /></td>
                <td><asp:button ID="ButtonAnnuler" runat="server" text="Annuler" OnClick="ButtonAnnuler_Click" /></td>
                <td><asp:button ID="ButtonNouveau" runat="server" text="Nouveau" OnClick="ButtonNouveau_Click" /></td>
            </tr>
        </table>
        <hr />
        <asp:updatepanel ID="UpdatePanelGrid" runat="server">
        <ContentTemplate>
        <asp:GridView ID="GridViewTest" runat="server"  CssClass="grid" ShowHeaderWhenEmpty="true" BorderWidth="0"></asp:GridView>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ButtonAjouter" EventName="Click" />
            </Triggers>
        </asp:updatepanel>
    </div>
</asp:Content>
