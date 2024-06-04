<%@ Page Title="" Language="C#" MasterPageFile="~/Company/CompanyMaster.Master" AutoEventWireup="true" CodeBehind="ViewSingleCandidateDetails.aspx.cs" Inherits="OnlineJobPortalWebsite.Company.ViewSingleCandidateDetails" %>

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
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <div class="container mt-70">
        <div class="row gutters">
            <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">

                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
                                    <asp:Image ImageUrl="../assets/img/profile.ico" runat="server" Height="200px" Width="200px" ID="profileimage" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ImageAlign="Middle" />
                                </div>
                            </div>
                         
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="row gutters">
                            <asp:Label Text="*" Font-Size="Medium" ForeColor="Green" Visible="false" CssClass="m-4" ID="lblmsg" runat="server" />
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-2 text-primary font-weight-bold">Personal Details</h6>
                            </div>
                    
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblfullname" style="font-weight:bold;">Fullname</label>
                                    <asp:Label Text="" ID="lblfullname" runat="server" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblgender" style="font-weight:bold;">Gender</label>
                                    <asp:Label Text="" ID="lblgender" runat="server" />

                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblbrithday" style="font-weight:bold;">Brithday</label>
                                    <asp:Label Text="" ID="lblbrithday" runat="server" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblemail" style="font-weight:bold;">Email</label>
                                    <asp:Label Text="" ID="lblemail" runat="server" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblmobile" style="font-weight:bold;">Mobile</label>
                                    <asp:Label Text="" ID="lblmobile" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mt-3 mb-2 text-primary" style="font-weight:bold;">Address</h6>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblcountry" style="font-weight:bold;">Country</label>
                                    <asp:Label Text="" ID="lblcountry" runat="server" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="lblstate" style="font-weight:bold;">State</label>
                                    <asp:Label Text="" ID="lblstate" runat="server" />
                                </div>
                            </div>
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="form-group">
                                    <label for="lbladdress" style="font-weight:bold;">Address</label>
                                    <asp:Label Text="" ID="lbladdress" runat="server" />
                                </div>
                            </div>

                        </div>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="lblskills" style="font-weight:bold;">Skills :</label>
                                    <asp:Label Text="" ID="lblskills" runat="server" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label class="form-label" for="lblaboutme" style="font-weight:bold;">About Me  :</label>
                                    <asp:Label Text="" ID="lblaboutme" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group mt-3">
                                    <label for="FileUploadForResume" class="form-label" style="font-weight:bold;">View Resume :</label>
                                    <br />
                                    <a href="#" style="font-size: medium; text-decoration: underline; color: blue; margin-left: 2px;" runat="server" id="ViewResume" target="_blank">View</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
