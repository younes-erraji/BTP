using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BTP {
    public partial class about : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if (!IsPostBack) {
                Session["Title"] = "à propos";
            }
        }
    }
}