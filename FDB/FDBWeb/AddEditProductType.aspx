<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="AddEditProductType.aspx.cs" Inherits="FDBWeb.AddEditProductType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product Type
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Add / Edit Product Type
                </div>
                <div class="panel-body">
                    <div id="DivMsg" runat="server">
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div role="form">
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtDescription.ClientID %>">Description</label>
                                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="valgrp" ControlToValidate="txtDescription" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please input Discount."></asp:RequiredFieldValidator>
                                </div>
                                <p>
                                    <asp:Button ID="btnSave" ValidationGroup="valgrp" CssClass="btn btn-primary" Text="Save" runat="server" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnDelete" CssClass="btn btn-warning" Text="Delete" Visible="false" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>
