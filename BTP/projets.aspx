<%@ Page Title="BTP - Projets" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    DataTable dt;
    Connexion c = new Connexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null) {
            Response.Redirect("connexion.aspx");
        } else if(!IsPostBack) {
            Session["Title"] = "Projets";
            // dt = new DataTable();
            
            if (Session["type"].ToString() == "Directeur") {
                dt = c.SelectQueries("Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin' From Projet");
            } else {
                dt = c.SelectQueries($"Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin' From Projet Where responsable = '{Session["user"]}'");
            }
        }
    }
</script>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/styling.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <%for (int i = 0; i < dt.Rows.Count; i++) { %>
        <article>
            <h2>Title : <%=dt.Rows[i][1] %></h2>
            <p><%=dt.Rows[i][2] %></p>
            <h3>Responsable : <%=dt.Rows[i][3] %></h3>
            <strong>Statut : <%=dt.Rows[i][4] %></strong>
            <div><%=dt.Rows[i][5] %> / <%=dt.Rows[i][6] %></div>
        </article>
        <%} %>
    </div>
    <% if (Session["type"].ToString() == "Directeur") { %>
    <a class="add" href="add-projet.aspx"><img src="icons/add.svg"/></a>
    <% } %>
</asp:Content>
