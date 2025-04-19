<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="EcommerceYt3.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mb-4">
        <asp:Label ID="lblmsg" runat="server">  </asp:Label>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">

                    <h4 class="card-title">Category </h4>
                    <hr />
                    <div class="form-body">

                        <label>Category Name </label>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter Category Name"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfCategoryName" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtCategoryName" ErrorMessage="Category Name is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>


                        <label>Category Image </label>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" />
                                    <asp:HiddenField ID="hfCategoryId" runat="server" Value="0" />
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                    <asp:CheckBox ID="isCBActive" runat="server" Text="&nbsp isActive" />

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="form-action pb-5">

                        <div class="text-left">
                            <asp:Button ID="btnAddorUpdate" runat="server" CssClass="btn btn-info" Text="Add" OnClick="btnAddorUpdate_Click" />
                            <asp:Button ID="btnClear" runat="server" CssClass="btn btn-dark" Text="Clear" OnClick="btnClear_Click" />
                        </div>
                    </div>

                    <div>

                        <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" AlternateText="" />
                    </div>

                </div>
            </div>
        </div>



        <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">

                    <h4 class="card-title">Category </h4>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
