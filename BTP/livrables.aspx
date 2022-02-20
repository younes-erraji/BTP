<%@ Page Title="BTP - Livrables" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    Connexion c = new Connexion();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e) {
        if (Session["user"] == null) {
            Response.Redirect("connexion.aspx");
        } else if(!IsPostBack) {
            if (Session["type"].ToString() == "Directeur") {
                dt = c.SelectQueries("Select L.codeP 'code Projet', nomProjet as 'Nom Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' From Livrable L inner Join Projet P on P.CodeP = L.codeP");
            } else {
                dt = c.SelectQueries($"Select L.codeP 'code Projet', nomProjet as 'Nom Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' From Livrable L inner Join Projet P on P.CodeP = L.codeP Where P.responsable = '{Session["user"]}'");
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
            <h2>Projet : <%=dt.Rows[i][1] %></h2>
            <p><%=dt.Rows[i][2] %></p>
            <p> <%=dt.Rows[i][3] %></p>
            <em>Date LEs</em>
            <strong><%=dt.Rows[i][4] + " / " + dt.Rows[i][5] %></strong>
            <div><%=dt.Rows[i][6] %> / <%=dt.Rows[i][7] %></div>
            <strong><%=dt.Rows[i][8] %></strong>
        </article>
        <%} %>
    </div>
    <a class="add" href="add-livrable.aspx"><img src="icons/add.svg"/></a>
</asp:Content>