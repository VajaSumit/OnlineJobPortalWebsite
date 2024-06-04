<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ManageAppliedCandidate.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.ManageAppliedJobSeeker" %>

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

         #pagingDiv , #pagingDiv span, #pagingDiv a{
            margin:10px
        }
        th,td{
            padding:10px
        }

    </style>
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <div class="container mt-50">
        <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <h3 style="margin-bottom: 12px; margin-top: 3px; margin-left: 3px; font-weight: bold; color: gray">Manage Applied Candidate</h3>

                        <div class="d-none d-sm-inline-block form-inline mr-auto offset-9">
                            <asp:Label Text="*" ForeColor="Green" Font-Size="Small" Font-Bold="true" Visible="false" ID="lblmsg" runat="server" />
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txtname" CssClass="form-control bg-light border-0 small" name="txtname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Job Title...'" placeholder="Search By Job Title..." />
                                <div class="input-group-append">
                                    <asp:Button Text="find" ID="btnsearch" CssClass="btn btn-primary" Font-Size="XX-Small" runat="server" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>

                        <br />

            

                        

                        <asp:Panel ID="Panel1" runat="server" BorderStyle="NotSet" Font-Size="X-Small" ScrollBars="Vertical" Height="600px" Width="100%">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <table class="table table-sm table-responsive table-borderless">
                                        <tr class="company-img">
                                            <td>
                                                <%--<asp:Image ImageUrl='<%#Eval("UserImage")%>' ID="Userimage" Height="140px" Width="150px"  BorderWidth="1px" BorderColor="#000000" runat="server" />--%>
                                                <img src='<%#Eval("UserImage")%>' style="border-radius: 50%;border-width:1px; border-color:black;" runat="server" height="140" width="150" />
                                                        <asp:Label Text='<%# Eval("Id") %>' ID="lblId" Visible="false" CssClass="small text-gray-500" runat="server" />

                                            </td>

                                            <td class="job-tittle job-tittle2">
                                                <a href="#">
                                                    <h5>
                                                        <asp:Label ID="lbljobtitle" CssClass="font-weight-bold text-truncate ml-3" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label>
                                                        <asp:Label Text='<%# Eval("JAId") %>' ID="lblJobAppliedId" Visible="false" CssClass="small text-gray-500" runat="server" />
                                                    </h5>
                                                </a>
                                                <ul>

                                                    <li><i class="fas fa-building"></i>
                                                        Company :
                                                        <asp:Label ID="Label5" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label></li>
                                                    <li>Education :<asp:Label ID="Label1" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
                                                        &nbsp; 
                                                     Experience :<asp:Label ID="Label7" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>
                                                        &nbsp;
                                                    <i class="fas fa-map-marker-alt"></i>
                                                        <asp:Label ID="Label2" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Location") %>'></asp:Label></li>
                                                    <li>Salary :<asp:Label ID="Label3" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                        &nbsp;
                                                      Skills :<asp:Label ID="Label8" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Skills") %>'></asp:Label></li>
                                                    <li>AppliedDate :
                                                        <asp:Label ID="Label4" CssClass="small text-danger font-weight-bold" runat="server" Text='<%# Eval("AppliedDate") %>'></asp:Label>
                                                        &nbsp;
                                                      LastDate :
                                                        <asp:Label ID="Label9" CssClass="small text-danger font-weight-bold" runat="server" Text='<%# Eval("LastDate") %>'></asp:Label></li>
                                                    <li>Name :<asp:Label ID="Label6" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Username") %>'></asp:Label>&nbsp;
                                                     Email :<asp:Label ID="Label10" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Email") %>'></asp:Label>&nbsp;
                                                     Mobile :<asp:Label ID="Label11" CssClass="text-dark" Font-Size="Smaller" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label></li>

                                                    <br />

                                                    

                                                        <div class="input-group">
                                                            <div class="input-group-append font-weight-bold">
                                                                <asp:HyperLink Text="View Resume" NavigateUrl='<%# Eval("Resume") %>' Font-Size="Smaller" CssClass="btn btn-sm btn-secondary" Height="20px" Target="_blank" runat="server" /> &nbsp;&nbsp;
                                                                <asp:Button Text="View Details" runat="server" CssClass="btn btn-sm btn-primary" Font-Size="Smaller" ID="btnviewdetails" Height="20px" OnClick="btnviewdetails_Click" /> &nbsp;&nbsp;
                                                                <asp:Button Text="Take Action" runat="server" CssClass="btn btn-sm btn-info" Font-Size="Smaller" ID="btntakeaction" Height="20px" OnClick="btntakeaction_Click" />&nbsp;&nbsp;
                                                                <asp:Button Text="Delete" runat="server" CssClass="btn btn-sm btn-danger" Font-Size="Smaller" ID="btndelete" Height="20px" CommandName="Delete" OnClick="btndelete_Click" OnClientClick="return confirm('Are you sure ! you want to delete the data ?...')" /> 
                                                                 
                                                            </div>
                                                        </div>

                                             




                                                </ul>




                                            </td>


                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <SeparatorTemplate>
                                    <hr style="border-color: gray; border-width: 1px;" />
                                </SeparatorTemplate>
                            </asp:Repeater>

                        </asp:Panel>

                         <div id="pagingDiv" runat="server"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
