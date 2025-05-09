using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceYt3.Admin
{
    public partial class SubCategory : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["breadcumbTitle"] = "Manage Sub category";
            Session["breadcumbPage"] = "SubCategory";
            lblmsg.Visible = false;
            if (!IsPostBack)
            {
                getCategories();
                getSubCategories();
            }
        }


        protected void getCategories()
        {
            conn = new SqlConnection(Utils.GetConnection());
            cmd = new SqlCommand("CategoryCrud", conn);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataBind();
        }
        protected void getSubCategories()
        {
            conn = new SqlConnection(Utils.GetConnection());
            cmd = new SqlCommand("SubCategoryCrud", conn);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rptSubCategory.DataSource = dt;
            rptSubCategory.DataBind();

        }
        protected void btnAddorUpdate_Click(object sender, EventArgs e)
        {
            string action = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            int subcategoryId = Convert.ToInt32(hfSubCategoryId.Value);
          
            bool isValidToExecute = false;
            conn = new SqlConnection(Utils.GetConnection());
            cmd = new SqlCommand("SubCategoryCrud", conn);
            cmd.Parameters.AddWithValue("@Action", subcategoryId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@SubCategoryName", txtSubCategoryName.Text);
            cmd.Parameters.AddWithValue("@SubCategoryId", subcategoryId);
            cmd.Parameters.AddWithValue("@CategoryId",   Convert.ToInt32(ddlCategory.SelectedValue));

            cmd.Parameters.AddWithValue("@IsActive", isCBActive.Checked);           
         
         
            cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    conn.Open();
                    var response = cmd.ExecuteNonQuery();
                    action = subcategoryId == 0 ? "inserted" : "updated";
                    lblmsg.Visible = true;
                    lblmsg.Text = "SubCategory " + action + " successfully";
                    lblmsg.CssClass = "alert alert-success";
                    getSubCategories();
                    Clear();
                }

                catch (Exception ex)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error : " + ex.Message;
                    lblmsg.CssClass = "alert alert-danger";

                }

                finally
                {
                    conn.Close();
                }


            }
        

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            txtSubCategoryName.Text = string.Empty;
            isCBActive.Checked = false;
            hfSubCategoryId.Value = "0";
            btnAddorUpdate.Text = "Add";
            ddlCategory.ClearSelection();

        }

        protected void rptSubCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblmsg.Visible = false;
            if (e.CommandName == "edit")
            {
                conn = new SqlConnection(Utils.GetConnection());
                cmd = new SqlCommand("SubCategoryCrud", conn);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@SubCategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtSubCategoryName.Text = dt.Rows[0]["SubCategoryName"].ToString();
                isCBActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"].ToString());        
                hfSubCategoryId.Value = dt.Rows[0]["SubCategoryId"].ToString();
                ddlCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                btnAddorUpdate.Text = "Update";

            }
            else
             if (e.CommandName == "delete")
            {
                conn = new SqlConnection(Utils.GetConnection());
                cmd = new SqlCommand("SubCategoryCrud", conn);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@SubCategoryId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblmsg.Visible = true;
                    lblmsg.Text = "Sub-Category deleted succesfully";
                    lblmsg.CssClass = "alert alert-success";                   
                    getSubCategories();

                }
                catch (Exception ex)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Error : " + ex.Message;
                    lblmsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    conn.Close();
                }
            }
        }


    }
}