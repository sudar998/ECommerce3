using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceYt3.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Visible = false;
            getCategories();
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
            rptCategory.DataSource = dt; 
            rptCategory.DataBind(); 


        }
        protected void btnAddorUpdate_Click(object sender, EventArgs e)
        {
            string action = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            int categoryId = Convert.ToInt32(hfCategoryId.Value);
            bool isValidToExecute = false;
            conn = new SqlConnection(Utils.GetConnection());
            cmd = new SqlCommand("CategoryCrud", conn);
            cmd.Parameters.AddWithValue("@Action", categoryId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CategoryName", txtCategoryName.Text);
            cmd.Parameters.AddWithValue("@CategoryId", categoryId);
            cmd.Parameters.AddWithValue("@IsActive", isCBActive.Checked);

            if (fuCategoryImage.HasFile)
            {
                if (Utils.isValidExtension(fuCategoryImage.FileName))
                {
                    string filenameId = Utils.GenerateUniqueId();
                    fileExtension = Path.GetExtension(fuCategoryImage.FileName);
                    imagePath = "Images/Category/" + filenameId + fileExtension;
                    fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/" + filenameId + fileExtension));
                    cmd.Parameters.AddWithValue("@CategoryImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblmsg.Visible = false;
                    lblmsg.Text = "Please select .jpg, .png or .jpeg";
                    lblmsg.CssClass = "alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    conn.Open();
                    var response = cmd.ExecuteNonQuery();
                    action = categoryId == 0 ? "inserted" : "updated";
                    lblmsg.Visible = true;
                    lblmsg.Text = "Category " + action + " successfully";
                    lblmsg.CssClass = "alert alert-success";
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        public void Clear()
        {
            txtCategoryName.Text = string.Empty;
            isCBActive.Checked = false;
            hfCategoryId.Value = "0";
            btnAddorUpdate.Text = "Add";
            imagePreview.ImageUrl = string.Empty; 
        }
    }
}