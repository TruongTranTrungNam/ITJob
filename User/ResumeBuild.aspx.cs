using System;
using System.Collections.Generic;
using System.Configuration;

using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITJob.User
{
    public partial class ResumeBuild : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader sdr;
        
        
        
        string str = ConfigurationManager.ConnectionStrings["sql_itjob"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    showUserInfo();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void showUserInfo()
        {
            try
            {
                string uid = Session["userId"].ToString();
                con = new SqlConnection(str);
                string query = "Select * from [User] where UserId=@id";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", uid);
                con.Open();
                sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        txtUserName.Text = sdr["Username"].ToString();
                        txtFullName.Text = sdr["Name"].ToString();
                        txtEmail.Text = sdr["Email"].ToString();
                        txtMobile.Text = sdr["Mobile"].ToString();                       
                        txtAddress.Text = sdr["Address"].ToString();
                        ddlCity.SelectedValue = sdr["City"].ToString();

                        //txtTenth.Text = sdr["TenthGrade"].ToString();
                        //txtTwelfth.Text = sdr["TwelfthGrade"].ToString();
                        //txtGraduation.Text = sdr["GraduationGrade"].ToString();
                        //txtPostGraduation.Text = sdr["PostGraduationGrade"].ToString();
                        //txtPhd.Text = sdr["Phd"].ToString();
                        //txtWork.Text = sdr["WorksOn"].ToString();
                        //txtExperience.Text = sdr["Experience"].ToString();



                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Người dùng không tồn tại";
                    lblMsg.CssClass = "alert alert-danger";
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    string concatQuery = string.Empty;
                    string filePath = string.Empty;
                    //bool isValidToExecute = false;
                    bool isValid = false;
                    string uid = Session["userId"].ToString();
                    con = new SqlConnection(str);
                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidExtension4Resume(fuResume.FileName))
                        {
                            concatQuery = "Resume=@resume,";
                            isValid = true;
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
                    query = @"Update [User] set Username=@Username,Name=@Name,Email=@Email,Mobile=@Mobile," + concatQuery + "Address=@Address,City=@City where UserId=@id";
                    
                    //,TenthGrade = @TenthGrade,
                    //            TwelfthGrade = @TwelfthGrade,GraduationGrade = @GraduationGrade,PostGraduationGrade = @PostGraduationGrade,
                    //            Phd = @Phd,WorksOn = @WorksOn,Experience = @Experience,
                    
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    //cmd.Parameters.AddWithValue("@TenthGrade", txtTenth.Text.Trim());
                    //cmd.Parameters.AddWithValue("@TwelfthGrade", txtTwelfth.Text.Trim());
                    //cmd.Parameters.AddWithValue("@GraduationGrade", txtGraduation.Text.Trim());
                    //cmd.Parameters.AddWithValue("@PostGraduationGrade", txtPostGraduation.Text.Trim());
                    //cmd.Parameters.AddWithValue("@Phd", txtPhd.Text.Trim());
                    //cmd.Parameters.AddWithValue("@WorksOn", txtWork.Text.Trim());
                    //cmd.Parameters.AddWithValue("@Experience",txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
                    //cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);
                    cmd.Parameters.AddWithValue("@id", uid);

                    if (fuResume.HasFile)
                    {
                        if (Utils.IsValidExtension4Resume(fuResume.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            filePath = "Resumes/" + obj.ToString() + fuResume.FileName;
                            fuResume.PostedFile.SaveAs(Server.MapPath("~/Resumes/") + obj.ToString() + fuResume.FileName);

                            cmd.Parameters.AddWithValue("@resume", filePath);
                            isValid = true; 
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Chọn tập tin .doc , .docx, pdf cho CV !";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    else
                    {
                        isValid = true;
                    }

                    if (isValid)
                    {
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if (r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Thay đổi thành công !";
                            lblMsg.CssClass = "alert alert-success";
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Thay đổi thất bại, thử lại sau.. !";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Thay đổi thất bại, thử lại sau.. !";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (SqlException ex)
            {

                if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = txtUserName.Text.Trim() + " Tên đăng nhập đã tồn tại..!";

                    lblMsg.CssClass = "alert alert-danger";
                }
                else
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
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
    }
}