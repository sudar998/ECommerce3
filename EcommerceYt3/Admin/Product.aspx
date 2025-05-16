<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="EcommerceYt3.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mb-4">
        <asp:Label ID="lblmsg" runat="server">  </asp:Label>
    </div>
    <div class="row">

        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-body">

                    <h4 class="card-title">Product </h4>
                    <hr />
                    <div class="form-body">

                        <div class="row">
                            <div class="col-md-6">
                                <label>Product Name</label>
                                <div class="form-group">

                                    <asp:TextBox ID="ProductName" runat="server" CssClass="form-control" placeholder="Enter Category Name"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfProductName" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="ProductName" ErrorMessage="Product Name is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <%--  category --%>
                            <div class="col-md-3">
                                <label>Category</label>
                                <div class="form-group">

                                    <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="true" AutoPostBack="true">
                                        <asp:ListItem Value="0"> Select Category </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCategory" ErrorMessage="Category is required" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                          <%--  Sub-Category--%>

                            <div class="col-md-3">
                                <label>Sub-Category</label>
                                <div class="form-group">

                                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="true">
                           
                                        </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvSubCategory" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlSubCategory" ErrorMessage="SubCategory is required" ></asp:RequiredFieldValidator>
                                </div>
                            </div>


                        </div>


                       <%-- <label>Category Image </label>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control"
                                        onchange="ImagePreview(this);" />
                                    <asp:HiddenField ID="hfCategoryId" runat="server" Value="0" />
                                </div>
                            </div>
                        </div>--%>


                       <%-- <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">

                                    <asp:CheckBox ID="isCBActive" runat="server" Text="&nbsp isActive" />

                                </div>
                            </div>
                        </div>--%>

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

    </div>

</asp:Content>
