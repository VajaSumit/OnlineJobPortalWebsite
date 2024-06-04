<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="RegistrationPageForJS.aspx.cs" Inherits="OnlineJobPortalWebsite.User.RegistrationPageForJS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <html>
    <head>
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
        <script src="../assets/js/bootstrap.min.js"></script>
        <style type="text/css">
            .gradient-custom {
                /* fallback for old browsers */
                background: #f093fb;
                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));
                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }

            .card-registration .select-arrow {
                top: 15px;
            }
        </style>

        <%--<script type="text/javascript">

                    function showpass(chk) {
                        var a = document.getElementById('txtpassword');
                        if (chk.checked) {
                            a.setAttribute("type", "text");
                        }
                        else {
                            a.setAttribute("type","password")
                        }
                    }

                </script>--%>
    </head>
    <body>


        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong  card-registration" style="border-radius: 70px;">
                            <div class="card-body p-4 p-md-5">
                                <h2 class="mb-4 pb-2 pb-md-0 mb-md-5" style="text-align: center;"><b>Sign-Up</b></h2>
                                <%--    <form>--%>

                                    <asp:Label CssClass="mt-5 mb-5" Text="*" Visible="false" ID="lblresult" ForeColor="Red" Font-Size="Medium" runat="server" />


                                <h5 style="color: darkblue;" class="mb-2 pb-2 pb-md-0 mb-md-3">Login Information :- </h5>
                                <div class="form-outline">

                                    <label class="form-label" for="txtusername">UserName  :</label>
                                    <asp:RegularExpressionValidator Text="*" ControlToValidate="txtusername" ErrorMessage="username should start with an alphabet.All other characters can be alphabets, numbers or an underscore s and also between the 7 to 29 " ValidationExpression="^[A-Za-z][a-z0-9_]{7,29}$" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter The Your Username.." Text="*" ControlToValidate="txtusername" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control form-control-sm" name="txtusername" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Username'" placeholder="Enter Your Username" />

                                </div>


                                <div class="row">
                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtpassword">Password  :</label>

                                        <asp:RegularExpressionValidator ErrorMessage="Invalid Password..Must Be contain Number,Uppercase ,lowercase char. and special char." ControlToValidate="txtpassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,}$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                        <asp:RequiredFieldValidator ErrorMessage="Please Enter The Password.." ControlToValidate="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                        <%--<asp:TextBox    runat="server"  ID="txtpassword" CssClass="form-control form-control-sm" TextMode="Password" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />--%>
                                        <%--<input type="password" name="password" id="txtpassword" class="form-control form-control-sm"  placeholder="Enter Password" />--%>
                                        <%--<asp:CheckBox ID="chkshow" runat="server" CssClass="form-check" OnCheckedChanged="chkshow_CheckedChanged" />--%>
                                        <%--<input type="checkbox" id="chkshowpass" value="" onchange="document.getElementById('txtpassword').type=this.checked ? 'text' : 'password' " />--%>
                                        <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control form-control-sm" TextMode="Password" name="txtpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password" />
                                        <%--<input type="checkbox" onchange="document.getElementById('txtpassword').type = this.checked ? 'text' : 'password'" value="Show" onclick="showpass(this)" /> show--%>
                                    </div>

                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtconfirmpassword">Confirm-Password  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Confirm Password.." ControlToValidate="txtconfirmpassword" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:CompareValidator Text="*" ErrorMessage="Can Not Identical" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:TextBox runat="server" ID="txtconfirmpassword" CssClass="form-control form-control-sm" name="txtconfirmpassword" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Confirm-Password'" placeholder="Enter Confirm-Password" />
                                    </div>

                                </div>

                                <h5 style="color: darkblue;" class="mb-2 pb-2 pb-md-0 mb-md-3 mt-3">Personal Information :-</h5>


                                <div class="form-outline  mb-3 mt-4">
                                    <label class="form-label" for="txtfullname">Full-Name</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtfullname" ValidationExpression="^[a-z A-Z]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Your Name.." ControlToValidate="txtfullname" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtfullname" CssClass="form-control form-control-sm" name="txtfullname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Name'" placeholder="Enter Your Name" />
                                </div>



                                <div class="row">
                                    <div class="col-md-6 mb-3 mt-4">
                                        <label for="cmbgender" class="form-label select-label">Gender  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Gender.." ControlToValidate="cmbgender" runat="server" InitialValue="Select Gender" Display="Dynamic" ForeColor="Red" />
                                        <asp:DropDownList ID="cmbgender" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                            <asp:ListItem Selected="True">Select Gender</asp:ListItem>
                                            <asp:ListItem>Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>



                                    <div class="col-md-6 mb-3 mt-4">
                                        <label for="brithdaydate" class="form-label">Brithday  :</label>
                                        <input type="date" class="form-control form-outline datetimepicker" runat="server" id="brithdaydate" name="brithdaydate" required pattern="dd/MM/yyyy" />
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtemail">Email-ID  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Email-ID.." ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtemail" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        <asp:TextBox runat="server" ID="txtemail" CssClass="form-control form-control-sm" name="txtemail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Email-ID'" placeholder="Enter Your Email-ID" />
                                    </div>

                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtmobile">Mobile-No  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Mobile-No.." ControlToValidate="txtmobile" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:RegularExpressionValidator ErrorMessage="Invalid Mobile Number" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ControlToValidate="txtmobile" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                        <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control form-control-sm" name="txtmobile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Mobile-No'" placeholder="Enter Your Mobile-No" MaxLength="10" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3 mt-4">
                                        <label for="cmbcountry" class="form-label select-label">Country  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Country.." ControlToValidate="cmbcountry" runat="server" InitialValue="Select Country" Display="Dynamic" ForeColor="Red" />
                                        <asp:DropDownList ID="cmbcountry" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                            <asp:ListItem Selected="True">Select Country</asp:ListItem>
                                            <asp:ListItem>India</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6 mb-3 mt-4">
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

                                <div class="form-outline  mb-3 mt-4">
                                    <label class="form-label" for="txtaddress">Address  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Address.." ControlToValidate="txtaddress" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control form-control-sm" name="txtaddress" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Address'" placeholder="Enter Your Address" />
                                </div>

                                <div class="form-outline  mb-3 mt-4">
                                    <label for="FileUploadForImage" class="form-label">Image  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Picture.." ControlToValidate="FileUploadForImage" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:FileUpload ID="FileUploadForImage" runat="server" CssClass="form-control" />
                                </div>


                                <div class="row">
                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtskill">Skills :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Your skills..." ControlToValidate="txtskill" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:TextBox runat="server" ID="txtskill" CssClass="form-control form-control-sm" name="txtskill" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ex. Html,Css,Javascript,Node.js, etc...'" placeholder="Ex. Html,Css,Javascript,Node.js, etc..." />
                                    </div>

                                    <div class="col-md-6 mb-3 mt-4">
                                        <label class="form-label" for="txtaboutme">About Me  :</label>
                                        <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter About Me textbox.." ControlToValidate="txtaboutme" runat="server" Display="Dynamic" ForeColor="Red" />
                                        <asp:TextBox runat="server" ID="txtaboutme" CssClass="form-control form-control-sm" name="txtaboutme" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter About YourSelf'" placeholder="Enter About YourSelf" TextMode="MultiLine" />
                                    
                                    </div>
                                </div>

                                <div class="form-outline  mb-3 mt-4">
                                    <label for="FileUploadForResume" class="form-label">Resume  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select a Resume.." ControlToValidate="FileUploadForResume" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:FileUpload ID="FileUploadForResume" runat="server" CssClass="form-control" />
                                </div>

                                <div class="mt-4 pt-2" style="align-content: center; text-align: center">
                                    <asp:Button ID="btnsubmit" Text="Submit" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnsubmit_Click" />

                                </div>

                                <div class="col-12 mt-3 mb-2">
                                    <asp:ValidationSummary runat="server" Display="Dynamic" ForeColor="Red" DisplayMode="List" />
                                </div>

                                <%--</form>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script type="text/javascript">


            //function validatePassword() {
            //    var newPassword = document.getElementById('txtpassword').newPassword.value;
            //    var minNumberofChars = 6;
            //    var maxNumberofChars = 16;
            //    var regularExpression = /^[a-zA-Z0-9!@#$%^&*]{6,16}$/;
            //    alert(newPassword);
            //    if (newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars) {
            //        return false;
            //    }
            //    if (!regularExpression.test(newPassword)) {
            //        alert("password should contain atleast one number and one special character");
            //        return false;
            //    }
            //}
            //$('.datepicker').datepicker({
            //    labelMonthNext: 'Go to the next month',
            //    labelMonthPrev: 'Go to the previous month',
            //    labelMonthSelect: 'Pick a month from the dropdown',
            //    labelYearSelect: 'Pick a year from the dropdown',
            //    selectMonths: true,
            //    selectYears: true
            //})

            $('.datepicker').datepicker({
                format: 'mm/dd/yyyy',
                startDate: '01/01/2020',
                endDate: '12/31/2022'
            });

        </script>


    </body>
    </html>

</asp:Content>
