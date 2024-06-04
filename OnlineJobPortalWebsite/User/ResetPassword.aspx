<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="OnlineJobPortalWebsite.User.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
</head>
<body style="background-color: ghostwhite;">
    <div class="container">
        <div class="row justify-content-center">
            <form id="form1" runat="server" class="">

                <div class="col-md-6">
                    <div class="card shadow-lg" style="width: 300px; margin-top: 120px; border-radius: 5%;">
                  <div class="card-header text-white text-left h5 bg-primary"><a href="LoginPage.aspx" class="text-white"><<</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Password Reset</div>
                        <div class="card-body px-4">
                            <div class="form-row">
                                <div class="form-group col-12">

                                    <label class="form-label" for="txtpassword" style="font-weight:normal;">Password  :</label>

                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Password..Must Be contain Number,Uppercase ,lowercase char. and special char." ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control form-control-sm" TextMode="Password" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />

                                    <label class="form-label" for="txtconfirmpassword"style="font-weight:normal;margin-top:20px;">Confirm-Password  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Confirm Password.." ControlToValidate="txtconfirmpassword" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:CompareValidator Text="*" ErrorMessage="Can Not Identical" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtconfirmpassword" CssClass="form-control form-control-sm" name="txtconfirmpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Confirm-Password'" placeholder="Enter Confirm-Password" />


                                </div>
                                <asp:Button Text="Reset" runat="server" ID="btnreset" CssClass="btn btn-primary w-50 offset-3" OnClick="btnreset_Click" />
                                <asp:ValidationSummary runat="server" CssClass="m-3" ForeColor="Red" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
