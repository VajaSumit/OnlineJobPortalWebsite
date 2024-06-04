<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.Notifications" %>

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
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">User Message Notifications </h2>


                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <asp:Panel ID="Panel1" runat="server" BorderStyle="NotSet" CssClass="form-control" Font-Size="X-Small" ScrollBars="Vertical" Height="500px" Width="100%">
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                        <ItemTemplate>
                                            <table class="table table-sm table-responsive table-borderless">
                                           
                                                <tr>
                                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Id") %>'></asp:Label>

                                                    <td style="font-weight: bold">
                                                        <lable>Name</lable>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="font-weight: bold">
                                                        <lable>Email</lable>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-weight: bold">
                                                        <lable>Subject</lable>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Subject") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-weight: bold">
                                                        <lable>Message</lable>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="font-weight: bold">
                                                        <lable>Action</lable>
                                                    </td>
                                                    <td>
                                                        <asp:Button Text="Replay" runat="server" CssClass="btn btn-sm btn-primary" ID="btnreplay" OnClick="btnreplay_Click" />
                                                        <asp:Button Text="Delete" runat="server" CssClass="btn btn-sm btn-danger" ID="btndelete" CommandName="Delete" OnClick="btndelete_Click" OnClientClick="return confirm('Are you sure ! you want to delete the data ?...')" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                            <br />
                                        </SeparatorTemplate>
                                    </asp:Repeater>

                                </asp:Panel>
                            </div>





                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
