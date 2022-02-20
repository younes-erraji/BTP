<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="connexion.aspx.cs" Inherits="BTP.connexion" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Connexion</title>
    <link rel="icon" href="images/logo.png" />
    <link rel="stylesheet" href="styles/normalize.css" />
    <link rel="stylesheet" href="styles/style-connexion.css" />
</head>
<body>
    <form id="mainForm" runat="server" class="login-form" method="post">
        <h1>Se connecter</h1>
        <div class="username">
            <div><label for="user">Utilisateur</label></div>
            <input type="text" runat="server" id="user" name="username" required="required" />
        </div>
        <div class="password">
            <div><label for="pass">Mot De Passe</label></div>
            <input type="password" runat="server" id="pass" name="password" required="required" />
        </div>
        <div class="erreur">
            <asp:Label ID="LabelErreur" runat="server" Text="" />
        </div>
        <asp:Button ID="ButtonLogin" runat="server" CssClass="log" Text="Login" OnClick="ButtonLogin_Click" />
    </form>
    <footer>Copyright 2021 &copy; BTP.</footer>
</body>
</html>
