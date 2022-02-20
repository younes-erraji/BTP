using System;
using BTP.classes;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BTP {
    public partial class liste_projets : System.Web.UI.Page {
        DataTable dtP, dtR;
        DataView dvP;
        Connexion c = new Connexion();
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["type"].ToString() == "Directeur") {
                dtP = c.SelectQueries("Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin' From Projet");
            } else {
                dtP = c.SelectQueries($"Select CodeP as  [Code De Projet], nomProjet [Nom De Projet], IntituleProjet as [Intitule], Responsable as respo, statut, cast(dateDebutP as varchar(12)) as 'Date Debut', cast(DateFin as varchar(12)) as 'Date Fin' From Projet Where responsable = '{Session["user"]}'");
            }
            dvP = dtP.DefaultView;
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if(!IsPostBack) {
                Session["Title"] = "Projets";
                GridViewProjets.DataSource = dvP;
                GridViewProjets.DataBind();
                dtR = c.SelectQueries("Select username from [login]");
                DropDownListResponsable.DataSource = dtR;
                DropDownListResponsable.DataTextField = "username";
                DropDownListResponsable.DataValueField = "username";
                DropDownListResponsable.DataBind();
                DropDownListResponsable.Items.Insert(0, "");
            }
        }
        protected void DropDownListResponsable_SelectedIndexChanged(object sender, EventArgs e) {
            if (DropDownListResponsable.SelectedIndex != 0) {
                dvP.RowFilter = $"[respo] = '{DropDownListResponsable.SelectedValue}'";
                GridViewProjets.DataSource = dvP;
                GridViewProjets.DataBind();
            }
        }
        protected void ImageButtonFilter_Click(object sender, ImageClickEventArgs e) {
            if (txtDateDebPr.Text != "" || txtDateFinsPr.Text != "") {
                if (DropDownListResponsable.SelectedIndex != 0) {
                    if ((txtDateDebPr.Text == "") && (txtDateFinsPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[respo] = '{DropDownListResponsable.SelectedValue}' and [Date Fin] <=#{txtDateFinsPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Fin] desc";
                    } else if ((txtDateFinsPr.Text == "") && (txtDateDebPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[respo] = '{DropDownListResponsable.SelectedValue}' and [Date Debut] >=#{txtDateDebPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Debut] asc";
                    } else if ((txtDateFinsPr.Text != "") && (txtDateDebPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"respo = '{DropDownListResponsable.SelectedValue}' and [Date Debut] >=#{txtDateDebPr.Text}# and [Date Fin] <=#{txtDateFinsPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Debut] asc";
                    }
                } else {
                    if ((txtDateDebPr.Text == "") && (txtDateFinsPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Fin] <=#{txtDateFinsPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Fin] desc";
                    } else if ((txtDateFinsPr.Text == "") && (txtDateDebPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Debut] >=#{txtDateDebPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Debut] asc";
                    } else if ((txtDateFinsPr.Text != "") && (txtDateDebPr.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Debut] >=#{txtDateDebPr.Text}# and [Date Fin] <=#{txtDateFinsPr.Text}#";
                        dvP.RowFilter = str;
                        dvP.Sort = "[Date Debut] asc";
                    }
                }
                GridViewProjets.DataSource = dtP;
                GridViewProjets.DataBind();
            } else {
                LabelErrorMessage.Text = "Veuillez remplir au moins un des composants là-haut!";
            }
        }
    }
}