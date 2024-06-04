<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineJobPortalWebsite.User.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>


</head>
<body style="background-color: ghostwhite; text-align: center;">
    <div class="container">
        <div class="row justify-content-center">
            <form id="form1" runat="server" class="">
               

                <div class="col-md-6">
                    <div class="card shadow-lg text-center" style="width: 300px; margin-top: 120px; border-radius: 5%;">
                        <div class="card-header text-white text-left h5 bg-primary"><a href="LoginPage.aspx" class="text-white"><<</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Password Reset</div>
                        <div class="card-body px-4">
                            <p class="card-text py-2">
                                Enter your email address and we'll send you an email with instructions to reset your password.
                            </p>
                            <div class="form-row">
                                <div class="form-group col-12">
                                    <%--           <input type="email" id="typeEmail" class="form-control my-3" />
                            <label class="form-label" for="typeEmail">Email input</label>--%>


                                    <%--              <label class="form-label" for="txtemailid">Email-ID  :</label>--%>
                                    <asp:TextBox runat="server" ID="txtemailid" CssClass="form-control" name="txtemailid" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter EmailID'" placeholder="Enter EmailID" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Email-ID..." ControlToValidate="txtemailid" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Email..." ControlToValidate="txtemailid" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />


                                </div>
                                 
                                <asp:Button Text="Send" runat="server" ID="btnsend" OnClick="btnsend_Click" CssClass="btn btn-primary w-50 offset-3 " />
                                <asp:Label Text="" ForeColor="Green" ID="lblmsg" runat="server" CssClass="text-left" />
                                <%--<div class="d-flex justify-content-between mt-4">
                           <a class="" href="#">Login</a>
                            <a class="" href="#">Register</a>
                        </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
