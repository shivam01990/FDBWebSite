<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="NDCDiscounts.aspx.cs" Inherits="FDBWeb.NDCDiscounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">NDC Discount
            </h1>
            <%-- <ol class="breadcrumb">
                <li class="active">
                    <i class="fa fa-dashboard"></i>Dashboard
                </li>
            </ol>--%>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading  clearfix">
                        <div class="col-md-5">
                            Medicines   
                        </div>
                        <asp:LinkButton ID="lnkAddNew" runat="server" ToolTip="Add New NDC Discount" PostBackUrl="~/NDCDiscount.aspx" CssClass="btn btn-default btn-xs pull-right">  <i class="fa fa-plus"></i></asp:LinkButton>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <div id="DivMsg" runat="server">
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Search
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <p class="col-md-12">
                                                <label for="<%=txtNDC.ClientID %>" class="control-label">NDC</label>
                                            </p>
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtNDC" CssClass="form-control" runat="server"></asp:TextBox>
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
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GrdOffers" ShowHeaderWhenEmpty="true" AllowSorting="true" ShowHeader="true" ShowFooter="false" CssClass="table table-striped table-bordered table-hover"
                                AllowPaging="true" PageSize="10" OnPageIndexChanging="GrdOffers_PageIndexChanging" OnRowDeleting="GrdOffers_RowDeleting"
                                GridLines="None" OnRowDataBound="GrdOffers_RowDataBound" OnRowCommand="GrdOffers_RowCommand" OnSorting="GrdOffers_Sorting"
                                EmptyDataText="<div class='empty-data'>No Records Founds</div>" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="NDC_DiscountID">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("NDC_DiscountID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NDC">
                                        <HeaderStyle CssClass="col-md-2" />
                                        <ItemStyle CssClass="col-md-2" />
                                        <ItemTemplate>
                                            <%#Eval("NDC")==null?"":Eval("NDC").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount Percent">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("Discount_Percent")==null?"":Eval("Discount_Percent").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FacilityID">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FacilityID")==null?"":Eval("FacilityID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href="NDCDiscount.aspx?id=<%# Eval("NDC_DiscountID").ToString() %>" class="btn btn-primary">Edit</a>
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
    <!-- /.row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>
