<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="ITJob.User.JobDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>


        <div>
            <asp:Label ID="lblMsg" runat="server"  Visible="false"></asp:Label>
        </div>
    
        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">

                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">

                    <ItemTemplate>

                          <div class="row justify-content-between">
                    <!-- Left Content -->
                    <div class="col-xl-7 col-lg-8">
                        <!-- job single -->
                        <div class="single-job-items mb-50">
                            <div class="job-items">
                                <div class="company-img company-img-details">
                                    <a href="#">
                                        <img width="80" src="<%# GetImageUrl(Eval("CompanyImage")) %>" alt="">

                                    </a>
                                </div>
                                <div class="job-tittle">
                                    <a href="#">
                                        <h4><%#Eval ("TiTleJobName") %></h4>
                                         <h6><%#Eval ("LevelJobName") %></h6>
                                    </a>
                                    <ul>
                                        <li><%#Eval ("CompanyName") %></h4></li>
                                        <li><i class="fas fa-map-marker-alt"></i><%#Eval ("City") %></h4></li>
                                        <li><%#Eval ("Salary") %></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                          <!-- job single End -->
                       
                        <div class="job-post-details">
                            <div class="post-details1 mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Mô tả công việc</h4>
                                </div>
                                <p><%#Eval ("Description") %></p>
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Yêu cầu chuyên môn</h4>
                                </div>
                               <ul>
                                   <li><%#Eval ("Specialization") %></li>
                               
                            </div>
                            <div class="post-details2  mb-50">
                                 <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Trình độ học vấn</h4>
                                </div>
                               <ul>
                                   <li><%#Eval ("Qualification") %></li>
                                   <li>Kinh nghiệm: <%#Eval ("Experience") %></li>
                                
                               </ul>
                            </div>
                        </div>

                    </div>
                    <!-- Right Content -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="post-details3  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h4>Tổng quan</h4>
                           </div>
                          <ul>
                              <li>Ngày tuyển dụng : <span> <%# DataBinder.Eval(Container.DataItem,"CreateDate","{0:dd MMMM yyyy}") %> </span></li>
                              <li>Thành phố : <span><%#Eval ("City") %></span></li>
                             
                              <li>Kiểu công việc : <span><%#Eval ("JobType") %></span></li>
                              <li>Lương :  <span><%#Eval ("Salary") %></span></li>
                              <li>Hạn tuyển dụng : <span><%# DataBinder.Eval(Container.DataItem,"LastDateToApply","{0:dd MMMM yyyy}") %> </span></li>
                          </ul>
                         <div class="apply-btn2">
                           <%-- <a href="#" class="btn">Ứng tuyển</a>--%>

                             <asp:LinkButton ID="lbApplyJob" runat="server" CssClass="btn" Text="Ứng tuyển" OnClick="lbApplyJob_Click" CommandName="ApplyJob"></asp:LinkButton>

                         </div>
                       </div>
                        <div class="post-details4  mb-50">
                            <!-- Small Section Tittle -->
                           <div class="small-section-tittle">
                               <h4>Về công ty</h4>
                           </div>
                              <span><%#Eval ("CompanyName") %></span>
                              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                            <ul>
                                <li>Công ty: <span><%#Eval ("CompanyName") %> </span></li>
                                <li>Web : <span> <%#Eval ("Website") %></span></li>
                                <li>Email: <span><%#Eval ("Email") %></span></li>
                                <li>Địa chỉ: <span><%#Eval ("Address") %></span></li>
                                
                            </ul>
                       </div>
                    </div>
                </div>

                    </ItemTemplate>

                </asp:DataList>

              
            </div>
        </div>
        <!-- job post company End -->

    </main>

</asp:Content>
