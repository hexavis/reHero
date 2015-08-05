<%@ Page Title="Error 404" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="HeroHWTracker.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">

                    <h2>Error:</h2>
                    <p></p>
                    <asp:Label ID="FriendlyErrorMsg" runat="server" Text="Label" Font-Size="Large" Style="color: red"></asp:Label>

                    <asp:Panel ID="DetailedErrorPanel" runat="server" Visible="false">
                        <p>&nbsp;</p>
                        <h4>Detailed Error:</h4>
                        <p>
                            <asp:Label ID="ErrorDetailedMsg" runat="server" Font-Size="Small" /><br />
                        </p>

                        <h4>Error Handler:</h4>
                        <p>
                            <asp:Label ID="ErrorHandler" runat="server" Font-Size="Small" /><br />
                        </p>

                        <h4>Detailed Error Message:</h4>
                        <p>
                            <asp:Label ID="InnerMessage" runat="server" Font-Size="Small" /><br />
                        </p>
                        <p>
                            <asp:Label ID="InnerTrace" runat="server" />
                        </p>
                    </asp:Panel>
                    <asp:Label runat="server" ID="ErrorMsgTextBox"></asp:Label>
                    <img alt="Brand" src="<%=ResolveClientUrl("~/img/j0Bee17.jpg")%>">
                </div>
                <!-- well -->
            </div>
        </div>
    </asp:Panel>
</asp:Content>
