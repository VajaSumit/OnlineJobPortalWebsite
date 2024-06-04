<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker/JobSeeker.Master" AutoEventWireup="true" CodeBehind="FeedbackAndRattingPage.aspx.cs" Inherits="OnlineJobPortalWebsite.JobSeeker.FeedbackAndRattingPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>

    <style>
        /*.starEmpty{
            background-image:url('..assets/img/star1.png');
            background-color:aqua;
        }    
        
        .starfilled{
            background-image:url('..assets/img/star2.png');
            background-color:red;
        }*/

        /* Rating */
        .ratingStar {
            font-size: 0pt;
            width: 50px;
            height: 61px;
            margin: 2px;
            padding: 4px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
           
        }

        .filledRatingStar {
            background-image: url(../assets/img/FilledStar.jpg);
        }

        .emptyRatingStar {
            background-image: url(../assets/img/EmptyStar.jpg);
        }

        .savedRatingStar {
            background-image: url(../assets/img/FilledStar.jpg);
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <section class="testimonial p-5" id="testimonial" style="background-color:whitesmoke;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 py-1 bg-white">
                    <div class=" ">
                        <div class="card-body text-center">
                            <img src="../assets/img/profile.ico" alt="Avatar" id="img1" runat="server" style="border-radius: 50%; height: 150px; width: 180px; border: 1px solid black;">
                        </div>
                        <asp:Label Text="" ID="lbldate" runat="server" />
                        <h6 class="text-primary mt-2">Ratting : </h6>
                        <ajaxToolkit:Rating
                            ID="Rating1"
                            BehaviorID="RatingBehavior1"
                            runat="server"
                            CurrentRating="1"
                            StarCssClass="ratingStar"
                            WaitingStarCssClass="savedRatingStar"
                            FilledStarCssClass="filledRatingStar"
                            EmptyStarCssClass="emptyRatingStar"
                            OnChanged="Rating1_Changed">
                        </ajaxToolkit:Rating>
                    </div>


                </div>
                <div class="col-md-9 py-2 border" style="background-color: white;">
                    <h4 class="pb-2">Ratting and reviews : </h4>
                    <%--<form>--%>
                    <div class="form-row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 text-primary">Your Information </h6>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="form-label">Your Name :</label>
                            <asp:TextBox runat="server" ID="txtfullname" ReadOnly="true" CssClass="form-control form-control-sm" name="txtfullname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Name'" placeholder="Enter Your Name" />
                        </div>
                        <div class="form-group col-md-6">
                           <label class="form-label">EmailID :</label>
                           <asp:TextBox runat="server" ID="txtemail" ReadOnly="true" CssClass="form-control form-control-sm" name="txtemail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Your Email-ID'" placeholder="Enter Your Email-ID" />
                       
                       </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label class="form-label" for="txtmessage">Message/Description  :</label>
                            <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Description.." ControlToValidate="txtmessage" runat="server" Display="Dynamic" ForeColor="Red" />
                            <asp:TextBox runat="server" ID="txtmessage" CssClass="form-control form-control-sm" name="txtmessage" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Describe your experience..'" placeholder="Describe your experience.." />

                        </div>
                    </div>


                    <div class="form-row mt-1 ml-1 mb-1">
                        <asp:Button Text="Submit" runat="server" CssClass="btn btn-danger" ID="btnsubmit" OnClick="btnsubmit_Click" />

                    </div>

                    <div>
                        <div>
                            <asp:ValidationSummary runat="server" ForeColor="Red" Font-Size="Smaller" DisplayMode="BulletList" />
                        </div>
                    </div>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </section>


</asp:Content>
