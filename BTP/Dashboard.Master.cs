using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BTP {
    public partial class Dashboard : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) { }
        protected void ButtonSearch_Click(object sender, EventArgs e) {
            if (txtRecherche.Value != "" || txtRecherche.Value != null) {
                Session["Search"] = txtRecherche.Value;
                Response.Redirect("recherche.aspx");
            }
        }
        protected void ButtonProfile_Click(object sender, EventArgs e) {
            Response.Redirect("profile.aspx");
        }
        protected void ButtonLogout_Click(object sender, EventArgs e) {
            Session["user"] = null;
            Response.Redirect("connexion.aspx");
        }
    }
}