using System;
using System.Data;
using System.Web.UI.HtmlControls;
using BTP.classes;
namespace BTP {
    public partial class add_projet : System.Web.UI.Page {
        Connexion c = new Connexion();
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["user"] == null)
            { Response.Redirect("connexion.aspx"); }
            else if (!IsPostBack) {
                Session["Title"] = "proposition d'un projet";
                DropDownListStatut.Items.Add("");
                DropDownListStatut.Items.Add("Brouillon");
                DropDownListStatut.Items.Add("Valider");
                DropDownListStatut.Items.Add("En cours");
                DropDownListStatut.Items.Add("Clôture");
                DropDownListStatut.Items.Add("Annuler");
                DropDownListRespo.DataSource = c.SelectQueries("Select username from Login Where Type = 'Responsable'");
                DropDownListRespo.DataTextField = "username";
                DropDownListRespo.DataValueField = "username";
                DropDownListRespo.DataBind();
                DropDownListRespo.Items.Insert(0, "");
            }
        }
        protected void ButtonAjouter_Click(object sender, EventArgs e) {
            c.MajQueries($"Insert into Projet(CodeP, nomProjet, IntituleProjet, Responsable, [statut], DateDebutP, DatePrevueFin) values ('{codeProjet.Value}', '{nomProjet.Value}', '{intitule.Value}', '{DropDownListRespo.SelectedValue}', '{DropDownListStatut.SelectedValue}', '{txtDateDebutP.Text}', '{txtDatePrevueFin.Text}')");
            LabelError.Text = c.erreur;
        }
        protected void ButtonModifier_Click(object sender, EventArgs e) {
            c.MajQueries($"Update Projet set intituleProjet = '{intitule.Value}', statut = '{DropDownListStatut.SelectedValue}', dateDebutP = '{txtDateDebutP.Text}', DatePrevueFin = '{txtDatePrevueFin.Text}', nomProjet = '{nomProjet.Value}' Where codeP = '{codeProjet.Value}'");
        }
        protected void ButtonRechercher_Click(object sender, EventArgs e) {
            dt = c.SelectQueries($"Select * from Projet Where codeP = '{codeProjet.Value}'");
            Affecter(dt);
        }
        void Affecter(DataTable t) {
            if(t.Rows.Count != 0) {
                codeProjet.Value = dt.Rows[0][0].ToString();
                nomProjet.Value = dt.Rows[0][1].ToString();
                intitule.Value = dt.Rows[0][2].ToString();
                DropDownListRespo.SelectedValue = dt.Rows[0][3].ToString();
                DropDownListStatut.SelectedValue = dt.Rows[0][4].ToString();
                txtDateDebutP.Text = $"{DateTime.Parse(dt.Rows[0][5].ToString()): yyyy-MM-dd}";
                txtDatePrevueFin.Text = $"{DateTime.Parse(dt.Rows[0][6].ToString()): yyyy-MM-dd}";
            } else {
                LabelError.Text = "Inexistant";
            }
        }
        protected void ButtonSupprimer_Click(object sender, EventArgs e)
        { c.SelectQueries($"Delete from Projet Where codeP = '{codeProjet.Value}'"); }
        protected void ButtonAfficher_Click(object sender, EventArgs e) {
            dt = c.SelectQueries($"Select * from Projet Where codeP = '{codeProjet.Value}'");
            if(dt.Rows.Count != 0) {
                Application["chosen"] = dt;
                Response.Redirect("select-projet.aspx");
            }
        }
    }
}