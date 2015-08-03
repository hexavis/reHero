<%@ Page Title="HomeWork Details" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Details.aspx.cs" Inherits="HeroHWTracker.HomeWork.Details" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <h1>Homework Details</h1>
                    <p>&nbsp;</p>
                    <asp:FormView runat="server"
                        ItemType="HeroHWTracker.Models.HomeWork" DataKeyNames="HomeWorkID"
                        SelectMethod="GetItem"
                        OnItemCommand="ItemCommand" RenderOuterTable="false">
                        <EmptyDataTemplate>
                            Cannot find the HomeWork with HomeWorkID <%: Request.QueryString["HomeWorkID"] %>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <fieldset class="form-horizontal">
                                <legend></legend>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <asp:Image ID='Image1' runat='server' ImageUrl='<%#"~/"+Eval("MonFilePath") %>' />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 text-right">
                                        <strong>Name</strong>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 text-right">
                                        <strong>Description</strong>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 text-right">
                                        <strong>Class</strong>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Class" ID="Class" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2 text-right">
                                        <strong>Due Date</strong>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Due_Date" ID="Due_Date" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    &nbsp;
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
                                    </div>
                                </div>
                            </fieldset>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

