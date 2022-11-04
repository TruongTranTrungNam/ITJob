function getBotResponse(input) {
    

    //rock paper scissors
    if (input == "Đúng" || input == "Phải" || input == "đúng" || input == "phải" || input == "Yes" || input == "yes" || input == "Tôi cần tìm công việc")  {

        return "Bấm vào  <a href = 'JobListing.aspx'> đây </a> và hãy đăng ký, đăng nhập, up CV của bạn để ứng tuyển";

    }

    // Simple responses
    if (input == "Xin chào" || input == "Hi" || input == "xin chào" || input == "hi" || input == "Hello" || input == "hello") {
        return "Xin chào Bạn!";
    } else if (input == "Tạm biệt" || input == "tạm biệt" || input == "Bye" || input == "bye") {
        return "Nói chuyện với bạn sau!";
    } else {
        return "Thử lại!";
    }
}