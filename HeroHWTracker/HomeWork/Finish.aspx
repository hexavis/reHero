<%@ Page Title="HomeWorkEdit" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Finish.aspx.cs" Inherits="HeroHWTracker.HomeWork.Finish" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <asp:Label runat="server" ID="pain"></asp:Label>
    <div>
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
                    <legend>Are you sure you have completed this Homework?</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />              
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                             
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>

   
</asp:Content>

