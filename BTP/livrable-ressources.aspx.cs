using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTP.classes;
namespace BTP {
    public partial class livrable_ressources : System.Web.UI.Page {
        SqlConnection cx = new SqlConnection("Data Source=.\\SQLEXPRESS; Integrated Security=True; Initial Catalog=BTP;");
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet DS = new DataSet();
        DataView dv;
        DataTable dt, dtR;
        Connexion c = new Connexion();
        protected void Page_Load(object sender, EventArgs e) {
            dtR = c.SelectQueries("Select * from Ressource");
            dv = dtR.DefaultView;
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if (!IsPostBack) {
                Session["Title"] = "à propos";
                DropDownListTypeRessource.DataSource = c.SelectQueries($"select * from TypeRessource");
                DropDownListTypeRessource.DataTextField = "typeR";
                DropDownListTypeRessource.DataValueField = "typeR";
                DropDownListTypeRessource.DataBind();
                DropDownListTypeRessource.Items.Insert(0, "");
            }
            if (Application["LRessource"] == null) {
                da.SelectCommand = new SqlCommand($"select * from LivrableRessource Where IDLivrable = {Session["Livrable"]}", cx);
                da.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                da.Fill(DS, "TLRessources");
                Application["LRessource"] = DS;
                Application["DaLRessource"] = da;
            } else {
                DS = (DataSet)Application["LRessource"];
                da = (SqlDataAdapter)Application["DaLRessource"];
            }
            GridViewTest.DataSource = DS.Tables[0];
            GridViewTest.DataBind();
        }
        protected void DropDownListTypeRessource_SelectedIndexChanged(object sender, EventArgs e) {
            dv.RowFilter = $"TypeR = '{DropDownListTypeRessource.SelectedValue}'";
            DropDownListRessource.DataSource = dv;
            DropDownListRessource.DataTextField = "designation";
            DropDownListRessource.DataValueField = "codeR";
            DropDownListRessource.DataBind();
            DropDownListRessource.Items.Insert(0, "");
        }
        protected void ButtonAjouter_Click(object sender, EventArgs e) {
            if (DropDownListRessource.SelectedIndex != 0) {
                dt = DS.Tables[0];
                DataRow DR = dt.NewRow();
                Affecter(DR);
                dt.Rows.Add(DR);
                GridViewTest.DataSource = dt;
                GridViewTest.DataBind();
            } else {
                LabelException.Text = "Vous avez Choisez Une Ressource avec Quantite!";
            }
        }
        private void Affecter(DataRow dR) {
            dR[0] = Session["Livrable"];
            dR[1] = DropDownListRessource.SelectedValue;
            dR[2] = TextBoxQt.Text;
        }
        protected void ButtonValider_Click(object sender, EventArgs e) {
            SqlCommandBuilder CB = new SqlCommandBuilder(da);
            da.Update(DS.Tables[0]);
        }
        protected void ButtonNouveau_Click(object sender, EventArgs e) {
            DropDownListTypeRessource.SelectedIndex = 0;
            DropDownListRessource.SelectedIndex = 0;
            TextBoxQt.Text = "";
        }
        protected void ButtonAnnuler_Click(object sender, EventArgs e) {
            DS.Tables[0].RejectChanges();
        }
    }
}