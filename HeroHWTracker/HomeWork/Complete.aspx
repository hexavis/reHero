<%@ Page Title="Completed Homework" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Complete.aspx.cs" Inherits="HeroHWTracker.HomeWork.Complete" AutoEventWireup="True" %>

<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div class="body">
        <div class="container-fluid">
            <div class="col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 main">
                <h2>HomeWork List</h2>
                <p>&nbsp;</p>
                <p>
                    <asp:Button runat="server" ID="InProgressB" Text="In Progress List" OnClick="CompleteB_Click" />
                </p>
            </div>
        </div>
        <div>
            <div class="well">
                <asp:ListView ID="ListView1" runat="server"
                    DataKeyNames="HomeWorkID"
                    ItemType="HeroHWTracker.Models.HomeWork"
                    SelectMethod="Index">
                    <EmptyDataTemplate>
                        It appears you have not completed any homework yet.
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <asp:Panel ID="panel1" runat="server" ScrollBars="Auto">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>
                                            <asp:LinkButton Text="HomeWorkID" CommandName="Sort" CommandArgument="HomeWorkID" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="UserInfoID" CommandName="Sort" CommandArgument="UserInfoID" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="MonFilePath" CommandName="Sort" CommandArgument="MonFilePath" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="Name" CommandName="Sort" CommandArgument="Name" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="Description" CommandName="Sort" CommandArgument="Description" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="Class" CommandName="Sort" CommandArgument="Class" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="Due Date" CommandName="Sort" CommandArgument="Due_Date" runat="Server" Visible="False" />
                                        </th>
                                        <th>
                                            <asp:LinkButton Text="isComplete" CommandName="Sort" CommandArgument="isComplete" runat="Server" Visible="False" />
                                        </th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr runat="server" id="itemPlaceholder" />
                                </tbody>
                            </table>
                        </asp:Panel>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <td>
                            <table id="table" class="table">
                                <tr class="sections">
                                    <td class="sections">
                                        <div class="container-fluid">
                                            <asp:Image ID='Image1' runat='server' ImageUrl='<%#"~/"+Eval("MonFilePath") %>' />
                                            <p>
                                                <h1><span class="name"><%# Eval("Name") %></span></h1>
                                            </p>
                                            <p>Class: <span class="class"><%# Eval("Class")%></span></p>
                                            <p>Description: <span class="description"><%# Eval("Description")%></span></p>

                                            <p>Due Date: <span class="date"><%# Eval("Due_Date", "{0:MM/dd/yy}")%></span></p>
                                            <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/HomeWork/Delete", Item.HomeWorkID) %>' Text="Delete" />
                                        </div>
                                    </td>
                                </tr>

                            </table>

                        </td>
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
    </div>
</asp:Content>

