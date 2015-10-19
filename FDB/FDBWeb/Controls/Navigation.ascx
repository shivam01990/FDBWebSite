<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="FDBWeb.Controls.Navigation" %>
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
                <a href="<%=Page.ResolveUrl("~") %>NDCDiscounts.aspx"><i class="fa fa-fw fa-money"></i>NDC Discount</a>
            </li>
            <li>
                <a href="<%=Page.ResolveUrl("~") %>MedicinePrice.aspx"><i class="fa fa-fw fa-star-o"></i>Facility</a>
            </li>
            <li>
                <a href="<%=Page.ResolveUrl("~") %>MedicinePrice.aspx"><i class="fa fa-fw fa-suitcase"></i>Product Type </a>
            </li>
            <li>
                <a href="<%=Page.ResolveUrl("~") %>MedicinePrice.aspx"><i class="fa fa-fw fa-upload"></i>Upload File </a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>
