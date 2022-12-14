    <%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="ITJob.User.AdminLogin" %>
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
                        <h2 class="contact-title text-center" >Đăng nhập</h2>
                    </div>
                    <div class="col-lg-6 mx-auto">

                    <div class="form-contact contact_form">       
                        <div class="row">
                               
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Tên tài khoản</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Nhập tài khoản" required></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Nhập mật khẩu" TextMode="Password" required></asp:TextBox>
                                        
                                    </div>
                                </div>
                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Kiểu đăng nhập</label>

                                        <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control w-100">  
                                             <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                           <%-- <asp:ListItem>Admin</asp:ListItem>--%>
                                           <%-- <asp:ListItem>User</asp:ListItem>--%>

                                        </asp:DropDownList> 

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Type is required" forecolor="Red" display="Dynamic" SetFocusOnError="true" 
                                                font-size="Small" InitialValue="0" ControlToValidate="ddlLoginType"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="form-group mt-3">
                               
                            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="button button-contactForm boxed-btn mr-4"
                                OnClick="btnLogin_Click"/> 

                                <span class="clickLink"><a href="../User/Register.aspx">Đăng ký ? Bấm vào đây..</a></span>
                            </div>
                     </div>    
                        
                    </div>
            </div>
    </div>
</section>

</asp:Content>
