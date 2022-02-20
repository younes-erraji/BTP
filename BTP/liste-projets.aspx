<%@ Page Title="BTP - Projets" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="liste-projets.aspx.cs" Inherits="BTP.liste_projets" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-liste.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <asp:ScriptManager ID="mainScriptManager" runat="server"></asp:ScriptManager>
        <table class="system">
            <tr>
                <td><label for="DropDownListResponsable">Responsable</label></td>
                <td colspan="3"><asp:DropDownList ID="DropDownListResponsable" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListResponsable_SelectedIndexChanged" /></td>
            </tr>
            <tr>
                <td><label for="txtDateDebPr">Date Debut Projet</label></td>
                <td>
                    <div class="align">
                    <asp:TextBox ID="txtDateDebPr" runat="server" TextMode="Date" />
                    </div>
                </td>
                <td><label for="txtDateFinsPr">Date Fin Projet</label></td>
                <td>
                    <div class="align">
                    <asp:TextBox ID="txtDateFinsPr" runat="server" TextMode="Date" />
                    <asp:ImageButton ID="ImageButtonFilter" runat="server" CssClass="filter" ImageUrl="~/icons/filter.svg" OnClick="ImageButtonFilter_Click" />
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
        <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridViewProjets" runat="server" CssClass="grid" BorderWidth="0" ShowHeaderWhenEmpty="True"></asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DropDownListResponsable" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ImageButtonFilter" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        
    </div>
    <% if (Session["type"].ToString() == "Directeur") { %>
    <a class="add" href="add-projet.aspx"><img src="icons/add.svg"/></a>
    <% } %>
</asp:Content>
