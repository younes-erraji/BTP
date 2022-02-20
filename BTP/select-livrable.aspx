<%@ Page Title="BTP - Livrable" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="BTP.classes" %>
<script runat="server">
    DataTable dt;
    Connexion c = new Connexion();
    protected void Page_Load(object sender, EventArgs e) {
        if (Session["user"] == null) {
            Response.Redirect("connexion.aspx");
        } else if(!IsPostBack) {
            dt = (DataTable)Application["chosen"];
            Session["Title"] = dt.Rows[0][0].ToString();
            GridViewLivrablesRessource.DataSource = c.SelectQueries($"select IDLivrable as 'ID', LR.CodeR as 'Code Ressource', typeR 'Type',  concat(NumeroRessource,' ',UnitéR) as 'Unite Ressource' from LivrableRessource LR inner join Ressource R On LR.codeR = R.codeR where iDLivrable = {dt.Rows[0][0]}");
            GridViewLivrablesRessource.DataBind();
        }
    }
    protected void ButtonImprimer_Click(object sender, EventArgs e) {
        // Response.Redirect("~/Imprimant-livrable.aspx");
    }
</script>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <article>
            <h3><%=dt.Rows[0][0] %></h3>
            <h2><%=dt.Rows[0][1] %></h2>
            <p><%=dt.Rows[0][5] + " / " + dt.Rows[0][6]%></p>
            <strong><%=dt.Rows[0][2] %></strong>
            <span><%=dt.Rows[0][3] %></span>
            <div><%=dt.Rows[0][4] %></div>
        </article>
        <asp:GridView ID="GridViewLivrablesRessource" runat="server" BorderWidth="0" CssClass="grid" ShowHeaderWhenEmpty="true" />
    </div>
    <div class="buttons">
        <asp:button runat="server" text="Imprimer" Id="ButtonImprimer" OnClick="ButtonImprimer_Click" />
    </div>
</asp:Content>
