<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="ViewResume.aspx.cs" Inherits="ITJob.Admin.ViewResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat;
                 background-size: cover; background-attachment: fixed;">
    
         
         <div class="container pt-4 pb-4">
            <div>
                
                <asp:Label ID="lblMsg" runat="server" ></asp:Label>
            </div>
            <h3 class="text-center"> Xem - Tải CV</h3>

             <div class="row mb-3 pt-sm-3" >
                 <div class="col-md-12">
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" HeaderStyle-HorizontalAlign="Center"
                         EmptyDataText="Không có dữ liệu" AutoGenerateColumns="False" AllowPaging="True" PageSize="7"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="AppliedJobId" OnRowDeleting="GridView1_RowDeleting"
                         OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                         <Columns>
                           
                             <asp:BoundField DataField="Sr.No" HeaderText="STT">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>


                             
                              <asp:BoundField DataField="CompanyName" HeaderText="Công ty">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="TitleJobName" HeaderText="Công việc">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="LevelJobName" HeaderText="Cấp độ">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="Email" HeaderText="Email">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                              <asp:BoundField DataField="Mobile" HeaderText="SĐT">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>

                            
                           

                             <asp:TemplateField HeaderText="CV">
                                 <ItemTemplate>
                                     <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.Resume","../{0}") %>'>
                                         <i class="fas fa-download"></i>Tải xuống</asp:HyperLink>
                                     <asp:HiddenField ID="hdnJobId" runat="server" Value='<%#Eval ("JobId") %>' Visible="false" />
                                 </ItemTemplate>

                                 <ItemStyle  HorizontalAlign="Center" />

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
