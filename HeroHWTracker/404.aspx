<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="HeroHWTracker._404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <h1>It appears that the page was not found. ;n;</h1>
                     <img alt="Brand" src="<%=ResolveClientUrl("~/img/404.jpg")%>">
                </div>
                <!-- well -->
            </div>
        </div>
    </asp:Panel>
</asp:Content>
