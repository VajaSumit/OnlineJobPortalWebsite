<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageCategory.aspx.cs" Inherits="OnlineJobPortalWebsite.Admin.ManageCategory" %>

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
                        <h2 style="margin-bottom: 15px; margin-top: 10px; margin-left: 3px; font-weight: bold; color: gray">Manage Category</h2>


                        <h6 style="margin-top: 27px; margin-left: 3px; font-weight: bold; color: gray"><u>Add Category </u></h6>
                        <div class="row gutters">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group mt-3">
                                    <label for="txtcategoryname">Category Name :</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Category ..." Text="*" ControlToValidate="txtcategoryname" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox ID="txtcategoryname" runat="server" CssClass="form-control" name="txtcategoryname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Category'" placeholder="Enter Category" />
                                    <asp:Button Text="Add" ID="btnadd" runat="server" CssClass="btn btn-primary mt-3 ml-1" OnClick="btnadd_Click" />
                                </div>
                            </div>

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group mt-3">

                                    <div class="table-responsive m-4 ">
                                        <asp:GridView runat="server" ID="DataGridViewForDisplayData" PageSize="5" OnRowDeleting="DataGridViewForDisplayData_RowDeleting" OnRowEditing="DataGridViewForDisplayData_RowEditing" OnRowUpdating="DataGridViewForDisplayData_RowUpdating" OnRowCancelingEdit="DataGridViewForDisplayData_RowCancelingEdit" DataKeyNames="CId" Font-Size="X-Small" HeaderStyle-Font-Size="X-Small" CssClass="table table-borderless table-hover" Width="80%" AllowPaging="True" OnPageIndexChanging="DataGridViewForDisplayData_PageIndexChanging" PagerStyle-CssClass="pagination border-1 border-info" AutoGenerateColumns="False">
                                             <Columns>
                                                <asp:BoundField DataField="CName" HeaderText="Category Name" />
                                                  <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-sm btn-danger" HeaderText="Delete">
                                                    <ControlStyle CssClass="btn btn-sm btn-danger" Height="20px" Width="50px" Font-Size="XX-Small" />
                                                </asp:CommandField>
                                                <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-info" HeaderText="Edit">
                                                    <ControlStyle CssClass="btn btn-sm btn-info" Height="20px" Width="50px" Font-Size="XX-Small"></ControlStyle>
                                                </asp:CommandField>
                                            </Columns>
                                            <HeaderStyle CssClass="thead-dark" />

                                            <PagerStyle CssClass="pagination border-1 border-info"></PagerStyle>
                                        </asp:GridView>
                                    </div>

                                </div>
                            </div>



                        </div>

                        <%--   <h6 style="margin-top: 5px; margin-left: 3px; font-weight: bold; color: gray"><u>Edit Category </u></h6>
                        <div class="row gutters">

                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="form-group mt-3">
                                    <label for="txtcname">Category Name :</label>
                                    <asp:RequiredFieldValidator ErrorMessage="Please Enter Category ..." Text="*" ControlToValidate="txtcname" runat="server" Display="Dynamic" ForeColor="Red" />
                                    <asp:TextBox ID="txtcname" runat="server" CssClass="form-control" name="txtcname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Category'" placeholder="Enter Category" />
                                    <asp:Button Text="Update" ID="btnupdate" runat="server" CssClass="btn btn-primary mt-3 ml-1" OnClick="btnupdate_Click" />
                                </div>
                            </div>

                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
