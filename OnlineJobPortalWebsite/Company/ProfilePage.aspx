<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.CompanyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        body {
            margin: 0;
            padding-top:    0px;
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
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <div class="container mt-70">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">

                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <asp:Image ImageUrl="../assets/img/profile.ico" runat="server" Height="150px" Width="150px" ID="companylogo" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ImageAlign="Middle" />
                                </div>
            
                                <asp:Label Text="*" ID="lblcompanyname" runat="server" CssClass="user-name" Font-Bold="true" />
                                <asp:Label Text="*" ID="lblcompanyemail" runat="server" CssClass="user-email" />
                                <div class="mt-3 mr-1">
                                    <h6 class="text-primary text-lg-left">>> Edit Logo</h6>
                                </div>
                                <asp:FileUpload ID="FileUploadForCompanylogo" runat="server" CssClass="form-control " />

                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <asp:Label Text="*" ID="lblmessage" ForeColor="Green" Visible="false" Font-Size="Medium" Font-Bold="true" runat="server" />
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanyname">Company-Name :</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtcompanyname" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Company Name.." ControlToValidate="txtcompanyname" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtcompanyname" CssClass="form-control form-control-sm" name="txtcompanyname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Name'" placeholder="Enter Company Name" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanyWebsite">Company-Website :</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter The Valid Website Url.." ID="regexforwebsiteUrl" ControlToValidate="txtcompanyWebsite" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Company Website Url..." ControlToValidate="txtcompanyWebsite" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtcompanyWebsite" CssClass="form-control form-control-sm" name="txtcompanyWebsite" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Website'" placeholder="Enter Company Website" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanyemailid">Company-Email-ID  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Email-ID.." ControlToValidate="txtcompanyemailid" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtcompanyemailid" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox runat="server" ID="txtcompanyemailid" CssClass="form-control form-control-sm" name="txtcompanyemailid" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company EmailID'" placeholder="Enter Company EmailID" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmbcompanytype" class="form-label select-label">Company Type  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select CompanyType.." ControlToValidate="cmbcompanytype" runat="server" InitialValue="Select Company-Type" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmbcompanytype" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Company-Type</asp:ListItem>
                                        <asp:ListItem>Limited liability company</asp:ListItem>
                                        <asp:ListItem>Company limited by guarantee</asp:ListItem>
                                        <asp:ListItem>Publicly listed company</asp:ListItem>
                                        <asp:ListItem>Private company limited by shares</asp:ListItem>
                                        <asp:ListItem>Cooperative</asp:ListItem>
                                        <asp:ListItem>Privately held company</asp:ListItem>
                                        <asp:ListItem>Limited company</asp:ListItem>
                                        <asp:ListItem>Holding company</asp:ListItem>
                                        <asp:ListItem>Joint-stock company</asp:ListItem>
                                        <asp:ListItem>Business</asp:ListItem>
                                        <asp:ListItem>Unlimited company</asp:ListItem>
                                        <asp:ListItem>Private limited company</asp:ListItem>
                                        <asp:ListItem>Statutory corporation</asp:ListItem>
                                        <asp:ListItem>Subsidiary</asp:ListItem>
                                        <asp:ListItem>Foreign corporation</asp:ListItem>
                                        <asp:ListItem>General partnership</asp:ListItem>
                                        <asp:ListItem>Limited Liability Partnership</asp:ListItem>
                                        <asp:ListItem>Kommanditgesellschaft</asp:ListItem>
                                        <asp:ListItem>Small business</asp:ListItem>
                                        <asp:ListItem>Limited Partnership</asp:ListItem>
                                        <asp:ListItem>Conglomerate</asp:ListItem>
                                        <asp:ListItem>Hindu joint family</asp:ListItem>
                                        <asp:ListItem>Sole proprietorship</asp:ListItem>
                                        <asp:ListItem>Others</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmbstate" class="form-label select-label">State  :</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Select State.." ControlToValidate="cmbstate" runat="server" InitialValue="Select State" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:DropDownList ID="cmbstate" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
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
                                    <label for="cmdcountry" class="form-label select-label">Country  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Country.." ControlToValidate="cmdcountry" runat="server" InitialValue="Select Country" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmdcountry" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Country</asp:ListItem>
                                        <asp:ListItem>India</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtaddress">Address  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Address.." ControlToValidate="txtaddress" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control form-control-sm" name="txtaddress" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Address'" placeholder="Enter Company Address" />
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="FileUploadForCertificateCo" class="form-label">Cetificate Corpporation  :</label>
                                    <%--<asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Certificate Corpporation.." ControlToValidate="FileUploadForCertificateCo" runat="server" Display="Dynamic" ForeColor="Red" />--%>
                                    <asp:FileUpload ID="FileUploadForCertificateCo" runat="server" CssClass="form-control" />
                                       <%--<asp:HyperLink NavigateUrl="#" runat="server" ID="show1" Target="_blank" Text="Show" Font-Size="X-Small" ForeColor="Gray" />--%>
                                    <a href="#" style="font-size: x-small; color: blue; margin-left: 2px;" runat="server" id="show1" target="_blank">show</a>
                                    <p style="font-size: x-small; color: gray; margin-left: 5px;">JPG/PNG/JPEG/PDF</p>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="FileUploadForOrganisationPan" class="form-label">Organisation PAN  :</label>
                                    <%--<asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Organisation Pan.." ControlToValidate="FileUploadForOrganisationPan" runat="server" Display="Dynamic" ForeColor="Red" />--%>
                                    <asp:FileUpload ID="FileUploadForOrganisationPan" runat="server" CssClass="form-control" />
                                    <%--<asp:HyperLink NavigateUrl="#" runat="server" ID="show2" Target="_blank" Text="Show" Font-Size="X-Small" ForeColor="Gray" />--%>
                                      <a href="#" style="font-size: x-small; color: blue; margin-left: 2px;" runat="server" id="show2" target="_blank">show</a>
                                    <p style="font-size: x-small; color: gray; margin-left: 5px;">JPG/PNG/JPEG/PDF</p>
                                </div>
                            </div>

                        </div>


                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-3 mt-3 text-primary">Contact Information </h6>
                            </div>
                        </div>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtfullname">Contact-Persone-Name :</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtpersonename" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Contact Persone Name.." ControlToValidate="txtpersonename" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtpersonename" CssClass="form-control form-control-sm" name="txtpersonename" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Name'" placeholder="Enter Persone Name" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtpersoneEmailID">Contact-Persone-EmailID  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Contact Persone Email-ID.." ControlToValidate="txtpersoneEmailID" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtpersoneEmailID" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox runat="server" ID="txtpersoneEmailID" CssClass="form-control form-control-sm" name="txtpersoneEmailID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Email-ID'" placeholder="Enter Persone Email-ID" />
                                </div>
                            </div>

                            
                        </div>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtpersoneMobileNo">Contact-Persone-MobileNo  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Contact Persone Mobile-No.." ControlToValidate="txtpersoneMobileNo" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Mobile Number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ControlToValidate="txtpersoneMobileNo" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:TextBox runat="server" ID="txtpersoneMobileNo" CssClass="form-control form-control-sm" name="txtmobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Mobile-No'" placeholder="Enter Persone Mobile-No" MaxLength="10" />

                                </div>
                            </div>
                        </div>


                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-3 mt-3 text-primary">Authentication : </h6>
                            </div>
                        </div>

                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtusername">UserName  :</label>
                                    <asp:RegularExpressionValidator Text="*" ControlToValidate="txtusername" ErrorMessage="username should start with an alphabet.All other characters can be alphabets, numbers or an underscore s and also between the 7 to 29 " ValidationExpression="^[A-Za-z][a-z0-9_]{7,29}$" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Your Username.." Text="*" ControlToValidate="txtusername" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control form-control-sm" name="txtusername" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Username'" placeholder="Enter Your Username" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtpassword">Password  :</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Invalid Password..Must Be contain Number,Uppercase ,lowercase char. and special char." ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control form-control-sm" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />
                                </div>
                            </div>

                        </div>


                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-left">

                                    <asp:Button Text="Cancel" runat="server" ID="btnCancel" CssClass=" btn btn-primary" OnClick="btnCancel_Click"  />
                                    <asp:Button Text="Update" runat="server" ID="btnUpdate" CssClass=" btn btn-primary" OnClick="btnUpdate_Click" />


                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-3 mb-2">
                            <asp:ValidationSummary runat="server" ForeColor="Red" Font-Size="Smaller" DisplayMode="BulletList" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
