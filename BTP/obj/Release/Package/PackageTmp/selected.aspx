<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        

            if (Session["user"] == null || Session["user"] == "") {
                Response.Redirect("connexion.aspx");
            } else if(!IsPostBack) {
                dt = new DataTable();
                dt = (DataTable)Session["chosen"];
                Session["Title"] = dt.Rows[0][0].ToString();
            }
    }
    protected void ButtonImprimer_Click(object sender, EventArgs e)
    {

    }
    protected void ButtonLivrables_Click(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            text-align: center;
            font-size: 1.8rem;
        }
        .container h2 {
            padding: 14px 0;
            border-bottom: 2px solid #9cfbed;
        }
        .container strong, .container span, .container p {
            line-height: 1.7;
            padding: 4px 8px;
            margin: 8px 0;
            display: block
        }
        .buttons {
            display: flex;
            justify-content: center;
            margin: 18px 0;
        }
        .buttons input {
            border: none;
            width: 180px;
            background-color: #f77b5f;
            color: #fff;
            font-size: 1.7rem;
            padding: 10px 7px;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <div class="container">
        <article>
            <h2><%=dt.Rows[0][0] %></h2>
            <h3><%=dt.Rows[0][5] %></h3>
            <strong><%=dt.Rows[0][2] %></strong>
            <p><%=dt.Rows[0][1] %></p>
            <span><%=dt.Rows[0][3] %></span>
            <div><%=dt.Rows[0][4] %></div>
        </article>
    </div>
    <div class="buttons">
        <asp:button runat="server" text="Imprimer" Id="ButtonImprimer" OnClick="ButtonImprimer_Click" />
        <asp:button runat="server" text="Afficher Les Livrables" ID="ButtonLivrables" OnClick="ButtonLivrables_Click" />
    </div>
</asp:Content>
