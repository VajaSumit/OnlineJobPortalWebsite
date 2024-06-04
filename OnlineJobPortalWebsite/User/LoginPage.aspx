<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="OnlineJobPortalWebsite.User.LoginPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LoginPage</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico" />

    <!-- CSS here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../assets/css/flaticon.css" />
    <link rel="stylesheet" href="../assets/css/price_rangs.css" />
    <link rel="stylesheet" href="../assets/css/slicknav.css" />
    <link rel="stylesheet" href="../assets/css/animate.min.css" />
    <link rel="stylesheet" href="../assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="../assets/css/themify-icons.css" />
    <link rel="stylesheet" href="../assets/css/slick.css" />
    <link rel="stylesheet" href="../assets/css/nice-select.css" />
    <link rel="stylesheet" href="../assets/css/style.css" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <style type="text/css">
        .gradient-custom-2 {
            /* fallback for old browsers */
            background: #fccb90;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }

        @media (min-width: 768px) {
            .gradient-form {
                height: 150vh !important;
            }
        }

        @media (min-width: 769px) {
            .gradient-custom-2 {
                border-top-right-radius: .3rem;
                border-bottom-right-radius: .3rem;
            }
        }


       body{
                overflow-x:auto;
            }  

            ::-webkit-scrollbar{
                width:5px;
                height:5px;
            }
            
           ::-webkit-scrollbar-thumb:hover{
               background:#ff006e;
           }

           ::-webkit-scrollbar-track{
               background:#f1f1f1;
           }

           ::-webkit-scrollbar-thumb{
               background:#ff006e;
               border-radius:1px;
           }
    </style>

    <script src="../assets/jquery.js"></script>
    <script>

        $(document).ready(function () {

            sessionStorage["user"] = document.getElementById("txtusername").textContent;
        });

    </script>


</head>
<body class="gradient-custom-2 ">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <%--     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>--%>

        <%--         <!-- Preloader Start -->
                    <div id="preloader-active">
                        <div class="preloader d-flex align-items-center justify-content-center">
                            <div class="preloader-inner position-relative">
                                <div class="preloader-circle"></div>
                                <div class="preloader-img pere-text">
                                    <img src="../assets/img/logo/logo.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
    <!-- Preloader St<asp:ScriptManager runat="server"></asp:ScriptManager>art -->--%>
        <section class="h-100 gradient-form gradient-custom-2" style="background-color: #eee;">
            <div class="container py-5 h-100">

                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10 ">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">



                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="">
                                            <img src="../assets/img/logo/logo.png" style="width: 200px; margin-left: 30px;" alt="logo" />

                                            <h2 class="mt-5 mb-5 pb-1" style="text-shadow: initial; font-weight: bold; margin-left: 95px; font-family: Perpetua;">Login  </h2>


                                        </div>

                                        <%--<form>--%>
                                        <p>Please login to your account</p>

                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="cmbusertype">UserType :</label>
                                            <%-- <input type="email" id="cmbusertype" class="form-control"
                      placeholder="Phone number or email address" />--%>

                                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select UserType.." ControlToValidate="cmbusertype" runat="server" InitialValue="Select Usertype" Display="Dynamic" ForeColor="Red" />
                                            <asp:DropDownList ID="cmbusertype" runat="server" aria-label=".form-select example" CssClass="form-select form-select-sm form-control">
                                                <asp:ListItem Selected="True">Select Usertype</asp:ListItem>
                                                <asp:ListItem>Admin</asp:ListItem>
                                                <asp:ListItem>Job-Seeker</asp:ListItem>
                                                <asp:ListItem>Job-Hire</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                        <div class="form-outline mb-4">
                                            <%--   <input type="email" id="form2Example11" class="form-control"
                      placeholder="Phone number or email address" />--%>
                                            <label class="form-label" for="txtusername">Username  :</label>

                                            <asp:RequiredFieldValidator ErrorMessage="Please Enter The Your Username.." Text="*" ControlToValidate="txtusername" runat="server" Display="Dynamic" ForeColor="Red" />
                                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control form-control" name="txtusername" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Username'" placeholder="Enter Your Username" />

                                        </div>

                                        <div class="form-outline mb-4">
                                            <%--<input type="password" id="form2Example22" class="form-control" />--%>
                                            <label class="form-label" for="password">Password  :</label>

                                            <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                            <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control form-control" TextMode="Password" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />
                                            <%--<p class="offset-10" ><input type="checkbox" id="chkshowpassword" name="chkshowpass" value="show" onchange="document.getElementById('txtpassword').type=this.checked ? 'text' : 'password' " aria-valuetext="show"  />show</p>--%>
                                            <div class="offset-10 mt-1">
                                                <asp:CheckBox Text="" runat="server" OnCheckedChanged="chkshowpass_CheckedChanged" ID="chkshowpass" AutoPostBack="true" CssClass="" />
                                                <label style="font-size: x-small; font-weight: bold; margin-left: 11px; margin-bottom: 10px;">show</label>
                                            </div>
                                            <p>
                                                >>  
                      <asp:CheckBox Text="Remember Me" runat="server" ID="chkRememberME" />
                                                <ajaxToolkit:ToggleButtonExtender ID="chkshowpass_ToggleButtonExtender" CheckedImageUrl="~/assets/img/passwordshow.png" UncheckedImageUrl="~/assets/img/passwordhide.png" runat="server" BehaviorID="chkRememberME_ToggleButtonExtender" CheckedImageAlternateText="show" TargetControlID="chkshowpass" UncheckedImageOverAlternateText="hide" ImageHeight="19" ImageWidth="29"></ajaxToolkit:ToggleButtonExtender>
                                            </p>

                                        </div>

                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <%--<button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button">Log
                      in</button>--%>
                                            <asp:Button Text="Login" runat="server" ID="btnlogin" CssClass="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" OnClick="btnlogin_Click" />

                                            <%--<a class="text-muted" href="">Forgot password?</a>--%>
                                            <asp:HyperLink NavigateUrl="~/User/ForgotPassword.aspx" runat="server" CssClass="text-muted" Text="Forgot password?" />
                                        </div>

                                        <div class="d-flex align-items-center justify-content-center pb-4">
                                            <p class="mb-0 me-2">Don't have an account?</p>
                                            <a href="../User/RegistrationPageForJS.aspx">Create new<input type="button" class="btn btn-outline-danger" value="Create new" /></a>
                                            <%--<asp:Button Text="Create new" runat="server" CssClass="btn btn-outline-danger " ID="btnregistration" OnClick="btnregistration_Click" />--%>
                                        </div>

                                        <%--</form>--%>
                                        <div>
                                            <asp:ValidationSummary runat="server" ForeColor="Red" />
                                        </div>


                                    </div>
                                </div>



                                <div class="col-lg-6 d-flex <%--align-items-center gradient-custom-2--%>">
                                    <%-- <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                <h4 class="mb-4">We are more than just a company</h4>
                <p class="small mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                  exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
              </div>--%>

                                    <asp:Image ImageUrl="../assets/img/backimage.jpg" runat="server" Height="920px" Width="500px" />

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%--             </ContentTemplate>
       </asp:UpdatePanel>--%>
    </form>

</body>
</html>
