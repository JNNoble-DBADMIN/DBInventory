<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DatabaseInventory__Web_.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <%-- --%><link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>

    <%--<script src="Content/bootstrap-min.css"></script>--%>
    <%--<link rel="stylesheet" href="Content/bootstrap-min.css"/>--%>

    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/agency-fb" rel="stylesheet"/>

    <style>
        body {
            background-color: #f1f7fc;
        }

        .register-photo {
            background: #f1f7fc;
            padding: 120px 0;
        }

            .register-photo .image-holder {
                display: table-cell;
                width: 50%;
                /*height: 65%;*/
                background: url('Images/dbLogo2.png');
                background-size: cover;
                background-repeat: no-repeat;
                /*border: 1px solid red;*/
            }

            .register-photo .form-container {
                display: table;
                max-width: 900px;
                width: 90%;
                margin: 0 auto;
                box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
            }

            .register-photo form {
                display: table-cell;
                width: 400px;
                background-color: #ffffff;
                padding: 40px 60px;
                color: #505e6c;
            }

        @media (max-width:991px) {
            .register-photo form {
                padding: 40px;
            }
        }

        .register-photo form h2 {
            font-size: 24px;
            line-height: 1.5;
            margin-bottom: 30px
        }

        .register-photo form .form-control {
            background: transparent;
            /*border: none;*/
            color: #61acb3;
            border-left: 3px solid #dfe7f1;
            border-bottom: 3px solid #dfe7f1;
            border-radius: 4px;
            box-shadow: none;
            outline: none;
            color: inherit;
            text-indent: 0px;
            height: 40px
        }

        .register-photo form .form-check {
            font-size: 13px;
            line-height: 20px
        }

        .register-photo form .btn-primary {
            background: #61acb3;
            border: none;
            border-radius: 25px;
            padding: 11px;
            box-shadow: none;
            margin-top: 35px;
            text-shadow: none;
            outline: none !important
        }

        .register-photo form .btn-primary:hover,
        .register-photo form .btn-primary:active {
            background: #61acb3
        }

        .register-photo form .btn-primary:active {
            /*pag lumabas un lblValidation, nag aadjust un form kaya inalis ko to*/
            /*transform: translateY(1px)*/
        }

        .register-photo form .already {
            cursor: default;
            display: block;
            text-align: center;
            font-size: 12px;
            color: #880808;
            opacity: 0.9;
            text-decoration: none
        }

        /*customCss for btnLogin*/

        .logInBtn {
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            outline: none;
            color: #fff;
            background-color: #03539f;
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px #C1C1C1;
            width: 100%;
            height: 40px;
        }

        .logInBtn:hover {
            background-color: #02396D;
        }

        .logInBtn:active {
            background-color: #02396D;
            box-shadow: 0 3px #E5E5E5;
            transform: translateY(2px);
        }

        .input-icon {
            position: absolute;
            left: 13px;
            top: calc(50% - 0.5em);
        }

        .input {
            padding-left: 17px;
        }

        .input-wrapper {
            position: relative;
        }
        /*::-webkit-input-placeholder {text-indent:15px!important;}
        :-moz-placeholder { text-indent:15px!important;}
        ::-moz-placeholder {text-indent:15px!important;}
        :-ms-input-placeholder {text-indent:15px!important;}*/

        .developer {
            font-size: 13px;
            font-family: 'Agency FB';
            font-weight: bold;
            color: #cecece;
            margin-top: 250px;
            margin-left: 20px;
            position: absolute;
            width: 100%;
        }
    </style>

    <script>
        function removeLocalStorage() {
            localStorage.removeItem("activeTab");

        }
    </script>
</head>
<body>
    <div class="register-photo">
        <div class="form-container">
            <div class="image-holder">
                <div>
                    <label class="developer">(c) DEV.RS-2023</label>
                    <%--<a class="developer" href="#">(c) DEV.RS-2023</a>--%>
                </div>
            </div>
            <form runat="server">
                <h2 class="text-center"><strong>USER LOG IN</strong></h2>
                <div class="form-group">
                    <div>
                        <div class="input-wrapper">
                            <input class="form-control" style="padding-left: 35px !important;" id="txtUsername" runat="server" type="input" name="Username" placeholder="Username" />
                            <label for="txtUsername" class="fa fa-user input-icon"></label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <div class="input-wrapper">
                            <input class="form-control" style="padding-left: 35px !important;" id="txtPassword" runat="server" type="password" name="password" placeholder="Password" />
                            <label for="txtPassword" class="fa fa-lock input-icon"></label>
                        </div>
                    </div>
                </div>

                <%--<div class="form-group">
                    <div class="d-flex justify-content-between">
                        <div class="form-check">
                            <input class="form-check-input" runat="server" type="checkbox" value="" id="chkRememberMe" />
                            <label class="form-check-label" for="flexCheckDefault">Remember me </label>
                        </div>
                    </div>
                </div>--%>
                <div class="form-group">
                    <asp:Button CssClass="logInBtn"
                        ID="btnLogin"
                        runat="server"
                        OnClick="btnLogin_Click" OnClientClick="removeLocalStorage()"
                        Text="LOG IN"
                        TabIndex="3" />
                </div>

                <%--<a class="already" href="#">(c) DEV.RS-2023</a>--%>
                <div class="form-group">
                    <asp:Label ID="lblInvalid" Text="-" runat="server" CssClass="already" Visible="true"></asp:Label>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
