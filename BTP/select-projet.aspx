<%@ Page Title="BTP - Projet" Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Web" %>
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
            dt = (DataTable)Application["chosen"];
            Session["Title"] = dt.Rows[0][0].ToString();
            GridViewLivrables.DataSource = c.SelectQueries($"select codeP as 'Code Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' from Livrable where codeP = '{dt.Rows[0][0]}'");
            GridViewLivrables.DataBind();
        }
    }
    protected void ButtonImprimer_Click(object sender, EventArgs e) {
        // Response.Redirect("~/Imprimant-projet.aspx");
    }
</script>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <article>
            <h2><%=dt.Rows[0][1] %></h2>
            <h3><%=dt.Rows[0][0] %></h3>
            <p><%=dt.Rows[0][5] + " / " + dt.Rows[0][6]%></p>
            <strong><%=dt.Rows[0][2] %></strong>
            <span><%=dt.Rows[0][3] %></span>
            <div><%=dt.Rows[0][4] %></div>
        </article>
        <asp:GridView ID="GridViewLivrables" runat="server" CssClass="grid" ShowHeaderWhenEmpty="true" BorderWidth="0" />
    </div>
    <div class="buttons">
        <asp:button runat="server" text="Imprimer" Id="ButtonImprimer" OnClick="ButtonImprimer_Click" />
    </div>
</asp:Content>
