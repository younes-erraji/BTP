using System;
using BTP.classes;
namespace BTP {
    public partial class connexion : System.Web.UI.Page {
        Connexion c = new Connexion();
        protected void Page_Load(object sender, EventArgs e) { }
        protected void ButtonLogin_Click(object sender, EventArgs e) {
            bool a;
            a = c.VerifierQueries($"select dbo.[VerifierLogin]('{user.Value.ToLower()}', '{pass.Value}')");
            if (a) {
                Session["user"] = user.Value.ToLower();
                Session["name"] = c.ScalarQueries($"select prenom + ' ' + nom from Utilisateur where login ='{Session["user"]}'");
                Session["type"] = c.ScalarQueries($"select type from login where username = '{user.Value.ToLower()}'").ToString();
                Response.Redirect("accueil.aspx");
            } else {
                LabelErreur.Text = "Incorrect username or password";
            }
        }
    }
}