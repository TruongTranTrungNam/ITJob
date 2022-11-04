<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="ITJob.Admin.JobList" %>
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
                 <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/Admin/ViewResume.aspx" CssClass="btn btn-secondary" Visible="false"> Quay lại</asp:HyperLink>
             </div>

             </div>

           

            <h3 class="text-center">Danh sách việc</h3>

             <div class="row mb-3 pt-sm-3" >
                 <div class="col-md-12">
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" HeaderStyle-HorizontalAlign="Center"
                         EmptyDataText="Không có dữ liệu" AutoGenerateColumns="False" AllowPaging="True" PageSize="7"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="JobId" OnRowDeleting="GridView1_RowDeleting"
                          OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                         <Columns>
                           
                             <asp:BoundField DataField="Sr.No" HeaderText="STT">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>


                              <asp:BoundField DataField="TitleJobName" HeaderText="Công việc">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="LevelJobName" HeaderText="Cấp độ">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="Qualification" HeaderText="Bằng cấp">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="Experience" HeaderText="Kinh nghiệm">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="LastDateToApply" HeaderText="Thời hạn ứng tuyển" DataFormatString="{0:dd MMMM yyyy}">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="CompanyName" HeaderText="Công ty">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="City" HeaderText="Thành phố">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                               <asp:BoundField DataField="CreateDate" HeaderText="Ngày đăng" DataFormatString="{0:dd MMMM yyyy}">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                           

                             <asp:TemplateField HeaderText="Sửa">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="btnEditJob" runat="server" CommandName="EditJob" CommandArgument='<%# Eval("JobId") %>'>
                                         <asp:Image ID="Img" runat="server" ImageUrl="../assets/img/icon/pencilIcon.png" Height="25px" />
                                     </asp:LinkButton>
                                 </ItemTemplate>

                                 <ItemStyle  HorizontalAlign="Center" Width="50px"/>

                             </asp:TemplateField>



                             <asp:CommandField  CausesValidation="false" HeaderText="Xóa"
                                 ShowDeleteButton="true" DeleteImageUrl="../assets/img/icon/trashIcon.png" ButtonType="Image">
                                 <ControlStyle Height="25px" Width="25px" />
                                 <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField >

                         </Columns>



                       

                         <HeaderStyle  BackColor="#7200cf" ForeColor="White"/>

                         

                     </asp:GridView>

                 </div>

             </div>

             </div>
        </div>

</asp:Content>
