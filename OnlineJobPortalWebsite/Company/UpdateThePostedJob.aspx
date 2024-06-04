<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="UpdateThePostedJob.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.UpdateThePostedJob" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <asp:ScriptManager runat="server"></asp:ScriptManager>

    <style type="text/css">
        body {
            margin: 0;
            padding-top: 0px;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
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
                        <h3 style="margin-bottom: 12px; margin-top: 3px; margin-left: 3px; font-weight: bold; color: gray">Update The Posted Job</h3>
                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtjobtitle">Job Title :</label>
                                    <asp:RegularExpressionValidator ErrorMessage="Please Enter Only Letter , Not Number's..." ControlToValidate="txtjobtitle" ValidationExpression="^[a-z A-Z ]+$" runat="server" Display="Dynamic" ForeColor="Red" Text="*" />
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Job Title.." ControlToValidate="txtjobtitle" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtjobtitle" CssClass="form-control form-control-sm" name="txtjobtitle" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ex. Web Developer'" placeholder="Ex. Web Developer" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group mt-6">
                                    <label class="form-label" for="txtnumberofpost">Number of Post :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select The No. of post..." ControlToValidate="txtnumberofpost" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RangeValidator ErrorMessage="Please Select No.of post Between 1 to 3000" ControlToValidate="txtnumberofpost" runat="server" MaximumValue="3000" MinimumValue="1" SetFocusOnError="True" Text="*" Type="Integer" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtnumberofpost" CssClass="form-control form-control-sm" name="txtnumberofpost" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ex. 25'" placeholder="Ex. 25" />
                                    <filteredtextboxextender ID="txtnumberofpost_FilteredTextBoxExtender" runat="server" BehaviorID="txtnumberofpost_FilteredTextBoxExtender" TargetControlID="txtnumberofpost" FilterType="Numbers" />
                                </div>
                            </div>

                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtjobdescripation">Job Descripation  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Job Descripation.." ControlToValidate="txtjobdescripation" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtjobdescripation" CssClass="form-control form-control-sm" name="txtjobdescripation" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Job Descripation'" placeholder="Enter Job Descripation" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txteducation">Education/Qualification Required :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Education/Qualification.." ControlToValidate="txteducation" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txteducation" CssClass="form-control form-control-sm" name="txteducation" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ex. MCA , Computer Engineer..'" placeholder="Ex. MCA , Computer Engineer.." />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmdexperience" class="form-label select-label">Experience Required :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Job Experience..." ControlToValidate="cmdexperience" runat="server" InitialValue="Select Experience" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmdexperience" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Experience</asp:ListItem>
                                        <asp:ListItem>Freshers</asp:ListItem>
                                        <asp:ListItem>1 Year</asp:ListItem>
                                        <asp:ListItem>2 Year</asp:ListItem>
                                        <asp:ListItem>3 Year</asp:ListItem>
                                        <asp:ListItem>4 Year</asp:ListItem>
                                        <asp:ListItem>5 Year</asp:ListItem>
                                        <asp:ListItem>6 Year</asp:ListItem>
                                        <asp:ListItem>7 Year</asp:ListItem>
                                        <asp:ListItem>8 Year</asp:ListItem>
                                        <asp:ListItem>9 Year</asp:ListItem>
                                        <asp:ListItem>10 Year</asp:ListItem>
                                        <asp:ListItem>11 Year</asp:ListItem>
                                        <asp:ListItem>12 Year</asp:ListItem>
                                        <asp:ListItem>13 Year</asp:ListItem>
                                        <asp:ListItem>14 Year</asp:ListItem>
                                        <asp:ListItem>15 Year</asp:ListItem>
                                        <asp:ListItem>16 Year</asp:ListItem>
                                        <asp:ListItem>17 Year</asp:ListItem>
                                        <asp:ListItem>18 Year</asp:ListItem>
                                        <asp:ListItem>19 Year</asp:ListItem>
                                        <asp:ListItem>20 Year</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtspeciallzation">Spaciallzation/Skill Required  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Speciallzation/Skill's..." ControlToValidate="txtspeciallzation" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtspeciallzation" CssClass="form-control form-control-sm" name="txtspeciallzation" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter The Speciallzation/Skills'" placeholder="Enter The Speciallzation/Skills" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtsalary">Salary :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Job Title.." ControlToValidate="txtsalary" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtsalary" CssClass="form-control form-control-sm" name="txtsalary" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Ex. 30,000-40,000'" placeholder="Ex. 30,000-40,000" />
                                    
                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtsalary_FilteredTextBoxExtender" runat="server" BehaviorID="txtsalary_FilteredTextBoxExtender" TargetControlID="txtsalary" ValidChars=",-" FilterType="Custom , Numbers">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    
                                
                                </div>
                            </div>


                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtlastdatetoapply">Last Date To Apply :</label>
                                    <input type="date" class="form-control form-outline datetimepicker" runat="server" required="required" id="txtlastdatetoapply" name="txtlastdatetoapply" pattern="dd/MM/yyyy" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmdjobtype" class="form-label select-label">Job Type  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Job Type..." ControlToValidate="cmdjobtype" runat="server" InitialValue="Select Job Type" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmdjobtype" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Job Type</asp:ListItem>
                                        <asp:ListItem>FullTime</asp:ListItem>
                                        <asp:ListItem>PartTime</asp:ListItem>
                                        <asp:ListItem>Remote</asp:ListItem>
                                        <asp:ListItem>Freelance</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmdcategory" class="form-label select-label">Job Category  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Job Category..." ControlToValidate="cmdcategory" runat="server" InitialValue="Select Job Category" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmdcategory" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Job Category</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtjoblocation">Job Location  :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Job Location.." ControlToValidate="txtjoblocation" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox runat="server" ID="txtjoblocation" CssClass="form-control form-control-sm" name="txtjoblocation" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Job Location'" placeholder="Enter Job Location" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="cmdjobstatus" class="form-label select-label">Job Status :</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Job Status..." ControlToValidate="cmdjobstatus" runat="server" InitialValue="Select Job Status" Display="Dynamic" ForeColor="Red" />
                                    <asp:DropDownList ID="cmdjobstatus" runat="server" aria-label=".form-select-sm example" CssClass="form-select form-select-sm form-control">
                                        <asp:ListItem Selected="True">Select Job Status</asp:ListItem>
                                        <asp:ListItem>Active</asp:ListItem>
                                        <asp:ListItem>InActive</asp:ListItem>
                                        <asp:ListItem>Job Filled</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-3 mt-3 text-primary">Company Information </h6>
                            </div>
                        </div>


                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanyname">Company-Name :</label>
                                    <asp:TextBox runat="server" ID="txtcompanyname" ReadOnly="true" CssClass="form-control form-control-sm" name="txtcompanyname" />

                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanywebsite">Company-Website :</label>
                                    <asp:TextBox runat="server" ID="txtcompanywebsite" ReadOnly="true" CssClass="form-control form-control-sm" name="txtcompanywebsite" />

                                </div>
                            </div>
                        </div>


                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcompanyemailid">Company-Email-ID  :</label>
                                    <asp:TextBox runat="server" ID="txtcompanyemailid" ReadOnly="true" CssClass="form-control form-control-sm" name="txtcompanyemailid" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="companylogo">CompanyLogo :</label><br />
                                    <asp:Image ImageUrl="#" ID="companylogo" Height="30px" Width="65px" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtstate">State  :</label>
                                    <asp:TextBox runat="server" ID="txtstate" CssClass="form-control form-control-sm" name="txtstate" ReadOnly="true" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtcountry">Country  :</label>
                                    <asp:TextBox runat="server" ID="txtcountry" CssClass="form-control form-control-sm" name="txtcountry" ReadOnly="true" />
                                </div>
                            </div>

                        </div>

                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtaddress">Address  :</label>
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="form-control form-control-sm" name="txtaddress" TextMode="MultiLine" ReadOnly="true" />
                                </div>
                            </div>

                        </div>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtname">Contact Persone Name  :</label>
                                    <asp:TextBox runat="server" ID="txtname" CssClass="form-control form-control-sm" TextMode="SingleLine" ReadOnly="true" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtmobileno">Contact Persone Mobile No :</label>
                                    <asp:TextBox runat="server" ID="txtmobileno" CssClass="form-control form-control-sm"  TextMode="SingleLine" ReadOnly="true" />
                                </div>
                            </div>
                        </div>


                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="text-left">
                                    <asp:Button Text="Update" runat="server" ID="btnupdate" CssClass=" btn btn-primary" OnClick="btnupdate_Click" />
                                    <asp:Button Text="Cancel" runat="server" ID="btncancel" CssClass=" btn btn-primary" OnClick="btncancel_Click" />

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
