﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="EcommerceYt3.Admin.Category" %>

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

                    <h4 class="card-title">Category List </h4>
                    <div class="table-responsive">


                        <asp:Repeater ID="rptCategory" runat="server">

                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>

                                            <th class="table-plus">Name </th>
                                            <th>Image </th>
                                            <th>IsActive </th>
                                            <th>CreatedDate</th>
                                            <th class="datatable-nosort">Action </th>


                                        </tr>
                                    </thead>
                                    <tbody>

                                  
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus">
                                        <%# Eval("CategoryName") %>
                                    </td>
                                    <td>
                                        <img width="40" src="<%# EcommerceYt3.Utils.GetImageUrl(Eval("CategoryImageUrl")) %>" alt="image" />
                                    </td>

                                    <td>
                                        <asp:Label ID="lblIsActive" runat="server"
                                            Text='<%# (bool)Eval("IsActive") == true ? "Active" : "In-Active"  %>'
                                            CssClass='<%# (bool)Eval("IsActive") == true ? "badge badge-success" : "badge badge-danger" %>'> 


                                        </asp:Label>
                                    </td>
                                    <td>
                                        <%# Eval("CreatedDate") %>
                                       
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="lbEdit" runat="server" Text="Edit" CssClass="badge badge-primary">
                                            <i class="fas fa-edit"></i>
                                      </asp:LinkButton>

                                        <asp:LinkButton ID="lbDelete" runat="server" Text="Delete" CssClass="badge badge-danger">
                                          <i class="fas fa-trash-alt"></i>
                                       </asp:LinkButton>


                                    </td>
                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                 </table>
                                
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
