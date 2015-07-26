<%@ Page Title="HomeWorkInsert" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Insert.aspx.cs" Inherits="HeroHWTracker.HomeWork.Insert" AutoEventWireup="True" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <p>&nbsp;</p>
        <H1>Insert HomeWork</H1>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <asp:label runat="server" ID="testDate"></asp:label>
        <asp:FormView runat="server"
            ItemType="HeroHWTracker.Models.HomeWork" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
                    <legend></legend>

                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                    <asp:DynamicControl Mode="Insert" DataField="Name" runat="server" />
                    <asp:DynamicControl Mode="Insert" DataField="Description" runat="server" />
                    <asp:DynamicControl Mode="Insert" DataField="Class" runat="server" />
                    
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
                    </div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>


</asp:Content>
