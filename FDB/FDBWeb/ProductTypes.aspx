<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="ProductTypes.aspx.cs" Inherits="FDBWeb.ProductTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product Types
            </h1>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading  clearfix">
                        <div class="col-md-5">
                            Facilities   
                        </div>
                        <asp:LinkButton ID="lnkAddNew" runat="server" ToolTip="Add New NDC Discount" PostBackUrl="~/NDCDiscount.aspx" CssClass="btn btn-default btn-xs pull-right">  <i class="fa fa-plus"></i></asp:LinkButton>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="DivMsg" runat="server">
                            </div>
                        </div>
                      <%--  <div class="panel panel-default">
                            <div class="panel-heading">
                                Search
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <p class="col-md-12">
                                                <label for="<%=txtFacility.ClientID %>" class="control-label">Facility Key</label>
                                            </p>
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtFacility" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <p></p>
                                            <div class="col-md-12">
                                                <asp:Button ID="btnSearch" CssClass="btn btn-primary" Text="Search" runat="server" OnClick="btnSearch_Click" />
                                                <asp:Button ID="btnReset" CssClass="btn btn-info" Text="Reset" runat="server" OnClick="btnReset_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="table-responsive">
                            <asp:GridView ID="GrdOffers" ShowHeaderWhenEmpty="true" AllowSorting="true" ShowHeader="true" ShowFooter="false" CssClass="table table-striped table-bordered table-hover"
                                AllowPaging="true" PageSize="10" OnPageIndexChanging="GrdOffers_PageIndexChanging" OnRowDeleting="GrdOffers_RowDeleting"
                                GridLines="None" OnRowDataBound="GrdOffers_RowDataBound" OnRowCommand="GrdOffers_RowCommand" OnSorting="GrdOffers_Sorting"
                                EmptyDataText="<div class='empty-data'>No Records Founds</div>" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="ProductTypeID">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("ProductTypeID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("Description")==null?"":Eval("Description").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <a href="Facility.aspx?id=<%# Eval("ProductTypeID").ToString() %>" class="btn btn-primary">Edit</a>
                                            <asp:LinkButton ID="LnkDelete" Text="Delete" runat="server" CssClass="btn btn-danger"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle HorizontalAlign="Right" CssClass="pagination-ys" />
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="8" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>
