<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UpdateAboutUsPage.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.UpdateAboutUsPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-40">
                <div class="card h-100">
                    <div class="card-body">
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Update Aboutus Page</h2>

                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-4 col-md-4 col-sm-4 col-12">

                                <label class="form-label" for="txtdescripation">Page Descripation  :</label>
                                <asp:TextBox runat="server" ID="txtdescripation" CssClass="form-control form-control-sm" Height="439px" Width="1000px" name="txtdescripation" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Page Descripation...'" placeholder="Page Descripation..." />
                                <ajaxToolkit:HtmlEditorExtender ID="txtdescripation_HtmlEditorExtender" runat="server" BehaviorID="txtdescripation_HtmlEditorExtender" TargetControlID="txtdescripation" EnableSanitization="false">
                                </ajaxToolkit:HtmlEditorExtender>
                            </div>
                        </div>

                        <asp:Button Text="Update" runat="server" ID="btnsubmit" CssClass="btn btn-sm btn-primary mt-3" OnClick="btnsubmit_Click" />
                    
                        <br />
                        <asp:RequiredFieldValidator Text="Please Enter The Page Descripation.." ErrorMessage="Please Enter The Page Descripation.." ControlToValidate="txtdescripation" runat="server" Display="Dynamic" ForeColor="Red" />


                
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
