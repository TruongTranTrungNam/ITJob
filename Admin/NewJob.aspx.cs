using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITJob.Admin
{
    public partial class NewJob : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["sql_itjob"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/AdminLogin.aspx");
            }
            Session["title"] = "Thêm việc";
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
            if(Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "Select * from Jobs where JobId = '" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        ddlTitleJob.SelectedValue = sdr["TitleJobName"].ToString();
                        ddlLevelJob.SelectedValue = sdr["LevelJobName"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();
                        txtQualification.Text = sdr["Qualification"].ToString();
                        txtExperience.Text = sdr["Experience"].ToString();
                        txtSpecialization.Text = sdr["Specialization"].ToString();
                        txtLastDate.Text = Convert.ToDateTime(sdr["LastDateToApply"]).ToString("yyyy-MM-dd");
                        txtSalary.Text = sdr["Salary"].ToString();
                        ddlJobType.SelectedValue = sdr["JobType"].ToString();
                        txtCompany.Text = sdr["CompanyName"].ToString();
                        txtWebsite.Text = sdr["Website"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtAddress.Text = sdr["Address"].ToString();
                        ddlCity.SelectedValue = sdr["City"].ToString();
                        btnAdd.Text = "Cập nhật";
                        linkBack.Visible = true;
                        Session["title"] = "Chỉnh sửa công việc";
                    }
                   

                }
                else
                {
                    lblMsg.Text = "Công việc không tồn tại";
                    lblMsg.CssClass = "alert alert-danger";
                }
                sdr.Close();
                con.Close();
            }   
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValiddToExecute = false;
                con = new SqlConnection(str);
                if(Request.QueryString["id"] != null)
                {
                    if (fuCompanyLogo.HasFile)
                    {
                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            concatQuery = "CompanyImage= @CompanyImage,";
                        }
                        else
                        {
                            concatQuery = string.Empty;

                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;

                    }
                    query = @"Update Jobs set TitleJobName=@TitleJobName,LevelJobName=@LevelJobName,Description=@Description,Qualification=@Qualification,
                            Experience=@Experience,Specialization=@Specialization,LastDateToApply=@LastDateToApply,Salary=@Salary,JobType=@JobType,
                            CompanyName=@CompanyName,"+ concatQuery +@" Website=@Website,Email=@Email,Address=@Address,City=@City where JobId=@id";

                    type = "Cập nhật";

                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@TitleJobName", ddlTitleJob.SelectedValue);
                    cmd.Parameters.AddWithValue("@LevelJobName", ddlLevelJob.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Specialization", txtSpecialization.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());

                    cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", ddlCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());

                    if (fuCompanyLogo.HasFile)
                    {

                        if (Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValiddToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Sử dụng .jpg, .jpeg, .png file cho Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                       
                        isValiddToExecute = true;
                    }

                }
                else
                {
                    query = "Insert into Jobs values(@TitleJobName,@LevelJobName,@Description,@Qualification,@Experience," +
                        "@Specialization,@LastDateToApply,@Salary,@JobType,@CompanyName,@CompanyImage,@Website,@Email,@Address,@City,@CreateDate)";
                    type = "Thêm";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@TitleJobName", ddlTitleJob.SelectedValue);
                    cmd.Parameters.AddWithValue("@LevelJobName", ddlLevelJob.SelectedValue);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@Qualification", txtQualification.Text.Trim());
                    cmd.Parameters.AddWithValue("@Experience", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Specialization", txtSpecialization.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastDateToApply", txtLastDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text.Trim());
                    cmd.Parameters.AddWithValue("@JobType", ddlJobType.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text.Trim());

                    cmd.Parameters.AddWithValue("@Website", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", ddlCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@CreateDate", time.ToString("yyyy-MM-dd HH:mm:ss"));

                    if (fuCompanyLogo.HasFile)
                    {

                        if ( Utils.IsValidExtension(fuCompanyLogo.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fuCompanyLogo.FileName;
                            fuCompanyLogo.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fuCompanyLogo.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValiddToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Sử dụng .jpg, .jpeg, .png file cho Logo";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValiddToExecute = true;
                    }

                   
                }
                if (isValiddToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text =  type + " thành công..!";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Không thể " + type + ", thử lại";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        private void clear()
        {
            ddlTitleJob.ClearSelection();
            ddlLevelJob.ClearSelection();
            txtDescription.Text = string.Empty;
            txtQualification.Text = string.Empty;
            txtExperience.Text = string.Empty;
            txtSpecialization.Text = string.Empty;
            txtLastDate.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtCompany.Text = string.Empty;
            txtWebsite.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlJobType.ClearSelection();
            ddlCity.ClearSelection();
        }

        //private bool IsValidExtension(string fileName)
        //{
        //    bool isVaid = false;
        //    string[] fileExtension = { ".jpg", ".png", ".jpeg" };
        //    for(int i = 0; i<= fileExtension.Length - 1;i++)
        //    {
        //        if(fileName.Contains(fileExtension[i]))
        //        {
        //            isVaid = true;
        //            break;
        //        }
        //    }
        //    return isVaid;
        //}
    }
}