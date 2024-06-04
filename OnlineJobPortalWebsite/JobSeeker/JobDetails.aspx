<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="OnlineJobPortalWebsite.JobSeeker.JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>
                                    <asp:Label Text="*" ID="lbljobtitle1" runat="server" /></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#">
                                        <asp:Image ImageUrl="#" ID="companylogo" Height="80px" Width="100px" BorderWidth="2px" BorderColor="#0066ff" runat="server" /></a>
                                </div>
                                <div class="job-tittle">
                                    <a href="#">
                                        <h4>
                                            <asp:Label Text="*" ID="lbljobtitle2" runat="server" />
                                        </h4>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:Label Text="*" ID="lblcompanyname1" runat="server" /></li>
                                        <li><i class="fas fa-map-marker-alt"></i>
                                            <asp:Label Text="*" ID="lbljoblocation1" runat="server" /></li>
                                        <li>$<asp:Label Text="*" ID="lblsalary" runat="server" /></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- job single End -->

                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Job Description</h4>
                                </div>
                                <p>
                                    <asp:Label Text="*" ID="lbljobdescripation" runat="server" />
                                </p>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Required Knowledge, Skills, and Abilities</h4>
                                </div>
                                <ul>
                                    <li>
                                        <asp:Label Text="*" ID="lblskills" runat="server" /></li>
                                </ul>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Job Category</h4>
                                </div>
                                <ul>
                                    <li>
                                        <asp:Label Text="*" ID="lbljobcategory" runat="server" /></li>
                                </ul>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Education</h4>
                                </div>
                                <ul>
                                    <li>
                                        <asp:Label Text="*" ID="lbleducation" runat="server" /></li>
                                </ul>
                            </div>
                            <div class="post-details2  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Experience</h4>
                                </div>
                                <ul>
                                    <li>
                                        <asp:Label Text="*" ID="lblexperience" runat="server" /></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Job Overview</h4>
                            </div>
                            <ul>

                                <li>Location : <span>
                                    <asp:Label Text="*" ID="lbljoblocation2" runat="server" /></span></li>
                                <li>Vacancy : <span>
                                    <asp:Label Text="*" ID="lblnumberofpost" runat="server" /></span></li>
                                <li>Job nature : <span>
                                    <asp:Label Text="*" ID="lbljobtype" runat="server" /></span></li>
                                <li>Salary :  <span>
                                    <asp:Label Text="*" ID="lblsalary2" runat="server" /></span></li>
                                <li>Lastdate to apply : <span>
                                    <asp:Label Text="*" ID="lbllastdatetoapply" runat="server" /></span></li>
                                <li>Job Status : <span>
                                    <asp:Label Text="*" ID="lblstatus" runat="server" /></span></li>
                            </ul>
                            <div class="apply-btn2">
                                <asp:Button Text="Apply Now" CssClass="btn" ID="btnapply" OnClick="btnapply_Click" runat="server" />
                            </div>
                        </div>
                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                            <div class="small-section-tittle">
                                <h4>Company Information</h4>
                            </div>

                            <ul>
                                <li>Name: <span>
                                    <asp:Label Text="*" ID="lblcompanyname" runat="server" />
                                </span></li>
                                <li>Web : <span>
                                    <asp:Label Text="*" ID="lblcompanywebsite" runat="server" /></span></li>
                                <li>Email : <span>
                                    <asp:Label Text="*" ID="lblcompanyemailid" runat="server" /></span></li>
                                <li>State : <span>
                                    <asp:Label Text="*" ID="lblstate" runat="server" /></span></li>
                                <li>Country: <span><asp:Label Text="*" ID="lblcountry" runat="server" /></span></li>
                                <li>Address : <span><asp:Label Text="*" ID="lbladdress" runat="server" /></span></li>
                                <li>Contact-Persone-Name : <span>
                                    <asp:Label Text="*" ID="lblcontactpersonename" runat="server" /></span></li>
                                <li>Contact-Persone-Mobile : <span>
                                    <asp:Label Text="*" ID="lblcontactpersonemobile" runat="server" /></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- job post company End -->

    </main>

</asp:Content>
