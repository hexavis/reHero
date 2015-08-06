<%@ Page Title="Edit HomeWork" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Edit.aspx.cs" Inherits="HeroHWTracker.HomeWork.Edit" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel id="reqId" runat="server" HorizontalAlign="center" >
    <div class="containter-fluid">
        <div class="col-md-6 col-md-offset-3 col-centered">
            <div class="well">
                <h1>Edit HomeWork</h1>
                <p>&nbsp;</p>
                
                <asp:Calendar class="col-centered" ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                <asp:Label class="col-centered" runat="server" ID="testDate"></asp:Label>
                <asp:FormView class="sCenter" runat="server"
                    ItemType="HeroHWTracker.Models.HomeWork" DefaultMode="Edit" DataKeyNames="HomeWorkID"
                    UpdateMethod="UpdateItem" SelectMethod="GetItem"
                    OnItemCommand="ItemCommand" RenderOuterTable="false">
                    <EmptyDataTemplate>
                        Cannot find the HomeWork with HomeWorkID <%: Request.QueryString["HomeWorkID"] %>
                    </EmptyDataTemplate>
                    <EditItemTemplate>
                        <fieldset class="form-horizontal">
                            <div id="sCenter">
                            <legend></legend>
                            <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
                            <asp:DynamicControl Mode="Edit" DataField="UserInfoID" runat="server" Visible="False" />
                            <asp:DynamicControl Mode="Edit" DataField="MonFilePath" runat="server" Visible="False" />
                            <asp:DynamicControl Mode="Edit" DataField="Name" runat="server" />
                            <asp:DynamicControl Mode="Edit" DataField="Description" runat="server" />
                            <asp:DynamicControl Mode="Edit" DataField="Class" runat="server" />
                            <asp:DynamicControl Mode="Edit" DataField="isComplete" runat="server" Visible="False" />
                                 </div>
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
        </asp:Panel>
</asp:Content>

