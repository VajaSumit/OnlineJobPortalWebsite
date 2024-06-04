<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageAppliedCandidates.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.ManageAppliedCandidates" %>

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
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Manage Applied Candidates</h2>

                        <div class="d-none d-sm-inline-block form-inline mr-auto offset-9">
                            <asp:Label Text="*" ForeColor="Green" Font-Size="Small" Font-Bold="true" Visible="false" ID="lblmsg" runat="server" />
                            <div class="input-group">
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="*" ControlToValidate="txtjobtitle" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtjobtitle" CssClass="form-control bg-light border-0 small" name="txtjobtitle" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Job Title...'" placeholder="Search By Job Title..." />
                                <div class="input-group-append">
                                    <asp:Button Text="find" ID="btnsearch" CssClass="btn btn-primary" Font-Size="XX-Small" runat="server" OnClick="btnsearch_Click" />
                                </div>
                            </div>
                        </div>

                        <br />

                        <div class="row gutters">

                            <div class="table-responsive m-4 ">
                                <asp:GridView runat="server" ID="DataGridViewForDisplayData" PageSize="5" OnRowDeleting="DataGridViewForDisplayData_RowDeleting" DataKeyNames="Id" Font-Size="X-Small" HeaderStyle-Font-Size="X-Small" CssClass="table table-borderless table-hover" AllowPaging="true" OnPageIndexChanging="DataGridViewForDisplayData_PageIndexChanging" AllowSorting="False" Width="100%" AutoGenerateColumns="False">

                                    <Columns>
                                        <asp:TemplateField HeaderText="JobTitle">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JobTitle") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CompanyName">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("CompanyName") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Education">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Education") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Experience">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Experience") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Location">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Location") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Salary">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Salary") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Skills">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Skills") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="AppliedDate">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("AppliedDate") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Username">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Username") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Mobile">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Mobile") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                       
                                        <asp:TemplateField HeaderText="Resume">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# Eval("Resume") %>' runat="server" Text="View" Target="_blank" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Button Text="Delete" ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" CommandName="Delete" OnRowDataBound="OnRowDataBound" OnClientClick="return confirm('Are You Sure You Want to delete ?')" />
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
