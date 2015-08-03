<%@ Page Title="HomeWorkEdit" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Finish.aspx.cs" Inherits="HeroHWTracker.HomeWork.Finish" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label runat="server" ID="pain"></asp:Label>
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <h1>Are you sure you have completed this Homework?</h1>
                    <p>&nbsp;</p>
                    <asp:FormView runat="server"
                        ItemType="HeroHWTracker.Models.HomeWork" DefaultMode="Edit" DataKeyNames="HomeWorkID"
                        UpdateMethod="UpdateItem" SelectMethod="GetItem"
                        OnItemCommand="ItemCommand" RenderOuterTable="false">
                        <EmptyDataTemplate>
                            Cannot find the HomeWork with HomeWorkID <%: Request.QueryString["HomeWorkID"] %>
                        </EmptyDataTemplate>
                        <EditItemTemplate>
                            <fieldset class="form-horizontal">
                                <legend></legend>
                                <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />

                                    </div>
                                </div>
                            </fieldset>
                        </EditItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
        <asp:Label runat="server" ID="Label1"></asp:Label>
        <asp:Label runat="server" ID="message"></asp:Label>
    </asp:Panel>
</asp:Content>

