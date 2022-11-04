<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ITJob.User.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList ID="dlProfile" runat="server" width="100%" OnItemCommand="dlProfile_ItemCommand">
                
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png" alt="UserPic" class="rounded-circle" width="150" />
                                    
                                    <div class="mt-3">
                                          <h4 class="text-capitalize" >
                                            <%# Eval("Name") %>
                                          </h4>
                                        <p class="text-secondary mb-1">  <%# Eval("Username") %></p>
                                        <p class="text-muted font-size-sm text-capitalize">
                                            <i class="fas fa-map-marker-alt"></i>  <%# Eval("City") %>
                                        </p>
                                    </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Họ tên</h6>

                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                             <%# Eval("Name") %>
                                        </div>
                                    </div>
                                    <hr />

                                    <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                         <div class="col-sm-9 text-secondary ">
                                             <%# Eval("Email") %>
                                        </div>
                                    </div>
                                    <hr />

                                     <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Số điện thoại</h6>
                                    </div>
                                         <div class="col-sm-9 text-secondary text-capitalize">
                                             <%# Eval("Mobile") %>
                                        </div>
                                    </div>
                                    <hr />

                                     <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Địa chỉ</h6>
                                    </div>
                                         <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Address") %>
                                        </div>
                                    </div>
                                    <hr />

                                      <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Hồ sơ - CV</h6>
                                    </div>
                                         <div class="col-sm-9 text-secondary text-capitalize">
                                             <%# Eval("Resume") == DBNull.Value ? "Chưa có" : "Đã có" %>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnEdit" runat="server" Text="Thay đổi" CssClass="button button-contactForm boxed-btn"
                                                CommandName="EditUserProfile" CommanArgument='<%# Eval("UserId") %>'/>
                                             <asp:LinkButton ID="Logout" runat="server" cssclass="button button-contactForm boxed-btn" OnClick="Logout_Click" causesvalidation="false">Thoát</asp:LinkButton>
                                        </div>

                                    </div>
                                 </div>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

    </div>

</asp:Content>
