<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="ITJob.Admin.NewJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat;
                 background-size: cover; background-attachment: fixed;">
    
         
         <div class="container pt-4 pb-4">
           <%-- <div>
                
                <asp:Label ID="lblMsg" runat="server" ></asp:Label>
            </div>--%>

             <div class="btn-toolbar justify-content-between mb-3">
                 <div class="btn-group">
                      <asp:Label ID="lblMsg" runat="server" ></asp:Label>
                 </div>

                 <div class="input-group h-25">
                     <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/JobList.aspx" cssClass="btn btn-secondary" Visible="false">Quay lại</asp:HyperLink>
                 </div>
             </div>

            <h3 class="text-center"><%Response.Write(Session["title"]); %></h3>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
               <%-- <div class="col-md-6 pt-3">
                    <label for="txtJobTitle" style="font-weight: 600">Job Title</label>
                    <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Ex. Web Developer,App Developer" required>
                    </asp:TextBox>
                </div>--%>

                <div class="col-md-6 pt-3">
                    <label for="txtTitleJobName" style="font-weight: 600">Công việc</label>

                    <asp:DropDownList ID="ddlTitleJob" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control" AppendDataBoundItems="true" DataTextField="TitleJobName" DataValueField="TitleJobName">
                        <asp:ListItem Value="0">Chọn</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Không được để trống" forecolor="Red" display="Dynamic" SetFocusOnError="true" 
                                                font-size="Small" InitialValue="0" ControlToValidate="ddlTitleJob"></asp:RequiredFieldValidator>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sql_itjob %>" SelectCommand="SELECT [TitleJobName] FROM [TitleJob]"></asp:SqlDataSource>

                </div>

                
                <div class="col-md-6 pt-3">
                    <label for="LevelJobName" style="font-weight: 600">Cấp độ</label>

                    <asp:DropDownList ID="ddlLevelJob" runat="server" DataSourceID="SqlDataSource3" CssClass="form-control" AppendDataBoundItems="true" DataTextField="LevelJobName" DataValueField="LevelJobName" >
                        <asp:ListItem Value="0">Chọn</asp:ListItem>
                    </asp:DropDownList>


                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Không được để trống" forecolor="Red" display="Dynamic" SetFocusOnError="true"
                                                    font-size="Small" InitialValue="0" ControlToValidate="ddlLevelJob"></asp:RequiredFieldValidator>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sql_itjob %>" SelectCommand="SELECT [LevelJobName] FROM [LevelJob]"></asp:SqlDataSource>


                </div>


            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtDescription" style="font-weight: 600">Mô tả công việc</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder=""
                        TextMode="MultiLine" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtQualification" style="font-weight: 600">Trình độ học vấn</label>
                    <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="" required>
                    </asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtExperience" style="font-weight: 600">Yêu cầu kinh nghiệm</label>
                    <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="" required>                        
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSpecialization" style="font-weight: 600">Yêu cầu chuyên môn</label>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" placeholder="" required
                        TextMode="MultiLine">
                    </asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtLastDate" style="font-weight: 600">Thời hạn ứng tuyển</label>
                    <asp:TextBox ID="txtLastDate" runat="server" CssClass="form-control" placeholder="" required TextMode="Date">                        
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtSalary" style="font-weight: 600">Lương</label>
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="" required>
                    </asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="ddlJobType" style="font-weight: 600">Kiểu công việc</label>
                    <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Chọn</asp:ListItem>
                        <asp:ListItem>Full Time</asp:ListItem>
                        <asp:ListItem>Part Time</asp:ListItem>
                        <asp:ListItem>Remote</asp:ListItem>
                        <asp:ListItem>Freelance</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"
                        ErrorMessage="JobType is Required" ForeColor="Red" ControlToValidate="ddlJobType"
                        InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtCompany" style="font-weight: 600">Tên công ty</label>
                    <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="" required>
                    </asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="ddlJobType" style="font-weight: 600">Logo công ty</label>
                    <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, ,jpeg, .png extension only" />
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtWebsite" style="font-weight: 600">WebSite </label>
                    <asp:TextBox ID="txtWebsite" runat="server" CssClass="form-control" placeholder=""
                        TextMode="Url">
                    </asp:TextBox>
                </div>

                <div class="col-md-6 pt-3">
                    <label for="txtEmail" style="font-weight: 600">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder=""
                        TextNode="Email">                        
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-12 pt-3">
                    <label for="txtAddress" style="font-weight: 600">Địa chỉ</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder=""
                        TextMode="MultiLine" required>
                    </asp:TextBox>
                </div>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3">
                <div class="col-md-6 pt-3">
                    <label for="txtWebsite" style="font-weight: 600">Thành phố </label>
                    <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control"
                        apppendatabounditems="true" DataTextField="CityName" DataValueField="CityName" >
                        <asp:ListItem Value="0">Chọn</asp:ListItem>
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không để trống" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                        Font-Size="Small" InitialValue="0" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql_itjob %>" SelectCommand="SELECT [CityName] FROM [City]"></asp:SqlDataSource>
                </div>

              
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#7200cf" Text="Thêm"
                   onclick="btnAdd_Click" />
            </div>
        </div>

        </div>
     
     </div>
</asp:Content>
