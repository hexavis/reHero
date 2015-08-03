<%@ Page Title="Delete HomeWork" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Delete.aspx.cs" Inherits="HeroHWTracker.HomeWork.Delete" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="reqId" runat="server" HorizontalAlign="center">
        <div class="containter-fluid">
            <div class="col-md-6 col-md-offset-3 col-centered">
                <div class="well">
                    <h2>Are you sure want to delete this HomeWork?</h2>
                    <p>&nbsp;</p>
                    <asp:FormView runat="server"
                        ItemType="HeroHWTracker.Models.HomeWork" DataKeyNames="HomeWorkID"
                        DeleteMethod="DeleteItem" SelectMethod="GetItem"
                        OnItemCommand="ItemCommand" RenderOuterTable="false">
                        <EmptyDataTemplate>
                            Cannot find the HomeWork with HomeWorkID <%: Request.QueryString["HomeWorkID"] %>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <fieldset class="form-horizontal">
                                <legend></legend>
                                <div class="row">
                                    <div class="col-sm-offset-2 col-sm-4">
                                       <asp:Image ID='Image1' runat='server' ImageUrl='<%#"~/"+Eval("MonFilePath") %>' />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <h1><asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" /></h1>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Class" ID="Class" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-offset-2 col-sm-4">
                                        <asp:DynamicControl runat="server" DataField="Due_Date" ID="Due_Date" Mode="ReadOnly" />
                                    </div>
                                </div>
                                <div class="row">
                                    &nbsp;
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
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

