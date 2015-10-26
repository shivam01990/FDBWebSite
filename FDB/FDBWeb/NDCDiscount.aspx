<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="NDCDiscount.aspx.cs" Inherits="FDBWeb.NDCDiscount" %>

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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valgrp" ControlToValidate="txtNDC" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please input NDC."></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtDiscount.ClientID %>">Discount %</label>
                                    <asp:TextBox ID="txtDiscount" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="valgrp" ControlToValidate="txtDiscount" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please input Discount."></asp:RequiredFieldValidator>

                                </div>
                                <%--<div class="form-group">
                                    <label class="control-label" for="<%=txtAdditionalDiscount.ClientID %>">Additional Discount %</label>
                                    <asp:TextBox ID="txtAdditionalDiscount" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>--%>
                                <label class="control-label" for="<%=ddlFacility.ClientID %>">Facility</label>
                                <asp:DropDownList ID="ddlFacility" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFacility" ValidationGroup="valgrp" ControlToValidate="ddlFacility" InitialValue="0" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select Facility."></asp:RequiredFieldValidator>

                            </div>
                            <div class="form-group">
                                <label class="control-label" for="<%=ddlProductType.ClientID %>">Product Type</label>
                                <asp:DropDownList ID="ddlProductType" CssClass="form-control" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="valgrp" ControlToValidate="ddlProductType" InitialValue="0" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select Product Type."></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>

                    <p>
                        <asp:Button ID="btnSave" ValidationGroup="valgrp" CssClass="btn btn-primary" Text="Save" runat="server" OnClick="btnSave_Click" />
                        <asp:Button ID="btnDelete" CssClass="btn btn-warning" Text="Delete" Visible="false" runat="server" />
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>
