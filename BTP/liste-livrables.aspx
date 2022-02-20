<%@ Page Title="BTP - Livrables" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="liste-livrables.aspx.cs" Inherits="BTP.liste_livrables" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-liste.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:ScriptManager ID="ScriptManagerLivrables" runat="server"></asp:ScriptManager>
        <table class="system">
            <tr>
                <td><label for="DropDownListProjets">Projets</label></td>
                <td colspan="3"><asp:DropDownList ID="DropDownListProjets" runat="server" OnSelectedIndexChanged="DropDownListProjets_SelectedIndexChanged" AutoPostBack="true" /></td>
            </tr>
            <tr>
                <td><label for="txtDateDebLR">Date Debut Livrable</label></td>
                <td>
                    <div class="align">
                    <asp:TextBox ID="txtDateDebLR" runat="server" TextMode="Date" />
                    </div>
                </td>
                <td><label for="txtDateFinLR">Date Fin Livrable</label></td>
                <td>
                    <div class="align">
                        <asp:TextBox ID="txtDateFinLR" runat="server" TextMode="Date" />
                        <asp:ImageButton ID="ImageButtonFilter" runat="server" CssClass="filter" ImageUrl="~/icons/filter.svg" OnClick="ImageButtonFilter_Click" ValidationGroup="Filter" />
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td colspan="2">
                    <asp:UpdatePanel ID="UpdatePanelError" runat="server">
                        <ContentTemplate>
                            <asp:label ID="LabelErrorMessage" runat="server" CssClass="fill-text" text=" " />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ImageButtonFilter" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <hr />
        <asp:UpdatePanel ID="UpdatePanelLivrables" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridViewLivrables" runat="server" CssClass="grid" BorderWidth="0" ShowHeaderWhenEmpty="True" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DropDownListProjets" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ImageButtonFilter" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
    <a class="add" href="add-livrable.aspx"><img src="icons/add.svg"/></a>
</asp:Content>
