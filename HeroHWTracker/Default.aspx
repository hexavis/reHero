<%@ Page Title="Home" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HeroHWTracker.Default1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <img alt="Brand" src="<%=ResolveClientUrl("~/img/herologo.png")%>">
                    <h1>Welcome to Hero HomeWork Tracker.</h1>
                    <p>Please login to begin tracking your homework in delight.</p>
                    <asp:Button runat="server" ID="Login" Text="Login" CommandName="loginD" OnClick="Login_Click" />

                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
