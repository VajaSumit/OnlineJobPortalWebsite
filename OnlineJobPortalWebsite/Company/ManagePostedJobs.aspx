<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ManagePostedJobs.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.AllJobList" %>

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
                        <h3 style="margin-bottom: 12px; margin-top: 3px; margin-left: 3px; font-weight: bold; color: gray">Manage The Posted Job</h3>

                        <div class="d-none d-sm-inline-block form-inline mr-auto offset-9">
                            <asp:Label Text="*" ForeColor="Green" Font-Size="Small" Font-Bold="true" Visible="false" ID="lblmsg" runat="server" />
                            <div class="input-group">
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="*" ControlToValidate="txtjobtitle" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtjobtitle" CssClass="form-control bg-light border-0 small" name="txtjobtitle" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Job Title...'" placeholder="Search By Job Title..." />
                                <div class="input-group-append">
                                    <%--<button class="btn btn-primary" type="button" id="btnsearch">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>--%>
                                    <asp:Button Text="find" ID="btnsearch" CssClass="btn btn-primary" Font-Size="XX-Small" runat="server" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>

                        <br />

                        <div class="row gutters">
                            <div class="table-responsive m-4 ">
                                <asp:GridView runat="server" ID="DataGridViewForDisplayData" PageSize="3" OnRowDeleting="DataGridViewForDisplayData_RowDeleting" OnSelectedIndexChanged="DataGridViewForDisplayData_SelectedIndexChanged"  DataKeyNames="Id" Font-Size="X-Small" HeaderStyle-Font-Size="X-Small" CssClass="table table-borderless table-hover" AllowPaging="True" OnPageIndexChanging="DataGridViewForDisplayData_PageIndexChanging" AllowSorting="True" Width="100%" AutoGenerateColumns="False">

                                    <Columns>

                                        <asp:CommandField ShowCancelButton="False" ShowSelectButton="True">
                                        <ItemStyle CssClass="text-primary" Font-Bold="True" Font-Underline="True" ForeColor="#0000CC" />
                                        </asp:CommandField>
                                        <asp:TemplateField HeaderText="Job Title">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobTitle") %>' ID="lbljobtitle" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No Of Post">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("NumberOfPost") %>' ID="lblnumberofpost" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Job Descripation">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobDescripation") %>' ID="lbljobdescripation" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Education">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Education") %>' ID="lbleducation" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Experience">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Experience") %>' ID="lblexperience" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Skills">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Skills") %>' ID="lblskills" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salary">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Salary") %>' ID="lblsalary" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Last Date To Apply">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("LastDateToApply") %>' ID="lbllastdatetoapply" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Job-Type">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobType") %>' ID="lbljobtype" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Job-Category">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobCategory") %>' ID="lbljobcategory" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Job-Location">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobLocation") %>' ID="lbljoblocation" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Job-Status">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobStatus") %>' ID="lbljobstatus" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Company-Name">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CName") %>' ID="lblcname" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Company-Website">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CWebsite") %>' ID="lblcwebsite" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Email">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CEmail") %>' ID="lblcemail" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Logo">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# Eval("Clogo") %>' ID="lblclogo" runat="server" Text="Show" Target="_blank" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="State">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("State") %>' ID="lblstate" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Country">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Country") %>' ID="lblcountry" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Address">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Address") %>' ID="lbladdress" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ContactPersone">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CPersoneName") %>' ID="lblcpersonename" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact Number">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CPersoneMobileNo") %>' ID="lblcpersonemobileno" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" Width="100px" />
                                            <ItemTemplate>
                                                <asp:Button Text="Delete" ID="btnDelete" runat="server" Font-Size="XX-Small" Height="20px" Width="40px" CssClass="btn btn-sm btn-danger" CommandName="Delete" OnRowDataBound="OnRowDataBound" OnClientClick="return confirm('Are You Sure You Want to delete ?')" />
                                                <%--<asp:Button Text="Update" ID="btnUpdate" runat="server" Font-Size="XX-Small" Height="20px" Width="40px" CssClass="btn btn-sm btn-info" CommandName="Update" OnRowDataBound="OnRowDataBound" />--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                    <HeaderStyle CssClass="thead-dark" />
                                </asp:GridView>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
