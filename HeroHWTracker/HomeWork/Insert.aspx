<%@ Page Title="Insert New HomeWork" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Insert.aspx.cs" Inherits="HeroHWTracker.HomeWork.Insert" AutoEventWireup="True" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <h1>Insert HomeWork</h1>
                    <p>&nbsp;</p>
                    <asp:Calendar class="col-centered" ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" SelectedDate="<%# DateTime.Now %>"></asp:Calendar>
                    <asp:Label runat="server" ID="testDate"></asp:Label>
                    <asp:FormView runat="server"
                        ItemType="HeroHWTracker.Models.HomeWork" DefaultMode="Insert"
                        InsertItemPosition="FirstItem" InsertMethod="InsertItem"
                        OnItemCommand="ItemCommand" RenderOuterTable="false">
                        <InsertItemTemplate>
                            <fieldset class="form-horizontal">
                                <legend></legend>
                                <div class="col-sm-12">
                                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                                    <asp:DynamicControl Mode="Insert" DataField="Name" runat="server" />
                                    <asp:DynamicControl Mode="Insert" DataField="Description" runat="server" />
                                    <asp:DynamicControl Mode="Insert" DataField="Class" runat="server" />
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                                    </div>
                                </div>
                            </fieldset>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
