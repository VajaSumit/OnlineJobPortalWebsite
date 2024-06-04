<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeeker.Master" AutoEventWireup="true" CodeBehind="AppliedJobs.aspx.cs" Inherits="OnlineJobPortalWebsite.JobSeeker.AppliedJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>

    <style>
        body {
            margin: 0;
            padding-top: 20px;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
        }

        #pagingDiv, #pagingDiv span, #pagingDiv a {
            margin: 10px;
        }
    </style>

    <section class="testimonial p-7" id="testimonial">
        <%--  <div class="container">
            <div class="row">

                <div class="col-md-12 py-5 border" style="background-color: white;">

                    <div class="table-responsive justify-content-center align-items-center">
                        <asp:GridView runat="server" ID="DataGridViewForDisplayData" CssClass="table table-borderless" Width="821px" Height="16px" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellSpacing="5">
                            <Columns>
                                <asp:TemplateField HeaderText="USERNAME">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Username") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PASSWORD">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Password") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NAME">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Name") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="GENDER">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Gender") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BRITHDAY">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Brithday") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EMAIL">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Email") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="MOBILE">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Mobile") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="COUNTRY">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Country") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STATE">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("State") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ADDRESS">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("Address") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:HyperLinkField DataNavigateUrlFields="Image" HeaderText="DOWNLOAD FILE" Target="_blank" Text="Download" />
                               
                            </Columns>
                            <HeaderStyle CssClass="thead-dark" />
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>--%>

        <div class="container mt-30">
            <div class="row gutters">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-40">
                    <div class="card h-100">
                        <div class="card-body">
                            <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Applied Jobs List</h2>

                            <div class="row gutters">
                                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-auto col-6">
                                    <asp:Panel ID="Panel1" runat="server" BorderStyle="NotSet" CssClass="form-control" Font-Size="X-Small" ScrollBars="Vertical" Height="500px" Width="100%">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>
                                                <table class="table table-sm table-responsive table-borderless">
                                                    <tr>
                                                        <td style="font-weight: bold">
                                                            <lable>JobTitle</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbljobtitle" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label>
                                                        </td>

                                                        <td style="font-weight: bold">
                                                            <lable>CompanyName</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblcompanyname" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="font-weight: bold">
                                                            <lable>Education</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbleducation" runat="server" Text='<%# Eval("Education") %>'></asp:Label>
                                                        </td>
                                                        <td style="font-weight: bold">
                                                            <lable>Experience</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblexperience" runat="server" Text='<%# Eval("Experience") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold">
                                                            <lable>Salary</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblsalary" runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                                                        </td>
                                                        <td style="font-weight: bold">
                                                            <lable>Skills</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblskills" runat="server" Text='<%# Eval("Skills") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-weight: bold">
                                                            <lable>AppliedDate</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblapplieddate" runat="server" Text='<%# Eval("AppliedDate") %>'></asp:Label>
                                                        </td>
                                                        <td style="font-weight: bold">
                                                            <lable>Location</lable>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbllocation" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr class="mt-3">
                                                        <td style="font-weight: bold; font-size: medium; text-decoration: underline;">
                                                            <asp:HyperLink NavigateUrl='<%# Eval("Resume") %>' CssClass="text-primary" runat="server" Text="View Resume" Target="_blank" />
                                                        </td>
                                                        <td>
                                                            <asp:Button Text="More Details" runat="server" CssClass="btn btn-sm" ID="btnViewMoreDetails" OnClick="btnViewMoreDetails_Click" />

                                                            <asp:Label ID="lblJobId" Visible="false" runat="server" Text='<%# Eval("JId") %>'></asp:Label>

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


                                <div class="col-xl-6 col-lg-6 col-md-12  col-sm-auto col-6">
                                    <asp:Image ImageUrl="../assets/img/img3.jpeg" runat="server" Height="500px" Width="100%" />
                                </div>


                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>



</asp:Content>
