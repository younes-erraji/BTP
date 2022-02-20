<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Imprimant.aspx.cs" Inherits="BTP.Imprimant" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Imprimant</title>
    <style>
        h1 {
            text-align: center
        }
    </style>
    <script src="/crystalreportviewers13/js/crviewer/crv.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Imprimant</h1>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="ReportProjet.rpt">
            </Report>
        </CR:CrystalReportSource>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" />
    </form>
</body>
</html>
