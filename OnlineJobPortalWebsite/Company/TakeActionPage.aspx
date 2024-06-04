<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="TakeActionPage.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.TakeActionPage" %>

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
                        <h3 style="margin-bottom: 12px; margin-top: 3px; margin-left: 3px; font-weight: bold; color: gray">Applied Candidate - Take Action</h3>
                        <asp:HyperLink NavigateUrl="~/Company/ManageAppliedCandidate.aspx" Text="< Back" CssClass="text-dark offset-11 font-weight-bold" runat="server" />

                        <table class="table table-sm table-responsive table-borderless">
                            <tr class="company-img">
                                <td>
                                    <asp:Image ImageUrl="#" ID="Userimage" Width="150px" BorderWidth="1px" BorderColor="#000000" Height="130px" runat="server" />

                                </td>

                                <td class="job-tittle job-tittle2">
                                    <a href="#">
                                        <h5>
                                            <asp:Label ID="lbljobtitle" CssClass="font-weight-bold text-truncate ml-3" runat="server" Text="" />
                                        </h5>
                                    </a>
                                    <ul>

                                        <li><i class="fas fa-building"></i>
                                            Company :
                                                        <asp:Label ID="lblcompanyname" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />
                                        </li>
                                        <li>Education :<asp:Label ID="lbleducation" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />
                                            &nbsp; 
                                                     Experience :<asp:Label ID="lblexperience" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />
                                            &nbsp;
                                                    <i class="fas fa-map-marker-alt"></i>
                                            <asp:Label ID="lbllocation" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />
                                        </li>
                                        <li>Salary :<asp:Label ID="lblsalary" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />
                                            &nbsp;
                                                      Skills :<asp:Label ID="lblskills" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" /></li>
                                        <li>AppliedDate :
                                                        <asp:Label ID="lblapplieddate" CssClass="small text-danger font-weight-bold" runat="server" Text="" />
                                            &nbsp;
                                                      LastDate :
                                                        <asp:Label ID="lbllastdate" CssClass="small text-danger font-weight-bold" runat="server" Text="" />

                                        </li>
                                        <li>Name :<asp:Label ID="lblname" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />&nbsp;
                                                     Email :<asp:Label ID="lblemail" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" />&nbsp;
                                                     Mobile :<asp:Label ID="lblmobile" CssClass="text-dark" Font-Size="Smaller" runat="server" Text="" /></li>
                                        <br />
                                    </ul>
                                </td>


                            </tr>
                        </table>

                           <div class="row gutters">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <asp:Label Text="*" ID="lblmessage" ForeColor="Green" Visible="false" Font-Size="Medium" Font-Bold="true" runat="server" />
                            <div class="form-group">
                                <label class="form-label" for="txtemailid">Email-ID : </label>
                                <asp:TextBox runat="server" ID="txtemailid" CssClass="form-control form-control-sm" name="txtemailid" ReadOnly="true" />

                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label class="form-label" for="cmdstatus">Status :</label>
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Select Status..." InitialValue="Select Status" ControlToValidate="cmdstatus" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:DropDownList runat="server" ID="cmdstatus" CssClass="form-control" >
                                    <asp:ListItem Text="Select Status" Selected="True" />
                                    <asp:ListItem Text="Approved" />
                                    <asp:ListItem Text="Rejected" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="form-group">
                                <label class="form-label" for="txtmessage">Message  :</label>
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Descripation.." ControlToValidate="txtmessage" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtmessage" CssClass="form-control form-control-lg" Height="100px" TextMode="MultiLine" name="txtmessage" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter The Descripation....'" placeholder="Enter The Descripation...." />

                            </div>
                        </div>
                    </div>

                    <asp:Button Text="Send" CssClass="btn btn-primary" ID="btnsend" OnClick="btnsend_Click" runat="server" />

                    <asp:ValidationSummary runat="server" DisplayMode="BulletList" Font-Bold="true" ForeColor="Red" CssClass="mt-4" />

                    </div>
                </div>
            </div>
        </div>

 


    </div>




</asp:Content>
