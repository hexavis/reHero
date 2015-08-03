<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HeroHWTracker.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="left">
        <div class="containter-fluid">
            <div class="col-md-3 col-md-offset-4 col-centered">
                <div class="well">
                    <h1>Log In</h1>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
                        <p>
                            <asp:Literal runat="server" ID="StatusText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
                        <div style="margin-bottom: 10px">
                            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            <div>
                                <asp:TextBox runat="server" ID="UserName" />
                            </div>
                        </div>
                        <div style="margin-bottom: 10px">
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <div>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            </div>
                        </div>
                        <div style="margin-bottom: 10px">
                            <div>
                                <asp:Button runat="server" OnClick="SignIn" Text="Log in" />
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>
        </div>

    </asp:Panel>
</asp:Content>
