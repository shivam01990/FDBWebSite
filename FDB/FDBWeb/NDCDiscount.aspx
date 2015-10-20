﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="NDCDiscount.aspx.cs" Inherits="FDBWeb.NDCDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">NDC Discount
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Add / Edit NDC Discount
                </div>
                <div class="panel-body">
                    <div id="DivMsg" runat="server">
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div role="form">
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtNDC.ClientID %>">NDC</label>
                                    <asp:TextBox ID="txtNDC" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtDiscount.ClientID %>">Discount %</label>
                                    <asp:TextBox ID="txtDiscount" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtAdditionalDiscount.ClientID %>">Additional Discount %</label>
                                    <asp:TextBox ID="txtAdditionalDiscount" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=ddlFacility.ClientID %>">Facility</label>
                                    <asp:DropDownList ID="ddlFacility" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtAdditionalDiscount.ClientID %>">Product Type</label>
                                    <asp:DropDownList ID="ddlProductType" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <p>
                        <asp:Button ID="btnSave" ValidationGroup="valgrp" CssClass="btn btn-primary" Text="Save" runat="server" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-warning" Text="Delete" Visible="false" runat="server" />
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>