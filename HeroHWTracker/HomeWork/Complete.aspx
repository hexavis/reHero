<%@ Page Title="HomeWorkList" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Complete.aspx.cs" Inherits="HeroHWTracker.HomeWork.Complete" AutoEventWireup="True" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>HomeWork List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="HomeWorkID" 
			ItemType="HeroHWTracker.Models.HomeWork"
            SelectMethod="Index">
            <EmptyDataTemplate>
                There are no entries found for HomeWork
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="HomeWorkID" CommandName="Sort" CommandArgument="HomeWorkID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="UserInfoID" CommandName="Sort" CommandArgument="UserInfoID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="MonFilePath" CommandName="Sort" CommandArgument="MonFilePath" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Name" CommandName="Sort" CommandArgument="Name" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Description" CommandName="Sort" CommandArgument="Description" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Class" CommandName="Sort" CommandArgument="Class" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Due_Date" CommandName="Sort" CommandArgument="Due_Date" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="isComplete" CommandName="Sort" CommandArgument="isComplete" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="HomeWorkID" ID="HomeWorkID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="UserInfoID" ID="UserInfoID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="MonFilePath" ID="MonFilePath" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Class" ID="Class" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Due_Date" ID="Due_Date" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="isComplete" ID="isComplete" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/HomeWork/Details", Item.HomeWorkID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/HomeWork/Edit", Item.HomeWorkID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/HomeWork/Delete", Item.HomeWorkID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>

        <asp:Button runat="server" ID="InProgressB" Text="In Progress" OnClick="CompleteB_Click" />
    </div>
</asp:Content>

