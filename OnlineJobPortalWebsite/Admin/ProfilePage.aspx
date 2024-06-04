<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.ProfilePage" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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

    <div class="container mt-70">
        <div class="row gutters">
            
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">

                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <%--<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">--%>
                                    <asp:Image ImageUrl="../assets/img/profile.ico" runat="server" Height="200px" Width="200px" ID="profileimage" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ImageAlign="Middle" />
                                </div>
                                <%--<h5 class="user-name">Yuki Hayashi</h5>--%>
                                <asp:Label Text="*" ID="lblname" runat="server" CssClass="user-name" Font-Bold="true" />
                                <asp:Label Text="*" ID="lblemail" runat="server" CssClass="user-email" />
                                <%--<asp:Label Text="*" ID="lblid" runat="server" CssClass="" />--%>

                                <%--<h6 class="user-email">yuki@Maxwell.com</h6>--%>

                                <%--<asp:Button Text="Browse" runat="server" CssClass="btn mt-25" />--%>
                                <div class="mt-3 mr-1">
                                    <h6 class="text-primary text-lg-left">>> Edit Photo</h6>
                                </div>
                                <asp:FileUpload ID="FileUploadForImage" runat="server" CssClass="form-control " />

                            </div>
                            <%--<div class="about">
                                <h5>About</h5>
                                <p>I'm Yuki. Full Stack Designer I enjoy creating user-centric, delightful and human experiences.</p>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <%--<input type="checkbox" checked data-toggle="toggle">--%>
                            <%--<asp:CheckBox Text="Edit Profile" runat="server" CssClass="form-check" AutoPostBack="true" OnCheckedChanged="chkeditprofile_CheckedChanged" ID="chkeditprofile" />--%>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary">Personal Details</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtusername">Username</label>
                                    <%--<input type="text" class="form-control" id="fullName" placeholder="Enter full name">--%>
                                    <asp:RegularExpressionValidator Text="*" ControlToValidate="txtusername" ErrorMessage="username should start with an alphabet.All other characters can be alphabets, numbers or an underscore s and also between the 7 to 29 " ValidationExpression="^[A-Za-z][_A-Za-z0-9]{7,29}$" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Your Username.." Text="*" ControlToValidate="txtusername" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" name="txtusername" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Username'" placeholder="Enter Your Username" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtpassword">Password</label>
                                    <%--<input type="email" class="form-control" id="eMail" placeholder="Enter email ID">--%>
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Password..Must Be contain Number,Uppercase ,lowercase char. and special char." ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtfullname">Fullname</label>
                                    <%--<input type="text" class="form-control" id="phone" placeholder="Enter phone number">--%>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtfullname" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Your Name.." ControlToValidate="txtfullname" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtfullname" CssClass="form-control" name="txtfullname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Name'" placeholder="Enter Your Name" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmbgender">Gender</label>
                                    <%--<input type="url" class="form-control" id="website" placeholder="Website url">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Gender.." ControlToValidate="cmbgender" runat="server" InitialValue="Select Gender" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmbgender" runat="server" aria-label=".form-select example" CssClass="form-select form-select form-control">
                                        <asp:ListItem Selected="True">Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="website">Brithday</label>
                                    <%--<input type="url" class="form-control" id="website2" placeholder="Website url">--%>
                                    <input type="date" class="form-control form-outline datetimepicker" runat="server" id="brithdaydate" name="brithdaydate" required />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtemail">Email</label>
                                    <%--<input type="url" class="form-control" id="website3" placeholder="Website url">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Email-ID.." ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" name="txtemail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Email-ID'" placeholder="Enter Your Email-ID" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtmobile">Mobile</label>
                                    <%--<input type="url" class="form-control" id="website4" placeholder="Website url">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Mobile-No.." ControlToValidate="txtmobile" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Mobile Number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ControlToValidate="txtmobile" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control" name="txtmobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Mobile-No'" placeholder="Enter Your Mobile-No" MaxLength="10" />
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 text-primary">Address</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmbcountry">Country</label>
                                    <%--<input type="name" class="form-control" id="Street" placeholder="Enter Street">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Country.." ControlToValidate="cmbcountry" runat="server" InitialValue="Select Country" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmbcountry" runat="server" aria-label=".form-select example" CssClass="form-select form-control">
                                        <asp:ListItem Selected="True">Select Country</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmbstate">State</label>
                                    <%--<input type="name" class="form-control" id="ciTy" placeholder="Enter City">--%>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Select State.." ControlToValidate="cmbstate" runat="server" InitialValue="Select State" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:DropDownList ID="cmbstate" runat="server" aria-label=".form-select example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select State</asp:ListItem>
                                        <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                        <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Assam</asp:ListItem>
                                        <asp:ListItem>Bihar</asp:ListItem>
                                        <asp:ListItem>Chhattisgarh</asp:ListItem>
                                        <asp:ListItem>Goa</asp:ListItem>
                                        <asp:ListItem>Gujarat</asp:ListItem>
                                        <asp:ListItem>Haryana</asp:ListItem>
                                        <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Jharkhand</asp:ListItem>
                                        <asp:ListItem>Karnataka</asp:ListItem>
                                        <asp:ListItem>Kerala</asp:ListItem>
                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                        <asp:ListItem>Maharashtra</asp:ListItem>
                                        <asp:ListItem>Manipur</asp:ListItem>
                                        <asp:ListItem>Meghalaya</asp:ListItem>
                                        <asp:ListItem>Mizoram</asp:ListItem>
                                        <asp:ListItem>Nagaland</asp:ListItem>
                                        <asp:ListItem>Orissa</asp:ListItem>
                                        <asp:ListItem>Punjab</asp:ListItem>
                                        <asp:ListItem>Rajasthan</asp:ListItem>
                                        <asp:ListItem>Sikkim</asp:ListItem>
                                        <asp:ListItem>Tamil Nadu</asp:ListItem>
                                        <asp:ListItem>Tripura</asp:ListItem>
                                        <asp:ListItem>Uttarakhand</asp:ListItem>
                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                        <asp:ListItem>West Bengal</asp:ListItem>
                                        <asp:ListItem>Tamil Nadu</asp:ListItem>
                                        <asp:ListItem>Tripura</asp:ListItem>
                                        <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                        <asp:ListItem>Chandigarh</asp:ListItem>
                                        <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                        <asp:ListItem>Daman and Diu</asp:ListItem>
                                        <asp:ListItem>Delhi</asp:ListItem>
                                        <asp:ListItem>Lakshadweep</asp:ListItem>
                                        <asp:ListItem>Pondicherry</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtaddress">Address</label>
                                    <%--<input type="text" class="form-control" id="sTate" placeholder="Enter State">--%>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Address.." ControlToValidate="txtaddress" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control" name="txtaddress" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Address'" placeholder="Enter Your Address" />
                                </div>
                            </div>

                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-right">

                                    <asp:Button Text="Cancel" runat="server" ID="btnCancel" CssClass=" btn btn-primary" OnClick="btnCancel_Click"  />
                                    <asp:Button Text="Update" runat="server" ID="btnUpdate" CssClass=" btn btn-primary"  OnClick="btnUpdate_Click" />


                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-3 mb-2">
                            <asp:ValidationSummary runat="server" Display="Dynamic" ForeColor="Red" DisplayMode="List" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
