<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="EditTakeAction.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.EditTakeAction" %>

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
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-10">
                <div class="card h-100">
                    <div class="card-body">
                        <h3 style="margin-bottom: 12px; margin-top: 3px; margin-left: 3px; font-weight: bold; color: gray">Applied Candidate - Edit Take Action</h3>
                        <asp:hyperlink  NavigateUrl="~/Company/CommunicationWithCandidate.aspx"   Text="< Back" CssClass="text-dark offset-11 font-weight-bold" runat="server" />
                        
                        
                        <table class="table table-sm table-responsive table-borderless">
                            <tr class="company-img">
                                <td>
                                    <asp:image imageurl="#" id="Userimage" width="150px" borderwidth="1px" bordercolor="#000000" runat="server" />

                                </td>

                                <td class="job-tittle job-tittle2">
                                    <a href="#">
                                        <h5>
                                            <asp:label id="lbljobtitle" cssclass="font-weight-bold text-truncate ml-3" runat="server" text="" />
                                        </h5>
                                    </a>
                                    <ul>

                                        <li><i class="fas fa-building"></i>
                                            Company :
                                                        <asp:label id="lblcompanyname" cssclass="text-dark" font-size="Smaller" runat="server" text="" />
                                        </li>
                                        <li>Education :<asp:label id="lbleducation" cssclass="text-dark" font-size="Smaller" runat="server" text="" />
                                            &nbsp; 
                                                     Experience :<asp:label id="lblexperience" cssclass="text-dark" font-size="Smaller" runat="server" text="" />
                                            &nbsp;
                                                    <i class="fas fa-map-marker-alt"></i>
                                            <asp:label id="lbllocation" cssclass="text-dark" font-size="Smaller" runat="server" text="" />
                                        </li>
                                        <li>Salary :<asp:label id="lblsalary" cssclass="text-dark" font-size="Smaller" runat="server" text="" />
                                            &nbsp;
                                                      Skills :<asp:label id="lblskills" cssclass="text-dark" font-size="Smaller" runat="server" text="" /></li>
                                        <li>AppliedDate :
                                                        <asp:label id="lblapplieddate" cssclass="small text-danger font-weight-bold" runat="server" text="" />
                                            &nbsp;
                                                      LastDate :
                                                        <asp:label id="lbllastdate" cssclass="small text-danger font-weight-bold" runat="server" text="" />

                                        </li>
                                        <li>Name :<asp:label id="lblname" cssclass="text-dark" font-size="Smaller" runat="server" text="" />&nbsp;
                                                     Email :<asp:label id="lblemail" cssclass="text-dark" font-size="Smaller" runat="server" text="" />&nbsp;
                                                     Mobile :<asp:label id="lblmobile" cssclass="text-dark" font-size="Smaller" runat="server" text="" /></li>
                                        <br />
                                    </ul>
                                </td>


                            </tr>
                        </table>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <asp:label text="*" id="lblmessage" forecolor="Green" visible="false" font-size="Medium" font-bold="true" runat="server" />
                                <div class="form-group">
                                    <label class="form-label" for="txtemailid">Email-ID : </label>
                                    <asp:textbox runat="server" id="txtemailid" cssclass="form-control form-control-sm" name="txtemailid" readonly="true" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="cmdstatus">Status :</label>
                                    <asp:requiredfieldvalidator text="*" errormessage="Please Select Status..." initialvalue="Select Status" controltovalidate="cmdstatus" runat="server" display="Dynamic" forecolor="Red" />
                                    <asp:dropdownlist runat="server" id="cmdstatus" cssclass="form-control">
                                    <asp:ListItem Text="Select Status" Selected="True" />
                                    <asp:ListItem Text="Approved" />
                                    <asp:ListItem Text="Rejected" />
                                </asp:dropdownlist>
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="txtmessage">Message  :</label>
                                    <asp:requiredfieldvalidator text="*" errormessage="Please Enter The Descripation.." controltovalidate="txtmessage" runat="server" display="Dynamic" forecolor="Red" />
                                    <asp:textbox runat="server" id="txtmessage" cssclass="form-control form-control-lg" height="100px" textmode="MultiLine" name="txtmessage" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter The Descripation....'" placeholder="Enter The Descripation...." />

                                </div>
                            </div>
                        </div>

                        <asp:button text="Update and Send" cssclass="btn btn-primary" id="btnupdate" onclick="btnupdate_Click" runat="server" />

                        <asp:validationsummary runat="server" displaymode="BulletList" font-bold="true" forecolor="Red" cssclass="mt-4" />

                    </div>
                </div>
            </div>
        </div>




    </div>


</asp:Content>
