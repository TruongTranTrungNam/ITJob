<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ITJob.User.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Area Start-->
    <%--<div class="slider-area ">
        <div class="single-slider  slider-height2 d-flex align-items-center" data-background="../assets/img/hero/contact.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Liên hệ với chúng tôi</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

   

        <!-- Hero Area End -->
    <!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
                
    
                <div class="row">

                    <div class="col-12 pb-20 "style="font-size:20px">
                        <asp:Label ID="lblMsg" runat="server" Visible="false" ></asp:Label>
                    </div>

                    <div class="col-12">
                        <h2 class="contact-title">Liên hệ</h2>
                    </div>
                    <div class="col-lg-8">
                        <%--<form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">--%>
                    <div class="form-contact contact_form" id="contactForm" >       
                        <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" runat="server" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Nhập nội dung" required></textarea>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" runat="server" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Nhập tên" required>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" runat="server" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Nhập Email" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" runat="server" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Nhập chủ đề" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <%--<button type="submit" class="button button-contactForm boxed-btn">Send</button>--%>
                            <asp:button id="btnsend" runat="server" text="Gửi ngay" cssclass="button button-contactform boxed-btn" onclick="btnsend_Click"/> 
                            </div>
                     </div>    
                        <%--</form>--%>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>02 Nguyễn Trãi.</h3>
                                <p>Nha Trang - Khánh Hòa</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+84 369681202</h3>
                                <p>Thứ 2 đến thứ 7 từ 8h sáng đến 5h chiều</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>itjob2002@gmail.com</h3>
                                <p>Gửi cho chúng tôi bất cứ khi nào!</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-none d-sm-block mb-5 pb-4">
                   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d243.69158932854364!2d109.18726653952662!3d12.24384911068303!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31705d808a39cbad%3A0xf90b5b29094eff19!2zTmd1eeG7hW4gVHLDo2ksIE5oYSBUcmFuZywgS2jDoW5oIEjDsmEgNjUwMDAwLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1662705177476!5m2!1svi!2s" width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    
                    
                 
                </div>

            </div>
        </section>
    <!-- ================ contact section end ================= -->

</asp:Content>
