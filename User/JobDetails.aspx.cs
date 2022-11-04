using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace ITJob.User
{
    public partial class JobDetails : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt, dt1;
        string str = ConfigurationManager.ConnectionStrings["sql_itjob"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            showJobDetails();
        }

        private void showJobDetails()
        {
           
            con = new SqlConnection(str);
            string query = @"Select * from Jobs where JobId = @id";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            
            DataList1.DataSource = dt;
            DataList1.DataBind();
           
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "ApplyJob")
            {
                if(Session["user"] != null)
                {
                    try
                    {

                        con = new SqlConnection(str);
                        string query = @"Insert into AppliedJobs values (@JobId , @UserId)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);
                        cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                        con.Open();
                        int r = cmd.ExecuteNonQuery();
                        if(r > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Ứng tuyển thành công";
                            lblMsg.CssClass = "alert alert-success";
                            showJobDetails();

                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Không thể ứng tuyển, thử lại sau ! ";
                            lblMsg.CssClass = "alert alert-danger";
                        }
                    }
                    catch(Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                    finally
                    {
                        con.Close();
                    }

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (Session["user"] != null)
            {
                LinkButton btnApplyJob = e.Item.FindControl("lbApplyJob") as LinkButton;
                if (isApplied())
                {
                    btnApplyJob.Enabled = false;
                    btnApplyJob.Text = "Đã ứng tuyển";
                }
                else
                {
                    btnApplyJob.Enabled = true;
                    btnApplyJob.Text = "Ứng tuyển ngay";
                }
            }
        }

        bool isApplied()
        {
            //string uid = Session["userId"].ToString();
            
            con = new SqlConnection(str);
            string query = @"Select * from AppliedJobs where UserId = @UserId and JobId = @JobId";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserId", Session["userid"]);
            cmd.Parameters.AddWithValue("@JobId", Request.QueryString["id"]);

            //cmd.Parameters.AddWithValue("@UserId", uid);
            

            sda = new SqlDataAdapter(cmd);
            dt1 = new DataTable();
            sda.Fill(dt1);

            if (dt1.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        static SqlDataReader reader = null;
        protected void lbApplyJob_Click(object sender, EventArgs e)
        {
            
            con = new SqlConnection(str);
            con.Open();
            string query = "Select Email from [User] where Username=@username";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", Session["user"]);
            reader = cmd.ExecuteReader();
            string email = "";
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    email = reader["Email"].ToString();
                    
                }
            }


            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("itjob2002@gmail.com");
            mail.Subject = "Thông báo ứng tuyển";
            mail.Body = "Cảm ơn bạn đã ứng tuyển, bộ phận tuyển dụng sẽ liên hệ với bạn sớm nhất có thể";
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("itjob2002@gmail.com", "cjbjalkmivsckcbg");
            smtp.Send(mail);
        }

        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";

            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }
    }
}