using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace ITJob.User
{
    public partial class Contact : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["sql_itjob"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(str);
                string query = @"Insert into Contact values (@Name,@Email,@Subject,@Message)";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name.Value.Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                cmd.Parameters.AddWithValue("@Subject", subject.Value.Trim());
                cmd.Parameters.AddWithValue("@Message", message.Value.Trim());
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Cảm ơn bạn đã liên hệ";
                    lblMsg.CssClass = "alert alert-success";

                    string Email = "" ;
                    Email = email.Value.Trim();
                    
                    MailMessage mail = new MailMessage();
                    mail.To.Add(Email);
                    mail.From = new MailAddress("itjob2002@gmail.com");
                    mail.Subject = "Thông báo liên hệ";
                    mail.Body = "Cảm ơn bạn đã liên hệ, chúng tôi sẽ phản hồi với bạn sớm nhất có thể";
                    mail.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential("itjob2002@gmail.com", "cjbjalkmivsckcbg");
                    smtp.Send(mail);
                    clear();
                }

                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Không thể gửi, vui lòng thử lại sau.. !";
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

        private void clear()
        {
            name.Value = String.Empty;
            email.Value = String.Empty;
            subject.Value = String.Empty;
            message.Value = String.Empty;
        }
    }
}