<%@ Page Title="" Language="C#" MasterPageFile="~/FDB.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="Login.aspx.cs" Inherits="FDBWeb.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <div role="form">
                            <fieldset>
                                <div class="form-group">
                                    <asp:Label ID="lblMsg" ForeColor="Red" runat="server"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtUserName" CssClass="form-control" placeholder="User Name" type="text" autofocus runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ReqEmail" Display="Dynamic" ControlToValidate="txtUserName" ForeColor="Red" ValidationGroup="ValLogin" runat="server" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" type="password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ReqPwd" Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="ValLogin" runat="server" ErrorMessage="Please enter your Password"></asp:RequiredFieldValidator>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkRememberMe" runat="server" />
                                        Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-success btn-block" ValidationGroup="ValLogin" Text="Login" runat="server" OnClick="btnLogin_Click" />
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsPlaceHolder" runat="server">
</asp:Content>
