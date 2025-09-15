<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="DatabaseInventory__Web_.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <link href="CustomCss/Login.css" rel="stylesheet" />

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
</head>
<body>
    <form id="form1" runat="server">
     
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto"; >
        <div class="card card0 border-0">
            <div class="row d-flex">
                <div class="col-lg-6">
                    <div class="card1 pb-5">
                        <div class="row px-3">
                            <%--<img src="https://i.imgur.com/CXQmsmF.png" class="logo">--%>
                            <img src="Images/cignal.png" class="logo"/>
                        </div>
                        <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                           <%-- <img src="https://i.imgur.com/uNGdWHi.png" class="image">--%>
                           <img src="Images/37753618.jpg" class="image"/>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card2 card border-0 px-4 py-5">
                    
                        <div class="row px-3 mb-4">
                            <div class="line"></div>
                        </div>
                        <div class="row px-3">
                            <label class="mb-1"><h6 class="mb-0 text-sm">Username</h6></label>
                            <input class="form-control" type="text" id="txtUsername" name="email" placeholder="Username" runat="server"/>
                        </div>
                        <div class="row px-3">
                            <label class="mb-1"><h6 class="mb-0 text-sm">Password</h6></label>
                            <input class="form-control" type="password" id="txtPassword" name="password" placeholder="Password" runat="server"/>
                        </div>

                        <div class="row px-3 mb-4" style="margin-top:10px;">
                            <div class="custom-control custom-checkbox custom-control-inline">
                                <input id="rememberMe" type="checkbox" name="chk" class="custom-control-input" runat="server" clientIdMode="Static"/>
                                <label for="rememberMe" class="custom-control-label text-sm">Remember Me</label>
                            </div>
                        </div>

                        <div class="row mb-3 px-3">
                            <asp:Button CssClass="btn btn-blue text-center"
                                    ID="btnLogin" 
                                    runat="server"
                                    OnClick="btnLogin_Click"
                                    Text="Log In"
                                    TabIndex="3" />
                        </div>
                        <div class="row mb-4 px-3">
                            <label style="color:red; font-size: 12px;" runat="server" id="lblInvalid" visible="false">Invalid Username and/or Password</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  

    </form>
</body>
</html>
