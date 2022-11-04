using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITJob.User
{
    public partial class JobListing : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["sql_itjob"].ConnectionString;
        public int jobCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        private void showJobList()
        {
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            lbljobCount.Text = JobCount(dt.Rows.Count);
        }

        string JobCount(int count)
        {
            if(count > 1)
            {
                return "Tìm thấy <b>" + count + "<b> công việc";
            }
            else if(count == 1)
            {
                return "Tìm thấy <b>" + count + "<b> công việc";
            }
            else
            {
                return "Không tìm thấy";
            }
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

        public static string RelativeDate(DateTime theDate)
        {
            Dictionary<long, string> thresholds = new Dictionary<long, string>();
            int minute = 60;
            int hour = 60 * minute;
            int day = 24 * hour;
            thresholds.Add(60, "{0} giây trước");
            thresholds.Add(minute * 2, " vài phút trước");
            thresholds.Add(45 * minute, "{0} phút trước");
            thresholds.Add(120 * minute, "1 tiếng trước");
            thresholds.Add(day, "{0} tiếng trước");
            thresholds.Add(day * 2, "hôm qua");
            thresholds.Add(day * 30, "{0} ngày trước");
            thresholds.Add(day * 365, "{0} ngày trước");
            thresholds.Add(long.MaxValue, "{0} năm trước");
            long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;
            foreach (long threshold in thresholds.Keys)
            {
                if (since < threshold)
                {
                    TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));
                    return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());
                }
            }
            return "";
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string jobType = string.Empty;
            jobType = selectedCheckBox();
            if (jobType != "")
            {
                con = new SqlConnection(str);
                string query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs
                                where JobType IN (" + jobType + ") ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();

            }
            else
            {
                showJobList();
            }
        }

        string selectedCheckBox()
        {
            string jobType = string.Empty;
            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if(CheckBoxList1.Items[i].Selected)
                {
                    jobType += "'" + CheckBoxList1.Items[i].Text + "',";
                }
            }
            return jobType = jobType.TrimEnd(',');
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue != "0")
            {
                string postedDate = string.Empty;
                postedDate = selectedRadioButton();
                con = new SqlConnection(str);
                string query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs
                                where Convert (DATE,CreateDate) " + postedDate + " ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        private string selectedRadioButton()
        {
            string postedDate = string.Empty;
            DateTime date = DateTime.Today;
            if(RadioButtonList1.SelectedValue == "1")
            {
                postedDate = "= Convert(DATE, '" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "2")
            {
                postedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-2).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "3")
            {
                postedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-3).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else if (RadioButtonList1.SelectedValue == "4")
            {
                postedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-5).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            else 
            {
                postedDate = " between Convert(DATE, '" + DateTime.Now.AddDays(-10).ToString("yyyy/MM/dd") + "') and Convert(DATE,'" + date.ToString("yyyy/MM/dd") + "')";
            }
            return postedDate;
        }

        protected void lbFilter_Click(object sender, EventArgs e)
        {
            try
            {
                bool isCondition = false;
                string subquery = string.Empty;
                string jobType = string.Empty;
                string postedDate = string.Empty;
                string addAnd = string.Empty;
                string query = string.Empty;
                List<string> queryList = new List<string>();
                con = new SqlConnection(str);

                if(ddlCity.SelectedValue != "0")
                {
                    queryList.Add(" City ='" + ddlCity.SelectedValue + "' ");
                    isCondition = true;

                }
                if (ddlTitleJob.SelectedValue != "0")
                {
                    queryList.Add(" TitleJobName ='" + ddlTitleJob.SelectedValue + "' ");
                    isCondition = true;

                }

                jobType = selectedCheckBox();

                if(jobType != "")
                {
                    queryList.Add(" JobType IN (" + jobType +") ");
                    isCondition = true;

                }
                if(RadioButtonList1.SelectedValue != "0")
                {
                    postedDate = selectedRadioButton();
                    queryList.Add("Convert(DATE,CreateDate)" + postedDate);
                    isCondition = true;

                }
                if(isCondition)
                {
                    foreach(string a in queryList)
                    {
                        subquery += a + " và";
                    }
                    subquery = subquery.Remove(subquery.LastIndexOf("và"), 3);
                    query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs
                                where " + subquery + " ";
                }
                else
                {
                    query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs";
                }
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
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

        protected void lbReset_Click(object sender, EventArgs e)
        {
            ddlCity.ClearSelection();
            ddlTitleJob.ClearSelection();
            CheckBoxList1.ClearSelection();
            RadioButtonList1.SelectedValue = "0";
            RBSelectedColorChange();
            showJobList();
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlCity.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs where City =N'" + ddlCity.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }

        protected void ddlTitleJob_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTitleJob.SelectedValue != "0")
            {
                con = new SqlConnection(str);
                string query = @"Select JobId,TitleJobName,LevelJobName,Salary,JobType,CompanyName,CompanyImage,City,CreateDate from Jobs
                                where TitleJobName ='" + ddlTitleJob.SelectedValue + "' ";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                showJobList();
                RBSelectedColorChange();
            }
            else
            {
                showJobList();
                RBSelectedColorChange();
            }
        }


        void RBSelectedColorChange()
        {
            if(RadioButtonList1.SelectedItem.Selected == true)
            {
                RadioButtonList1.SelectedItem.Attributes.Add("class", "selectedradio");
            }
        }
    }
}