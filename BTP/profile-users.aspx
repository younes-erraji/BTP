<%@ Page Title="BTP - Utilisateur" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    Connexion c = new Connexion();
    DataTable t, dt, dt_;
    string actual, finished;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        { Response.Redirect("connexion.aspx"); }
        else if (!IsPostBack) {
            Session["Title"] = "Profile";
            t = (DataTable)Application["show-user"];
            dt = c.SelectQueries($"Select  U.CIN, U.Prenom, U.Nom  from [Login] L Inner Join Utilisateur U on U.Login = L.username Where L.username = '{t.Rows[0][0].ToString() }'");
            finished = c.ScalarQueries($"Select  count(*)  from Projet P Inner join [Login] L On L.username = P.Responsable Inner Join Utilisateur U on U.Login = L.username Where L.username = '{t.Rows[0][0].ToString() }' and P.statut = 'valider'");
            actual = c.ScalarQueries($"Select  count(*)  from Projet P Inner join [Login] L On L.username = P.Responsable Inner Join Utilisateur U on U.Login = L.username Where L.username = '{t.Rows[0][0].ToString() }' and P.statut <> 'en cours'");
            LabelUserName.Text = $"{dt.Rows[0][1].ToString()} {dt.Rows[0][2].ToString()}";
            LabelRespo.Text = $"{dt.Rows[0][1].ToString()} {dt.Rows[0][2].ToString()}";
            LabelCIN.Text = dt.Rows[0][1].ToString();
            LabelFinishedProjets.Text = finished;
            LabelActualProjets.Text = actual;
            dt_ = c.SelectQueries($"Select nomProjet, IntituleProjet, Prenom, Nom, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin'  from Projet P Inner join [Login] L On L.username = P.Responsable Inner Join Utilisateur U on U.Login = L.username Where L.username = '{t.Rows[0][0].ToString() }'");
        }
    }
</script>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
    <div class="card">
        <div class="option">
            <svg style="enable-background: new 0 0 48 48;" viewBox="0 0 48 48" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <g>
                    <g><path d="M24,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4c2.2,0,4,1.8,4,4C28,26.2,26.2,28,24,28z M24,22c-1.1,0-2,0.9-2,2    c0,1.1,0.9,2,2,2c1.1,0,2-0.9,2-2C26,22.9,25.1,22,24,22z" /></g>
                    <g><path d="M10,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4s4,1.8,4,4C14,26.2,12.2,28,10,28z M10,22c-1.1,0-2,0.9-2,2c0,1.1,0.9,2,2,2    s2-0.9,2-2C12,22.9,11.1,22,10,22z" /></g>
                    <g>
                        <path d="M38,28c-2.2,0-4-1.8-4-4c0-2.2,1.8-4,4-4s4,1.8,4,4C42,26.2,40.2,28,38,28z M38,22c-1.1,0-2,0.9-2,2c0,1.1,0.9,2,2,2    s2-0.9,2-2C40,22.9,39.1,22,38,22z" />
                    </g>
                </g>
                <g />
            </svg>
        </div>
        <img src="../images/users.png">
        <h2>@<asp:Label ID="LabelUserName" runat="server" /></h2>
        <h3><asp:Label ID="LabelCIN" runat="server" /></h3>
        <hr>
        <h4>Projets</h4>
        <div class="actual"><span>Actual</span><strong><asp:Label ID="LabelActualProjets" runat="server" /></strong></div>
        <div class="finished"><span>Finished</span><strong><asp:Label ID="LabelFinishedProjets" runat="server" /></strong></div>
    </div>
    <div class="projets">
        <h2>Projets by <strong><asp:Label ID="LabelRespo" runat="server" /></strong></h2>
        <div class="content">
        <%if (dt_.Rows.Count != 0 ) { %>
        <%for (int i = 0; i < dt_.Rows.Count; i++) { %>
        <article>
            <h2><%=dt_.Rows[i][0] %></h2>
            <p><%=dt_.Rows[i][1] %></p>
            <h3><%=dt_.Rows[i][2].ToString() + " " + dt_.Rows[i][3].ToString() %></h3>
            <strong>Statut : <%=dt_.Rows[i][4] %></strong>
            <div><%=dt_.Rows[i][5] + " / " + dt_.Rows[i][6]%></div>
        </article>
        <%} %>
        <%} %>
        </div>
    </div>
    </div>
</asp:Content>
