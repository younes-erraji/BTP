<%@ Page Title="BTP - accueil" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="accueil.aspx.cs" Inherits="BTP.accueil" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="styles/style-accueil.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder_" runat="server">
    <section>
        <div class="container">
            <div class="brand">
                <h1 class="title">Projet de Fin d'Etudes</h1>
                <asp:Image ID="ImageOfppt" runat="server" ImageUrl="~/images/OFPPT.jpg" />
            </div>
            <article>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor.</p>
                <img src="/icons/builder.svg" />
            </article>
            <article>
                <img src="/icons/project.svg" />
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor.</p>
            </article>
            <div class="about">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad unde, minima a explicabo maiores aut ducimus magni, iure illo architecto amet ipsum provident fuga modi quos cumque voluptate quia? Ea, aliquid accusamus quam perferendis neque nemo voluptatem corrupti!</p>
                <a href="about.aspx">à propos</a>
            </div>
        </div>
    </section>
</asp:Content>