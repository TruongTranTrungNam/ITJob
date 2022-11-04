<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ITJob.User.Register" %>
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
                        <h2 class="contact-title text-center" >Đăng ký </h2>
                    </div>
                    <div class="col-lg-6 mx-auto">

                    <div class="form-contact contact_form">       
                        <div class="row">
                                <div class="col-12">
                                    <h6>Thông tin</h6>

                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Tên tài khoản</label>
                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Nhập tên tài khoản" required></asp:TextBox>
                                        
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                         <div ng-app="Myapp" ng-controller="Mycontroller" >
                                            <asp:TextBox ID="txtPassword" runat="server" ng-attr-type="{{showPassword ? 'text':'password'}}"  CssClass="form-control" placeholder="Nhập mật khẩu" TextMode="Password" required></asp:TextBox>
                                            <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye': showPassword,'fa fa-eye-slash': !showPassword}"></div> Ẩn/Hiện mật khẩu
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" display="Dynamic" runat="server" ErrorMessage="Mật khẩu phải dài từ 8-10 ký tự với ít nhất một chữ số, một bảng chữ viết hoa, thường và một ký tự đặc biệt." forecolor="Red" ValidationExpression="^.*(?=.{8,10})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$" ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                                        
                                      

                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Xác nhận mật khẩu</label>

                                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Nhập lại mật khẩu" TextMode="Password" required></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp!" 
                                                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" forecolor="Red" display="Dynamic" SetFocusOnError="true"
                                                    font-size="Small"></asp:CompareValidator>
                                       

                                    </div>
                                </div>

                                <div class="col-12">
                                    <h6>Thông tin cá nhân</h6>

                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Họ và Tên</label>
                                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Nhập Họ và tên " required></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Vui lòng nhập đúng tên của bạn" 
                                                forecolor="Red" display="Dynamic" SetFocusOnError="true" font-size="Small" ValidationExpression="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$" ControlToValidate="txtFullName">

                                            </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ" TextMode="MultiLine" required></asp:TextBox>
                                        
                                    </div>
                                </div>

                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại" required></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Số điện thoại tối thiểu 10 số" 
                                                forecolor="Red" display="Dynamic" SetFocusOnError="true" font-size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile">

                                            </asp:RegularExpressionValidator>
                                    </div>
                                </div>

                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Nhập Email" TextMode="Email" required></asp:TextBox>
                                        
                                    </div>
                                </div>

                            <div class="col-12">
                                    <div class="form-group">
                                        <label>Thành Phố</label>
                                      <%--  <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100" 
                                            apppendatabounditems="true" DataTextField="CountryName" DataValueField="CountryName">
                                            <asp:ListItem Value="0">Chọn thành phố</asp:ListItem>
                                        </asp:DropDownList>--%>


                                        <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="SqlDataSource1" CssClass="form-control w-100" AppendDataBoundItems="true" DataTextField="CityName" DataValueField="CityName" required>
                                            <asp:ListItem Value="0">Chọn</asp:ListItem>
                                        </asp:DropDownList>

                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                     --%>
                                        
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Không được để trống" forecolor="Red" display="Dynamic" SetFocusOnError="true" 
                                                font-size="Small" InitialValue="0" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sql_itjob %>" SelectCommand="SELECT [CityName] FROM [City]"></asp:SqlDataSource>
                                        

                                       

                                    </div>
                                </div>

                            </div>
                            <div class="form-group mt-3">
                               
                            <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="button button-contactForm boxed-btn mr-4"
                                OnClick="btnRegister_Click"/> 

                                <span class="clickLink"><a href="../User/Login.aspx">Đăng nhập ? Bấm vào đây..</a></span>
                            </div>
                     </div>    
                        
                    </div>
            </div>
    </div>
</section>

     <script>
         var app = angular.module('Myapp', []);
         app.controller('Mycontroller', function ($scope) {
             $scope.showPassword = false;

             $scope.toggleShowPassword = function () {
                 $scope.showPassword = !$scope.showPassword;
             }
         });
     </script>
    <script src="../Scripts/angular.js"></script>

</asp:Content>
