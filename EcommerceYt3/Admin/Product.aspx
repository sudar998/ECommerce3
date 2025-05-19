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
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlSubCategory" ErrorMessage="SubCategory is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Price</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice" ErrorMessage="Price is required">

                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revPrice" runat="server" ControlToValidate="txtPrice" ValidationExpression="^\d+(?:\.\d{1,2})?$" ErrorMessage="Product Price is Invalid" ForeColor="Red" SetFocusOnError="true"
                                        Display="Dynamic" Font-Size="smaller">   </asp:RegularExpressionValidator>
                                </div>
                            </div>


                            <div class="col-md-3">
                                <label>Color</label>
                                <div class="form-group">

                                    <asp:ListBox ID="lboxColor" runat="server" CssClass="form-control" SelectionMode="Multiple" ToolTip="Use CTRL to select multiple Items">

                                        <asp:ListItem Value="1"> Blue </asp:ListItem>
                                        <asp:ListItem Value="2"> Red </asp:ListItem>
                                        <asp:ListItem Value="3"> Pink </asp:ListItem>
                                        <asp:ListItem Value="4"> Purple </asp:ListItem>
                                        <asp:ListItem Value="5"> Black </asp:ListItem>
                                        <asp:ListItem Value="6"> Yellow </asp:ListItem>
                                        <asp:ListItem Value="7"> White </asp:ListItem>
                                        <asp:ListItem Value="8"> Black </asp:ListItem>
                                        <asp:ListItem Value="9"> Brown </asp:ListItem>
                                    </asp:ListBox>

                                </div>
                            </div>


                            <div class="col-md-3">
                                <label>Size</label>
                                <div class="form-group">

                                    <asp:ListBox ID="lboxSize" runat="server" CssClass="form-control" SelectionMode="Multiple" ToolTip="Use CTRL to select multiple Items">

                                        <asp:ListItem Value="1"> XS </asp:ListItem>
                                        <asp:ListItem Value="2"> SM </asp:ListItem>
                                        <asp:ListItem Value="3"> M </asp:ListItem>
                                        <asp:ListItem Value="4"> L </asp:ListItem>
                                        <asp:ListItem Value="5"> XL </asp:ListItem>
                                        <asp:ListItem Value="6"> XXL </asp:ListItem>

                                    </asp:ListBox>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Quantity</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Enter Product Quantity" TextMode="Number"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity" ErrorMessage="Quantity is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Company Name</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Enter Product Company Name"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtCompanyName" ErrorMessage="Product Company Name is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-12">
                                <label>Short Description</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtShortDescription" runat="server" CssClass="form-control" placeholder="Enter Short Description" TextMode="MultiLine"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvShortDescription" runat="server" ForeColor="Red" Font-Size="small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtShortDescription" ErrorMessage="Short Description is required"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">

                        <div class="col-md-12">
                            <label>Long Description</label>
                            <div class="form-group">

                                <asp:TextBox ID="txtLongDescription" runat="server" CssClass="form-control" placeholder="Enter Long Description" TextMode="MultiLine"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLongDescription" runat="server" ForeColor="Red" Font-Size="small"
                                    Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtLongDescription" ErrorMessage="Long Description is required"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <div class="col-md-12">
                            <label>Long Description</label>
                            <div class="form-group">

                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Long Description" TextMode="MultiLine"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Font-Size="small"
                                    Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtLongDescription" ErrorMessage="Long Description is required"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>



                    <div class="row">

                        <div class="col-md-12">
                            <label>Additional Description</label>
                            <div class="form-group">

                                <asp:TextBox ID="addDescription" runat="server" CssClass="form-control" placeholder="Enter additional Description" TextMode="MultiLine"> </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddDescription" runat="server" ForeColor="Red" Font-Size="small"
                                    Display="Dynamic" SetFocusOnError="true" ControlToValidate="addDescription" ErrorMessage="Additional Description is required"></asp:RequiredFieldValidator>
                            </div>
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
