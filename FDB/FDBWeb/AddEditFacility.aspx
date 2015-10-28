<%@ Page Title="" Language="C#" MasterPageFile="~/FDBMasterSecure.Master" AutoEventWireup="true" CodeBehind="AddEditFacility.aspx.cs" Inherits="FDBWeb.AddEditFacility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Facility
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Add / Edit Facility
                </div>
                <div class="panel-body">
                    <div id="DivMsg" runat="server">
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div role="form">
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtFacilityKey.ClientID %>">Facility Key</label>
                                    <asp:TextBox ID="txtFacilityKey" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="valgrp" ControlToValidate="txtFacilityKey" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please input NDC."></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtCropKey.ClientID %>">Crop Key</label>
                                    <asp:TextBox ID="txtCropKey" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtDefFacilityKey.ClientID %>">Def. Facility Key</label>
                                    <asp:TextBox ID="txtDefFacilityKey" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtFacilityType.ClientID %>">Facility Type</label>
                                    <asp:TextBox ID="txtFacilityType" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtAddress.ClientID %>">Address</label>
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtBillingAddress.ClientID %>">Billing Address</label>
                                    <asp:TextBox ID="txtBillingAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtBillingAddress.ClientID %>">City</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtState.ClientID %>">State</label>
                                    <asp:TextBox ID="txtState" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtZip.ClientID %>">Zip</label>
                                    <asp:TextBox ID="txtZip" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtFax.ClientID %>">Fax</label>
                                    <asp:TextBox ID="txtFax" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtPhone.ClientID %>">Fax</label>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtFedral.ClientID %>">Fedral ID</label>
                                    <asp:TextBox ID="txtFedral" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtFedral.ClientID %>">National Provider</label>
                                    <asp:TextBox ID="txtnationalProvider" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtStateOperatorNo.ClientID %>">State Operator Number</label>
                                    <asp:TextBox ID="txtStateOperatorNo" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtStateOperatorNo.ClientID %>">State Operator Number</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="<%=txtStateProvider.ClientID %>">State Provider</label>
                                    <asp:TextBox ID="txtStateProvider" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <p>
                                    <asp:Button ID="btnSave" ValidationGroup="valgrp" CssClass="btn btn-primary" Text="Save" runat="server" />
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
