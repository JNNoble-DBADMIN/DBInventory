<%@ Page Title="Database Inventory System" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DatabaseInventory__Web_._Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TopContent" runat="server">
   
    <style>
        body {
        color: #000;
        overflow-x: hidden;
        height: 100%;
        background-color: #B0BEC5;
        background-repeat: no-repeat;
        }

        .card0 {
            box-shadow: 0px 4px 8px 0px #757575;
            border-radius: 0px;
        }

        .card2 {
            margin: 0px 40px;
        }

        .logo {
            width: 125px;
            height: 70px;
            margin-top: 20px;
            margin-left: 35px;
        }

        .image {
            width: 360px;
            height: 280px;
        }

        .border-line {
            border-right: 1px solid #EEEEEE;
        }

        .line {
            /*height: 1px;
            width: 45%;
            background-color: #E0E0E0;*/
            margin-top: 50px;
        }

        .or {
            width: 10%;
            font-weight: bold;
        }

        .text-sm {
            font-size: 14px !important;
        }

        ::placeholder {
            color: #BDBDBD;
            opacity: 1;
            font-weight: 300
        }

        :-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300
        }

        ::-ms-input-placeholder {
            color: #BDBDBD;
            font-weight: 300
        }

        input, textarea {
            padding: 10px 12px 10px 12px;
            border: 1px solid lightgrey;
            border-radius: 2px;
            margin-bottom: 5px;
            margin-top: 2px;
            width: 100%;
            box-sizing: border-box;
            color: #2C3E50;
            font-size: 14px;
            letter-spacing: 1px;
        }

        input:focus, textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: 1px solid #304FFE;
            outline-width: 0;
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
        }

        a {
            color: inherit;
            cursor: pointer;
        }

        .btn-blue {
            background-color: #D00B1C;
            width: 150px;
            color: #fff;
            border-radius: 12px;
        }

        .btn-blue:hover {
            background-color: #DB2D43;
            color: #fff;
            cursor: pointer;
        }

        .bg-blue {
            color: #fff;
            background-color: #1A237E;
        }

        @media screen and (max-width: 991px) {
            .logo {
                margin-left: 0px;
            }

            .image {
                width: 300px;
                height: 220px;
            }

            .border-line {
                border-right: none;
            }

            .card2 {
                border-top: 1px solid #EEEEEE !important;
                margin: 0px 15px;
            }
        }
    </style>
   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>

     <asp:UpdatePanel ID="UpdatePanel1" runat="server">

    <Triggers>
        <asp:PostBackTrigger ControlID="btnLogin" />
    </Triggers>

    <ContentTemplate>
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
        <div class="card card0 border-0">
            <div class="row d-flex">
                <div class="col-lg-6">
                    <div class="card1 pb-5">
                        <div class="row">
                            <%--<img src="https://i.imgur.com/CXQmsmF.png" class="logo">--%>
                            <img src="Images/cignal.png" class="logo">
                        </div>
                        <div class="row px-3 justify-content-center mt-4 mb-5 border-line">
                           <%-- <img src="https://i.imgur.com/uNGdWHi.png" class="image">--%>
                           <img src="Images/37753618.jpg" class="image">
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
                            <input class="mb-4" type="text" id="txtUsername" name="email" placeholder="Username" runat="server">
                        </div>
                        <div class="row px-3">
                            <label class="mb-1"><h6 class="mb-0 text-sm">Password</h6></label>
                            <input type="password" id="txtPassword" name="password" placeholder="Password" runat="server">
                        </div>

                        <div class="row px-3 mb-4">
                            <div class="custom-control custom-checkbox custom-control-inline">
                                <input id="rememberMe" type="checkbox" name="chk" class="custom-control-input" runat="server" clientIdMode="Static">
                                <label for="rememberMe" class="custom-control-label text-sm">Remember</label>
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
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

