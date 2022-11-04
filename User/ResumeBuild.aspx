<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="ResumeBuild.aspx.cs" Inherits="ITJob.User.ResumeBuild" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <section>
    <div class="container pt-50 pb-40">
        <div class="row">

                    <div class="col-12 pb-20 text-success" style="font-size:20px">
                        <asp:Label ID="lblMsg" runat="server" Visible="false" ></asp:Label>
                    </div>

                    <div class="col-12">
                        <h2 class="contact-title text-center" >Cập nhật hồ sơ </h2>
                    </div>
                    <div class="col-lg-12 ">

                    <div class="form-contact contact_form">       
                        <div class="row">
                                <div class="col-12">
                                    <h6>Thông tin cá nhân</h6>

                                </div>
                              <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Họ và Tên</label>
                                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập Họ và tên " required></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Vui lòng nhập đúng tên của bạn" 
                                                forecolor="Red" display="Dynamic" SetFocusOnError="true" font-size="Small" ValidationExpression="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$" ControlToValidate="txtFullName">

                                            </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Tên tài khoản</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Nhập tên tài khoản" required></asp:TextBox>
                                        
                                    </div>
                                </div>
                                 <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ"  required></asp:TextBox>
                                        
                                    </div>
                                </div>

                            <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Nhập số điện thoạir" required></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Số điện thoại tối thiểu 10 số" 
                                                forecolor="Red" display="Dynamic" SetFocusOnError="true" font-size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile">

                                            </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                            <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập Email" TextMode="Email" required></asp:TextBox>
                                        
                                    </div>
                                </div>

                            <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Thành Phố</label>
                                  

                                        <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="CityName" DataValueField="CityName">
                                            <asp:ListItem Value="0">Thành Phố</asp:ListItem>
                                        </asp:DropDownList>

                                        
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống" forecolor="Red" display="Dynamic" SetFocusOnError="true" 
                                                font-size="Small" InitialValue="0" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql_itjob %>" SelectCommand="SELECT [CityName] FROM [City]"></asp:SqlDataSource>
                                        

                                       

                                    </div>
                                </div>

                                <div class="col-12 pt-4">
                                    <h6>Đăng tải CV</h6>

                                </div>
                              
                            
                          <%--    <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>10th Percentage/Grade</label>
                                            <asp:TextBox ID="txtTenth" runat="server" CssClass="form-control" placeholder="ex:90%"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                          <%--  <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>12th Percentage/Grade</label>
                                            <asp:TextBox ID="txtTwelfth" runat="server" CssClass="form-control" placeholder="ex:90%"  ></asp:TextBox>
                                        
                                    </div>
                                </div>
                         --%>

                          <%--  <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Graduation with pointer/Grade</label>
                                            <asp:TextBox ID="txtGraduation" runat="server" CssClass="form-control" placeholder="ex: 9.2"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                          <%-- <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Post Graduation with pointer/Grade</label>
                                            <asp:TextBox ID="txtPostGraduation" runat="server" CssClass="form-control" placeholder="ex: 9.2"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                            
                          <%--<div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>PHD with Percentage/Grade</label>
                                            <asp:TextBox ID="txtPhd" runat="server" CssClass="form-control" placeholder="ex:PHD with grade"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                          <%--                              <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Job Profile/Works On</label>
                                            <asp:TextBox ID="txtWork" runat="server" CssClass="form-control" placeholder="Job Profile"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                          <%--   <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label>Work Experience</label>
                                            <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Work Experience"  ></asp:TextBox>
                                        
                                    </div>
                                </div>--%>

                             <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                       
                                        <asp:FileUpload ID="fuResume" runat="server" CssClass="form-control" ToolTip=".doc, .docx, .pdf extension only" />
                                    </div>
                                </div>


                            </div>
                            <div class="form-group mt-3">
                               
                            <asp:Button ID="btnUpdate" runat="server" Text="Lưu" CssClass="button button-contactForm boxed-btn mr-4"
                                OnClick="btnUpdate_Click"/> 

                            
                            </div>
                     </div>    
                        
                    </div>
            </div>
    </div>
</section>

</asp:Content>
