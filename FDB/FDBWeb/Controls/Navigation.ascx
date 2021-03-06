﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="FDBWeb.Controls.Navigation" %>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">FDB</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i><b class="caret"></b></a>
            <ul class="dropdown-menu message-dropdown">
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong><%=FDBBLL.authHelper.Instance.GetLogedInUserFromCookie().Name.ToString() %></strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i>Yesterday at 4:32 PM</p>
                                <p>Lorem ipsum dolor sit amet, consectetur...</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong><%=FDBBLL.authHelper.Instance.GetLogedInUserFromCookie().Name.ToString() %></strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i>Yesterday at 4:32 PM</p>
                                <p>Lorem ipsum dolor sit amet, consectetur...</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="message-preview">
                    <a href="#">
                        <div class="media">
                            <span class="pull-left">
                                <img class="media-object" src="http://placehold.it/50x50" alt="">
                            </span>
                            <div class="media-body">
                                <h5 class="media-heading"><strong><%=FDBBLL.authHelper.Instance.GetLogedInUserFromCookie().Name.ToString() %></strong>
                                </h5>
                                <p class="small text-muted"><i class="fa fa-clock-o"></i>Yesterday at 4:32 PM</p>
                                <p>Lorem ipsum dolor sit amet, consectetur...</p>
                            </div>
                        </div>
                    </a>
                </li>
                <li class="message-footer">
                    <a href="#">Read All New Messages</a>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i><b class="caret"></b></a>
            <ul class="dropdown-menu alert-dropdown">
                <li>
                    <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                </li>
                <li>
                    <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                </li>
                <li>
                    <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                </li>
                <li>
                    <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                </li>
                <li>
                    <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                </li>
                <li>
                    <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">View All</a>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%=FDBBLL.authHelper.Instance.GetLogedInUserFromCookie().Name.ToString() %> <b class="caret"></b></a>
            <ul class="dropdown-menu">

                <li class="divider"></li>
                <li>
                    <a href="<%=Page.ResolveUrl("~") %>Logout.aspx"><i class="fa fa-fw fa-power-off"></i>Log Out</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li <%= HttpContext.Current.Request.Url.AbsolutePath=="/MedicinePrice.aspx"?" class=\"active\" ":" " %>>
                <a href="<%=Page.ResolveUrl("~") %>MedicinePrice.aspx"><i class="fa fa-fw fa-plus-square-o"></i>Medicine Price</a>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-money"></i>NDC Discount <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo" <%= HttpContext.Current.Request.Url.AbsolutePath.Contains("NDCDiscount")?"  ":" class=\"collapse\" " %>>
                    <li>
                        <a href="<%=Page.ResolveUrl("~") %>NDCDiscounts.aspx">NDC Discounts</a>
                    </li>
                    <li>
                        <a href="<%=Page.ResolveUrl("~") %>NDCDiscount.aspx">Add/Edit NDC Discount</a>
                    </li>
                </ul>
            </li>

            <li>
                <a <%= HttpContext.Current.Request.Url.AbsolutePath=="/Facilities.aspx"?" class=\"active\" ":" " %> href="<%=Page.ResolveUrl("~") %>Facilities.aspx"><i class="fa fa-fw fa-star-o"></i>Facility</a>
            </li>
            
            <li>
                <a  href="javascript:;" data-toggle="collapse" data-target="#Producttype"><i class="fa fa-fw fa-suitcase"></i>Product Type <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="Producttype" <%= HttpContext.Current.Request.Url.AbsolutePath.Contains("Product")?"  ":" class=\"collapse\" " %>>
                    <li>
                        <a href="<%=Page.ResolveUrl("~") %>ProductTypes.aspx">Product Types</a>
                    </li>
                    <li>
                        <a href="<%=Page.ResolveUrl("~") %>AddEditProductType.aspx">Add / Edit Product Type</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%=Page.ResolveUrl("~") %>UploadFile.aspx"><i class="fa fa-fw fa-upload"></i>Upload File </a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
