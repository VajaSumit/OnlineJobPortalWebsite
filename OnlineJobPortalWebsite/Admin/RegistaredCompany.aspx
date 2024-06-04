<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RegistaredCompany.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.RegistaredCompany" %>

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
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Manage Registred Companies</h2>

                        <div class="d-none d-sm-inline-block form-inline mr-auto offset-9">
                            <asp:Label Text="*" ForeColor="Green" Font-Size="Small" Font-Bold="true" Visible="false" ID="lblmsg" runat="server" />
                            <div class="input-group">
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="*" ControlToValidate="txtfullname" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtfullname" CssClass="form-control bg-light border-0 small" name="txtfullname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Name...'" placeholder="Search By Name..." />
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
                                <asp:GridView runat="server" ID="DataGridViewForDisplayData" PageSize="8" OnRowDeleting="DataGridViewForDisplayData_RowDeleting" DataKeyNames="id" Font-Size="X-Small" HeaderStyle-Font-Size="X-Small" CssClass="table table-borderless table-hover" AllowPaging="true" OnPageIndexChanging="DataGridViewForDisplayData_PageIndexChanging" PagerStyle-CssClass="pagination border-1 border-info" AllowSorting="False" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Company Name">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CompanyName") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Website">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CompanyWebsite") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company EmailID">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CompanyEmailId") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Type">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CompanyType") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Country">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Country") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("State") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Address") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Logo">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# Eval("CompanyLogo") %>' runat="server" Text="Show" Target="_blank" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Certificate Corpporation">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# Eval("CetificateCorpporation") %>' runat="server" Text="Show" Target="_blank" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Organisation Pan">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# Eval("OrganisationPan") %>' runat="server" Text="Show" Target="_blank" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                    <asp:Button Text="Delete" ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" CommandName="Delete" OnClientClick="return confirm('Are you sure ! you want to delete the data ?...')" />
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
