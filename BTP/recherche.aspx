<%@ Page Title="BTP - Rechercher" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    Connexion c = new Connexion();
    DataTable dtP, dtR, dtL;
    protected void Page_Load(object sender, EventArgs e) {
        if (Session["user"] == null) {
            Response.Redirect("connexion.aspx");
        } else if (!IsPostBack) {
            Session["Title"] = "recherche";
            dtP = c.SelectQueries($"select * from projet where contains(*, '\"*{Session["Search"]}*\"')");
            dtL = c.SelectQueries($"select * from Livrable where contains(*, '\"*{Session["Search"]}*\"");
            dtR = c.SelectQueries($"select * from Ressource where contains(*, '\"*{Session["Search"]}*\"");
        }
    }
</script>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style>
        .container h1 {
            text-align: center;
            font-size: 3vw;
            margin-block: 8px;
        }
        .container section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            border-bottom: 2px solid #999;
        }
        .container h2 {
            background-color: #888;
            color: #fff;
            padding: 14px 8px;
            margin: 14px 0;
            letter-spacing: 2px;
        }
        .container section h3 {
            width: 100%
        }
        .container section p {
            margin: 0;
        }
        .container section p, .container section strong {
            width: -webkit-fit-content;
            width: -moz-fit-content;
            width: fit-content;
            padding: 10px 0;
            margin: 2px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <h1>Searching For <%=Session["search"] %>...</h1>
        <% if (dtP.Rows.Count != 0) { %>
            <h2>Projets</h2>
            <% for (int i = 0; i < dtP.Rows.Count; i++) { %>
                <section>
                    <h3><%=dtP.Rows[i][1] %></h3>
                    <p><%=dtP.Rows[i][2] %></p>
                    <strong><%=dtP.Rows[i][3] %></strong>
                </section>
            <% } %>
        <% } %>
        <% if (dtL.Rows.Count != 0) { %>
            <h2>Livrables</h2>
            <% for (int i = 0; i < dtL.Rows.Count; i++) { %>
                <section>
                    <h3><%=dtL.Rows[i][1] %></h3>
                    <p><%=dtL.Rows[i][2] %></p>
                    <strong><%=dtL.Rows[i][8] %></strong>
                </section>
            <% } %>
        <% } %>
        <% if (dtR.Rows.Count != 0) { %>
            <h2>Ressources</h2>
            <% for (int i = 0; i < dtR.Rows.Count; i++) { %>
                <section>
                    <h3><%=dtR.Rows[i][1] %></h3>
                    <p><%=dtR.Rows[i][2] %></p>
                    <strong><%=dtR.Rows[i][5].ToString() + dtR.Rows[i][3].ToString() %></strong>
                </section>
            <% } %>
        <% } %>
    </div>
</asp:Content>
