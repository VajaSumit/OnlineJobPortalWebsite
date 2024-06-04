<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="RegistrationPageForJH.aspx.cs" Inherits="OnlineJobPortalWebsite.User.RegistrationPageForJH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>


    
    <section class="testimonial p-5" id="testimonial" style="background-color: lightcyan;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 py-5 bg-primary text-white">
                    <div class=" ">
                        <div class="card-body text-center">
                            <img src="http://www.ansonika.com/mavia/img/registration_bg.svg" style="width: 100%;" class="mt-40">
                            <h1 class="py-3">Company Registration</h1>
                            <%--<img src="../assets/img/company_buildingImage.jpg" class="card-img" style="width:100%"/>--%>
                        </div>
                    </div>


                </div>
                <div class="col-md-9 py-5 border" style="background-color: white;">
                    <h4 class="pb-4">Sign-Up Page </h4>
                    <%--<form>--%>
                    <div class="form-row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 text-primary">Company Information </h6>
                        </div>
                        <div class="form-group col-md-6">

                            <label class="form-label" for="txtcompanyname">Company-Name :</label>
                            <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtcompanyname" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Company Name.." ControlToValidate="txtcompanyname" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox runat="server" ID="txtcompanyname" CssClass="form-control form-control-sm" name="txtcompanyname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Name'" placeholder="Enter Company Name" />

                        </div>
                        <div class="form-group col-md-6">

                            <label class="form-label" for="txtcompanyWebsite">Company-Website :</label>
                            <asp:RegularExpressionValidator ErrorMessage="Please Enter The Valid Website Url.." ID="regexforwebsiteUrl" ControlToValidate="txtcompanyWebsite" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Company Website Url..." ControlToValidate="txtcompanyWebsite" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox runat="server" ID="txtcompanyWebsite" CssClass="form-control form-control-sm" name="txtcompanyWebsite" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Website'" placeholder="Enter Company Website" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <%--<input id="Mobile No." name="Mobile No." placeholder="Mobile No." class="form-control" required="required" type="text">--%>

                            <label class="form-label" for="txtcompanyemailid">Company-Email-ID  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Email-ID.." ControlToValidate="txtcompanyemailid" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtcompanyemailid" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            <asp:TextBox runat="server" ID="txtcompanyemailid" CssClass="form-control form-control-sm" name="txtcompanyemailid" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company EmailID'" placeholder="Enter Company EmailID" />

                        </div>
                        <div class="form-group col-md-6">
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

                    <div class="form-row">

                        <div class="form-group col-md-6">
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


                        <div class="form-group col-md-6">

                            <label for="cmdcountry" class="form-label select-label">Country  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Country.." ControlToValidate="cmdcountry" runat="server" InitialValue="Select Country" Display="Dynamic" ForeColor="Red" />
                            <asp:DropDownList ID="cmdcountry" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                <asp:ListItem Selected="True">Select Country</asp:ListItem>
                                <asp:ListItem>India</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </div>


                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label class="form-label" for="txtaddress">Address  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Address.." ControlToValidate="txtaddress" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control form-control-sm" name="txtaddress" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Company Address'" placeholder="Enter Company Address" />

                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="FileUploadForCompanylogo" class="form-label">Company-Logo  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Company Logo.." ControlToValidate="FileUploadForCompanylogo" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:FileUpload ID="FileUploadForCompanylogo" runat="server" CssClass="form-control" />
                            <p style="font-size: x-small; color: gray; margin-left: 5px;">JPG/PNG/JPEG/ICO</p>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="FileUploadForCertificateCo" class="form-label">Cetificate Corpporation  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Certificate Corpporation.." ControlToValidate="FileUploadForCertificateCo" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:FileUpload ID="FileUploadForCertificateCo" runat="server" CssClass="form-control" />
                            <p style="font-size: x-small; color: gray; margin-left: 5px;">JPG/PNG/JPEG/PDF</p>

                        </div>

                        <div class="form-group col-md-4">
                            <label for="FileUploadForOrganisationPan" class="form-label">Organisation PAN  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Organisation Pan.." ControlToValidate="FileUploadForOrganisationPan" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:FileUpload ID="FileUploadForOrganisationPan" runat="server" CssClass="form-control" />
                            <p style="font-size: x-small; color: gray; margin-left: 5px;">JPG/PNG/JPEG/PDF</p>

                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 mt-3 text-primary">Contact Information </h6>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtfullname">Contact-Persone-Name :</label>
                            <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtpersonename" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Contact Persone Name.." ControlToValidate="txtpersonename" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox runat="server" ID="txtpersonename" CssClass="form-control form-control-sm" name="txtpersonename" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Name'" placeholder="Enter Persone Name" />

                        </div>

                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtpersoneEmailID">Contact-Persone-EmailID  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Contact Persone Email-ID.." ControlToValidate="txtpersoneEmailID" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtpersoneEmailID" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                            <asp:TextBox runat="server" ID="txtpersoneEmailID" CssClass="form-control form-control-sm" name="txtpersoneEmailID" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Email-ID'" placeholder="Enter Persone Email-ID" />

                        </div>

                        <div class="form-group col-md-4">
                            <label class="form-label" for="txtpersoneMobileNo">Contact-Persone-MobileNo  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Contact Persone Mobile-No.." ControlToValidate="txtpersoneMobileNo" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RegularExpressionValidator ErrorMessage="Invalid Mobile Number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ControlToValidate="txtpersoneMobileNo" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:TextBox runat="server" ID="txtpersoneMobileNo" CssClass="form-control form-control-sm" name="txtmobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Persone Mobile-No'" placeholder="Enter Persone Mobile-No" MaxLength="10" />

                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 mt-3 text-primary">Authentication : </h6>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="form-label" for="txtusername">UserName  :</label>
                            <asp:RegularExpressionValidator Text="*" ControlToValidate="txtusername" ErrorMessage="username should start with an alphabet.All other characters can be alphabets, numbers or an underscore s and also between the 7 to 29 " ValidationExpression="^[A-Za-z][a-z0-9_]{7,29}$" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter The Your Username.." Text="*" ControlToValidate="txtusername" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox ID="txtusername" runat="server" CssClass="form-control form-control-sm" name="txtusername" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Username'" placeholder="Enter Your Username" />

                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label" for="txtpassword">Password  :</label>
                            <asp:RegularExpressionValidator ErrorMessage="Invalid Password..Must Be contain Number,Uppercase ,lowercase char. and special char." ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                            <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control form-control-sm" TextMode="Password" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />

                        </div>
                    </div>

                    <div class="form-row mt-2 mb-2">
                        <asp:Button Text="Submit" runat="server" CssClass="btn btn-danger" ID="btnsubmit" OnClick="btnsubmit_Click" />
                    </div>
                    <div>
                        <div>
                            <asp:ValidationSummary runat="server" ForeColor="Red" Font-Size="Smaller" DisplayMode="BulletList" />
                        </div>
                    </div>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
