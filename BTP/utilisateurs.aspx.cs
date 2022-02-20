using System;
using BTP.classes;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BTP {
    public partial class utilisateurs : System.Web.UI.Page {
        Connexion c = new Connexion();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if (!IsPostBack) {
                Session["Title"] = "à propos";
                dt = c.SelectQueries("Select CIN, Prenom, Nom, Login as Username, Type from Utilisateur U Inner Join Login L On L.username = U.login Where L.Type <> 'Directeur'");
                GridViewUtilisateurs.DataSource = dt;
                GridViewUtilisateurs.DataBind();
                DropDownListType.Items.Add("");
                DropDownListType.Items.Add("Responsable");
            }
        }
        protected void ButtonAjouter_Click(object sender, EventArgs e) {
            c.ProcQueries("EcryptLogin", TextBoxUsername.Text.ToLower(), TextBoxMP.Text, DropDownListType.SelectedValue);
            c.MajQueries($"Insert Into Utilisateur Values ('{TextBoxCIN.Text}', '{TextBoxPrenom.Text}', '{TextBoxNom.Text}', '{TextBoxUsername.Text}')");
            LabelErreur.Text = c.erreur;
        }
        protected void ButtonRechercher_Click(object sender, EventArgs e) {
            if (TextBoxCIN.Text != "" || TextBoxUsername.Text != "") {
                if (TextBoxCIN.Text != "") {
                    dt = c.SelectQueries($"Select CIN, Prenom, Nom, Login as Username, Type from Utilisateur U Inner Join Login L On L.username = U.login Where CIN = '{TextBoxCIN.Text}' and  L.Type <> 'Directeur'");
                } else if (TextBoxUsername.Text != "") {
                    dt = c.SelectQueries($"Select CIN, Prenom, Nom, Login as Username, Type from Utilisateur U Inner Join Login L On L.username = U.login Where Login = '{TextBoxUsername.Text}' and  L.Type <> 'Directeur'");
                }
                Affecter(dt);
            } else {
                LabelErreur.Text = "Veuillez remplir au moins un des composants là-haut! (CIN ou Username)";
            }
        }
        private void Affecter(DataTable dt) {
            TextBoxCIN.Text = dt.Rows[0][0].ToString();
            TextBoxPrenom.Text = dt.Rows[0][1].ToString();
            TextBoxNom.Text = dt.Rows[0][2].ToString();
            TextBoxUsername.Text = dt.Rows[0][3].ToString();
        }
        protected void ButtonAfficher_Click(object sender, EventArgs e) {
            if (TextBoxCIN.Text != "" || TextBoxUsername.Text != "") {
                if (TextBoxCIN.Text != "") {
                    dt = c.SelectQueries($"Select Login, CIN, Prenom, Nom, Type from Utilisateur U Inner Join Login L On L.username = U.login Where CIN = '{TextBoxCIN.Text}' and  L.Type <> 'Directeur'");
                } else if (TextBoxUsername.Text != "") {
                    dt = c.SelectQueries($"Select Login, CIN, Prenom, Nom, Type from Utilisateur U Inner Join Login L On L.username = U.login Where Login = '{TextBoxUsername.Text}' and  L.Type <> 'Directeur'");
                }
                Application["show-user"] = dt;
                Response.Redirect("profile-users.aspx");
            } else {
                LabelErreur.Text = "Veuillez remplir au moins un des composants là-haut! (CIN ou Username)";
            }
        }
    }
}