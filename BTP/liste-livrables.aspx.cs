using System;
using BTP.classes;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BTP {
    public partial class liste_livrables : System.Web.UI.Page {
        DataTable dtL, dtP;
        DataView dvL;
        Connexion c = new Connexion();
        protected void DropDownListProjets_SelectedIndexChanged(object sender, EventArgs e) {
            if (DropDownListProjets.SelectedIndex != 0) {
                dvL.RowFilter = $"[Code Projet] = '{DropDownListProjets.SelectedValue}'";
                GridViewLivrables.DataSource = dvL;
                GridViewLivrables.DataBind();
            }
        }
        protected void ImageButtonFilter_Click(object sender, ImageClickEventArgs e) {
            if (txtDateFinLR.Text != "" || txtDateDebLR.Text != "") {
                if (DropDownListProjets.SelectedIndex != 0) {
                    if ((txtDateDebLR.Text == "") && (txtDateFinLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Code Projet] = '{DropDownListProjets.SelectedValue}' and [Date Fin LR] <=#{txtDateFinLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Fin LR] desc";
                    } else if ((txtDateFinLR.Text == "") && (txtDateDebLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Code Projet] = '{DropDownListProjets.SelectedValue}' and [Date Debut LR] >=#{txtDateDebLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Debut LR] asc";
                    } else if ((txtDateFinLR.Text != "") && (txtDateDebLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Code Projet] = '{DropDownListProjets.SelectedValue}' and [Date Debut LR] >=#{txtDateDebLR.Text}# and [Date Fin LR] <=#{txtDateFinLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Debut LR] asc";
                    }
                } else {
                    if ((txtDateDebLR.Text == "") && (txtDateFinLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Fin LR] <=#{txtDateFinLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Fin LR] desc";
                    } else if ((txtDateFinLR.Text == "") && (txtDateDebLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Debut LR] >=#{txtDateDebLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Debut LR] asc";
                    } else if ((txtDateFinLR.Text != "") && (txtDateDebLR.Text != "")) {
                        LabelErrorMessage.Text = "";
                        string str = $"[Date Debut LR] >=#{txtDateDebLR.Text}# and [Date Fin LR] <=#{txtDateFinLR.Text}#";
                        dvL.RowFilter = str;
                        dvL.Sort = "[Date Debut LR] asc";
                    }
                }
                GridViewLivrables.DataSource = dtP;
                GridViewLivrables.DataBind();
            } else {
                LabelErrorMessage.Text = "Veuillez remplir au moins un des composants là-haut!";
            }
        }
        protected void Page_Load(object sender, EventArgs e) {
            if(Session["type"].ToString() == "Directeur") {
                dtL = c.SelectQueries("Select codeP as 'Code Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' From Livrable");
            } else {
                dtL = c.SelectQueries($"Select L.codeP as 'Code Projet', intitule, description, cast(dateDebLEs as varchar(12)) as 'Date Debut LEs', cast(dateFinLEs as varchar(12)) as 'Date Fin LEs', cast(dateDebLR as varchar(12)) as 'Date Debut LR', cast(dateFinLR as varchar(12)) as 'Date Fin LR', etatAvancement as 'Avancement' From Livrable L Inner Join Projet P On P.codeP = L.codeP Where P.responsable = '{Session["user"]}'");
            }
           
            dvL = dtL.DefaultView;
            if (Session["user"] == null) {
                Response.Redirect("connexion.aspx");
            } else if (!IsPostBack) {
                Session["Title"] = "Livrables";
                GridViewLivrables.DataSource = dvL;
                GridViewLivrables.DataBind();
                dtP = c.SelectQueries("Select * from Projet");
                DropDownListProjets.DataSource = dtP;
                DropDownListProjets.DataTextField = "nomProjet";
                DropDownListProjets.DataValueField = "codeP";
                DropDownListProjets.DataBind();
                DropDownListProjets.Items.Insert(0, "");
            }
        }
    }
}
