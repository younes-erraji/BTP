<%@ Page Title="BTP - Ressources" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    Connexion c = new Connexion();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e) {
        if (Session["user"] == null || Session["user"] == "") {
            Response.Redirect("connexion.aspx");
        } else if(!IsPostBack) {
            Session["Title"] = "Ressources";
            dt = new DataTable();
            dt = c.SelectQueries("select R.codeR, R.designation, T.TypeR, R.NBUnites, U.UniteRess, U.coutUnitaire  from Ressource R inner join TypeRessource T ON R.typeR = T.codeType inner join UniteRessource U ON R.UniteR = U.codeUnite");
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
            <h2><%=dt.Rows[i][0] %></h2>
            <p><%=dt.Rows[i][1] %></p>
            <strong><%=dt.Rows[i][2] %></strong>
            <h3><%=dt.Rows[i][5] %></h3>
            <span><%=dt.Rows[i][3] %></span>
            <div><%=dt.Rows[i][4] %></div>
        </article>
        <%} %>
    </div>
</asp:Content>
