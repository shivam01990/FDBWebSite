<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="Facilities.aspx.cs" Inherits="FDBWeb.Facilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
        <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Facilities
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
                        <div class="panel panel-default">
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
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GrdOffers" ShowHeaderWhenEmpty="true" AllowSorting="true" ShowHeader="true" ShowFooter="false" CssClass="table table-striped table-bordered table-hover"
                                AllowPaging="true" PageSize="10" OnPageIndexChanging="GrdOffers_PageIndexChanging" OnRowDeleting="GrdOffers_RowDeleting"
                                GridLines="None" OnRowDataBound="GrdOffers_RowDataBound" OnRowCommand="GrdOffers_RowCommand" OnSorting="GrdOffers_Sorting"
                                EmptyDataText="<div class='empty-data'>No Records Founds</div>" AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:TemplateField HeaderText="FACILITY_KEY">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("ProductTypeID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CORP_KEY">
                                        <HeaderStyle CssClass="col-md-2" />
                                        <ItemStyle CssClass="col-md-2" />
                                        <ItemTemplate>
                                            <%#Eval("Description")==null?"":Eval("Description").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DEF_FACILITY_KEY">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("DEF_FACILITY_KEY")==null?"":Eval("DEF_FACILITY_KEY").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_TYPE">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_TYPE")==null?"":Eval("FACILITY_TYPE").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_ADDRESS">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_ADDRESS")==null?"":Eval("FACILITY_ADDRESS").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_ADDRESS2">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_ADDRESS2")==null?"":Eval("FACILITY_ADDRESS2").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="FACILITY_CITY">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_CITY")==null?"":Eval("FACILITY_CITY").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_STATE">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_STATE")==null?"":Eval("FACILITY_STATE").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="FACILITY_ZIP">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_ZIP")==null?"":Eval("FACILITY_ZIP").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="FACILITY_FAX">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_FAX")==null?"":Eval("FACILITY_FAX").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="FACILITY_PHONE">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_PHONE")==null?"":Eval("FACILITY_PHONE").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_FEDERAL_ID">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_FEDERAL_ID")==null?"":Eval("FACILITY_FEDERAL_ID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="NATIONAL_PROVIDER">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("NATIONAL_PROVIDER")==null?"":Eval("NATIONAL_PROVIDER").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATE_OPERATOR_NO">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("STATE_OPERATOR_NO")==null?"":Eval("STATE_OPERATOR_NO").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_ID">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_ID")==null?"":Eval("FACILITY_ID").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FACILITY_REGION">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FACILITY_REGION")==null?"":Eval("FACILITY_REGION").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="FAC_TYPE">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("FAC_TYPE")==null?"":Eval("FAC_TYPE").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField><asp:TemplateField HeaderText="STATE_OPERATOR_NO">
                                        <HeaderStyle CssClass="col-md-1" />
                                        <ItemStyle CssClass="col-md-1" />
                                        <ItemTemplate>
                                            <%#Eval("PROVIDER_TYPE")==null?"":Eval("PROVIDER_TYPE").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                     <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <a href="Facility.aspx?id=<%# Eval("FACILITY_KEY").ToString() %>" class="btn btn-primary">Edit</a>
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
