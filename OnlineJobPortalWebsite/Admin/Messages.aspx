<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.Messages" %>

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
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Message Answer :</h2>

                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtfrom">From</label>
                                    <%--<asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The From Email-ID.." ControlToValidate="txtfrom" runat="server" Display="Dynamic" ForeColor="Red" />--%>
                                    <%--<asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtfrom" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />--%>
                                    <asp:TextBox runat="server" ID="txtfrom" ReadOnly="true" CssClass="form-control" name="txtfrom" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email-ID'" placeholder="Enter Email-ID" />
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group">
                                    <label for="txtto">To</label>
                                    <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The To Email-ID.." ControlToValidate="txtto" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:RegularExpressionValidator Text="*" ErrorMessage="Invalid Email" ControlToValidate="txtto" runat="server" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <asp:TextBox runat="server" ID="txtto" CssClass="form-control" name="txtto" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email-ID'" placeholder="Enter Email-ID" />
                                </div>
                            </div>


                        </div>

                        <div class="row gutters">


                            <div class="col-12">
                                <label class="form-label" for="txtsubject">Subject  :</label>
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter Subject.." ControlToValidate="txtsubject" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtsubject" CssClass="form-control form-control-sm" name="txtsubject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject" />
                            </div>

                            <div class="col-12 mt-3">
                                <label class="form-label" for="txtdescripation">Descripation  :</label>
                                <asp:RequiredFieldValidator Text="*" ErrorMessage="Please Enter The Descripation.." ControlToValidate="txtdescripation" runat="server" Display="Dynamic" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="txtdescripation" CssClass="form-control form-control-sm" Height="100px" name="txtdescripation" TextMode="MultiLine" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Descripation'" placeholder="Enter Descripation" />
                            </div>
                        </div>

                        <asp:Button Text="Send" runat="server" ID="btnsend" CssClass="btn btn-primary mt-3" OnClick="btnsend_Click" />

                        <br />
                        <br />

                        <asp:ValidationSummary runat="server" ForeColor="Red" DisplayMode="BulletList" />

                        <div class="row gutters">

                            <div class="table-responsive m-4 ">
                                <asp:GridView runat="server" ID="DataGridViewForDisplayData" PageSize="3" OnRowDeleting="DataGridViewForDisplayData_RowDeleting" DataKeyNames="id" Font-Size="X-Small" HeaderStyle-Font-Size="X-Small" CssClass="table table-borderless table-hover" AllowPaging="true" OnPageIndexChanging="DataGridViewForDisplayData_PageIndexChanging"  AllowSorting="False" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                    <%--    <asp:TemplateField HeaderText="From">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("From") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="To">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("To") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />

                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Subject") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descripation">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Descripation") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
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
