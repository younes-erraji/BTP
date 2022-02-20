using System;
using System.Data;
using BTP.classes;
namespace BTP {
    public partial class add_livrable : System.Web.UI.Page {
        Connexion c = new Connexion();
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if (!IsPostBack) {
                Session["Title"] = "Ajouter un livrable";
                DropDownListProjets.DataSource = c.SelectQueries("Select codeP, nomProjet From Projet");
                DropDownListProjets.DataTextField = "nomProjet";
                DropDownListProjets.DataValueField = "codeP";
                DropDownListProjets.DataBind();
                DropDownListProjets.Items.Insert(0, "");
            }
        }
        protected void ButtonAjouter_Click(object sender, EventArgs e) {
            DataTable t = c.SelectQueries($"Insert Into Livrable(codeP, intitule, description, dateDebLEs, DateFinLEs, DateDebLR, DateFinLR) Output Inserted.IDLivrable Values ('{DropDownListProjets.SelectedValue}', '{intitule.Value}', '{description.Value}', '{DateDebLes.Value}', '{DateFinLes.Value}', '{DateFinLR.Value}', '{DateFinLR.Value}')");
            Session["Livrable"] = t.Rows[0][0].ToString();
            LabelError.Text = c.erreur;
        }
        protected void ButtonModifier_Click(object sender, EventArgs e) {
            c.MajQueries($"Update Livrable Set codeP =  '{DropDownListProjets.SelectedValue}', intitule = '{intitule.Value}', description = '{description.Value}', dateDebLEs = '{DateDebLes.Value}', DateFinLEs = '{DateFinLes.Value}', DateDebLR = '{DateFinLR.Value}', DateFinLR = '{DateFinLR.Value}')");
            LabelError.Text = c.erreur;
        }
        protected void ButtonRechercher_Click(object sender, EventArgs e) {
            DataTable dt = c.SelectQueries($"select * from Livrable where iDLivrable = {IDLivrable.Value}");
            Session["Livrable"] = dt.Rows[0][0].ToString();
            Affecter(dt);
        }
        private void Affecter(DataTable dt) {
            if (dt.Rows.Count == 0) {
                LabelError.Text = "Inexistant";
            } else {
                Session["Livrable"] = dt.Rows[0][0].ToString();
                DropDownListProjets.SelectedValue = dt.Rows[0][1].ToString();
                intitule.Value = dt.Rows[0][2].ToString();
                description.Value = dt.Rows[0][3].ToString();
            }
        }
        protected void ButtonSupprimer_Click(object sender, EventArgs e) {
            c.SelectQueries($"Delete from Livrable where iDLivrable = {IDLivrable.Value}");
            LabelError.Text = c.erreur;
        }
        protected void ButtonSuivant_Click(object sender, EventArgs e) {
            if (Session["Livrable"] == null)
                LabelError.Text = "Vous avez Choisez un livrable!";
            else
                Response.Redirect("~/livrable-ressources.aspx");
        }
        protected void ButtonAfficher_Click(object sender, EventArgs e) {
            DataTable dt = c.SelectQueries($"Select * from Livrable Where iDLivrable = '{IDLivrable.Value}'");
            if (dt.Rows.Count != 0) {
                Application["chosen"] = dt;
                Response.Redirect("select-livrable.aspx");
            }
        }
    }
}