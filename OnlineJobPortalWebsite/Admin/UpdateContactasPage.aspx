<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateContactasPage.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.UpdateContactasPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style type="text/css">
        body {
            margin: 0;
            padding-top: 0px;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
        }

        .account-settings .user-profile {
            margin: 0 0 1rem 0;
            padding-bottom: 1rem;
            text-align: center;
        }

            .account-settings .user-profile .user-avatar {
                margin: 0 0 1rem 0;
            }

                .account-settings .user-profile .user-avatar img {
                    width: 90px;
                    height: 90px;
                    -webkit-border-radius: 100px;
                    -moz-border-radius: 100px;
                    border-radius: 100px;
                }

            .account-settings .user-profile h5.user-name {
                margin: 0 0 0.5rem 0;
            }

            .account-settings .user-profile h6.user-email {
                margin: 0;
                font-size: 0.8rem;
                font-weight: 400;
                color: #9fa8b9;
            }

        .account-settings .about {
            margin: 2rem 0 0 0;
            text-align: center;
        }

            .account-settings .about h5 {
                margin: 0 0 15px 0;
                color: #007ae1;
            }

            .account-settings .about p {
                font-size: 0.825rem;
            }

        .form-control {
            border: 1px solid #cfd1d8;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: .825rem;
            background: #ffffff;
            color: #2e323c;
        }

        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }
    </style>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <div class="container mt-50">
        <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Update ContactUs Page</h2>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                   <label for="txtemail">Email</label>
                                    <%--<input type="url" class="form-control" id="website3" placeholder="Website url">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Email-ID.." ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" name="txtemail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email-ID'" placeholder="Enter Email-ID" />
  
                                 </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <label class="form-label" for="txtMobileNo">MobileNo  :</label>
                                <asp:requiredfieldvalidator text="*" errormessage="Please Enter The Mobile-No.." controltovalidate="txtMobileNo" runat="server" display="Dynamic" forecolor="Red" />
                                <asp:regularexpressionvalidator errormessage="Invalid Mobile Number" validationexpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" controltovalidate="txtMobileNo" runat="server" display="Dynamic" forecolor="Red" text="*" />
                                <asp:textbox runat="server" id="txtMobileNo" cssclass="form-control form-control-sm" name="txtMobileNO" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Mobile-No'" placeholder="Enter Mobile-No" />
                            </div>

                        </div>
                        <div class="row gutters">
                            <div class="col-12">
                                <label class="form-label" for="txtaddress">Address  :</label>
                                <asp:requiredfieldvalidator text="*" errormessage="Please Enter The Address.." controltovalidate="txtaddress" runat="server" display="Dynamic" forecolor="Red" />
                                <asp:textbox runat="server" id="txtaddress" cssclass="form-control form-control-sm" Height="100px" name="txtaddress" textmode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Address'" placeholder="Enter Company Address" />
                            </div>
                        </div>

                        <asp:Button Text="Update" runat="server" ID="btnsubmit" CssClass="btn btn-sm btn-primary mt-3" OnClick="btnsubmit_Click" />

                        <br />
                        <br />

                        <asp:ValidationSummary runat="server" ForeColor="Red" DisplayMode="BulletList" />

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
