<%@ Page Title="HomeWorkEdit" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Edit.aspx.cs" Inherits="HeroHWTracker.HomeWork.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
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
                    <legend>Edit HomeWork</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="UserInfoID" runat="server" Visible="False"/>
						    <asp:DynamicControl Mode="Edit" DataField="MonFilePath" runat="server" Visible="False"/>
						    <asp:DynamicControl Mode="Edit" DataField="Name" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Description" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Class" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Due_Date" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="isComplete" runat="server" Visible="False"/>
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

