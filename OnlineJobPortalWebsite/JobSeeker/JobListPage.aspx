<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobListPage.aspx.cs" Inherits="OnlineJobPortalWebsite.JobSeeker.JobListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        #pagingDiv, #pagingDiv span, #pagingDiv a {
            margin: 10px;
        }
    </style>

    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Get your job</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <!-- Job List Area Start -->
        <div class="job-listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                    <!-- Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4">
                        <div class="row">
                            <div class="col-12">
                                <div class="small-section-tittle2 mb-45">
                                    <div class="ion">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                            width="20px" height="12px">
                                            <path fill-rule="evenodd" fill="rgb(27, 207, 107)"
                                                d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z" />
                                        </svg>
                                    </div>
                                    <h4>Filter Jobs</h4>
                                </div>
                            </div>
                        </div>
                        <!-- Job Category Listing start -->
                        <div class="job-category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <div class="small-section-tittle2">
                                    <h4>Job Category</h4>
                                </div>
                                <!-- Select job items start -->
                                <div class="select-job-items2">
                                    <asp:DropDownList ID="dropdownforcategory" CssClass="form-select " runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropdownforcategory_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <!--  Select job items End-->
                                <!-- select-Categories start -->
                                <div class="select-Categories pt-80 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Job Type</h4>
                                    </div>
                                    <div class="select-job-items2">
                                        <asp:DropDownList ID="dropdownforjobtype" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="dropdownforjobtype_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">Select Job Type</asp:ListItem>
                                            <asp:ListItem>FullTime</asp:ListItem>
                                            <asp:ListItem>PartTime</asp:ListItem>
                                            <asp:ListItem>Remote</asp:ListItem>
                                            <asp:ListItem>Freelance</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>
                                <!-- select-Categories End -->
                                <div class="select-Categories pt-5 pb-50">
                                    <div class="small-section-tittle2">
                                        <h4>Job Location</h4>
                                    </div>
                                    <asp:TextBox ID="txtjoblocation" runat="server" CssClass="form-control" name="txtjoblocation" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Location'" placeholder="Enter Location" />
                                    <asp:Button Text="Search" ID="btnsearch2" CssClass="btn-block btn-sm text-white btn-primary fa-search mt-5" runat="server" OnClick="btnsearch2_Click" />
                                </div>
                            </div>
                            <!-- single two -->


                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!-- Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8">
                        <!-- Featured_job_start -->
                        <section class="featured-job-area">
                            <div class="container">
                                <!-- Count of Job list Start -->
                                <div class="row">
                                    <asp:Label Text="*" ID="lbldisplaymsg" ForeColor="Green" Font-Bold="true" Visible="false" runat="server" />
                                    <div class="col-6 offset-6">
                                        <div class="input-group">
                                            <%--<asp:RequiredFieldValidator Text="*" ErrorMessage="*" ControlToValidate="txtjobtitle" runat="server" Display="Dynamic" ForeColor="Red" />--%>
                                            <asp:TextBox runat="server" ID="txtjobtitle" CssClass="form-control " name="txtjobtitle" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search By Job Title...'" placeholder="Search By Job Title..." />
                                            <div class="input-group-append">
                                                <asp:Button Text="Search" ID="btnsearch" CssClass="btn-block btn-sm text-white btn-primary fa-search" runat="server" OnClick="btnsearch_Click" />
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-12">
                                        <div class="count-job mb-35">
                                            <%--   <span>39, 782 Jobs found</span>--%>
                                            <!-- Select job items start -->
                                            <div class="select-Categories">
                                                <div class="select-job-items">
                                                    <span>Sort by</span>
                                                    <asp:DropDownList ID="cmdsortby" runat="server" CssClass="form-select">
                                                        <asp:ListItem Selected="True">Select</asp:ListItem>
                                                        <asp:ListItem>JobTitle</asp:ListItem>
                                                        <asp:ListItem>Vacancy</asp:ListItem>
                                                        <asp:ListItem>Salary</asp:ListItem>
                                                        <asp:ListItem>Experience</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <div class="input-group-append">
                                                        <asp:Button Text="Ok" ID="btnsort" CssClass="btn-block  text-white btn-info fa-search" runat="server" OnClick="btnsort_Click" />
                                                    </div>
                                                </div>
                                            </div>


                                            <!--  Select job items End-->
                                        </div>
                                    </div>
                                </div>
                                <!-- Count of Job list End -->
                                <!-- single-job-content -->
                                <div class="single-job-items mb-30">
                                    <div class="job-items">

                                        <asp:Panel ID="Panel1" runat="server" BorderStyle="NotSet" Font-Size="X-Small" ScrollBars="Vertical" Height="1000px" Width="810px">
                                            <asp:Repeater ID="Repeater1" runat="server">
                                                <ItemTemplate>
                                                    <table class="table table-sm table-responsive table-borderless">
                                                        <tr class="company-img">
                                                            <td>
                                                                <%--<img src='<%#Eval("Clogo")%>' runat="server" height="30px" width="65px" />--%>
                                                                <asp:Image ImageUrl='<%#Eval("Clogo")%>' ID="companylogo" Height="80px" Width="100px" BorderWidth="2px" BorderColor="#0066ff" runat="server" />
                                                            </td>

                                                            <td class="job-tittle job-tittle2">
                                                                <a href="#">
                                                                    <h4>
                                                                        <asp:Label ID="lblid" CssClass="font-weight-bold text-truncate" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label>
                                                                    </h4>
                                                                </a>
                                                                <ul>

                                                                    <li><i class="fas fa-building"></i>
                                                                        <asp:Label ID="Label5" CssClass="small text-gray-500" runat="server" Text='<%# Eval("CName") %>'></asp:Label></li>
                                                                    <li>Number Of Post :<asp:Label ID="Label1" CssClass="small text-gray-500" runat="server" Text='<%# Eval("NumberOfPost") %>'></asp:Label></li>
                                                                    <li><i class="fas fa-map-marker-alt"></i>
                                                                        <asp:Label ID="Label2" CssClass="small text-gray-500" runat="server" Text='<%# Eval("JobLocation") %>'></asp:Label></li>
                                                                    <li>Status :
                                                                        <asp:Label ID="Label4" CssClass="small text-danger font-weight-bold" runat="server" Text='<%# Eval("JobStatus") %>'></asp:Label></li>
                                                                    <li>Experience :
                                                                        <asp:Label ID="Label6" CssClass="small text-gray-500" runat="server" Text='<%# Eval("Experience") %>'></asp:Label></li>
                                                                    <%--<li>Lastdate To Apply :<asp:Label ID="Label7" CssClass="small text-gray-500" runat="server" Text='<%# Eval("LastDateToApply") %>'></asp:Label></li>--%>
                                                                    <li>Salary :
                                                                        <asp:Label ID="Label3" CssClass="small text-gray-500" runat="server" Text='<%# Eval("Salary") %>'></asp:Label></li>
                                                                    <asp:Label Text='<%# Eval("Id") %>' ID="lblJobId" Visible="false" CssClass="small text-gray-500" runat="server" />

                                                                    <li class="items-link items-link2 ml-20">
                                                                        <%--<asp:LinkButton Text="More Details.." runat="server" CssClass="text-primary font-weight-bold" OnClick="btnmoredetails_Click" PostBackUrl="~/JobSeeker/JobDetails.aspx" ID="btnmoredetails" />--%>
                                                                        <asp:Button Text="More Details.." runat="server" CssClass="btn-block btn-sm text-white btn-secondary" ID="btnviewdetails" OnClick="btnviewdetails_Click" />

                                                                    </li>
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


                                <!-- single-job-content -->

                            </div>
                        </section>
                        <!-- Featured_job_end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Job List Area End -->


    </main>


</asp:Content>
