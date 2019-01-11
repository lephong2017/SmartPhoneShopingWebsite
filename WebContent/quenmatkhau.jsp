<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="model.KhachHang"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Quên mật khẩu</title>
  <link rel="stylesheet" type="text/css" href="Boot/css/bootstrap.min.css">
  <script type="text/javascript" src="Boot/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/custom.min.css">
</head>
<%Map<String,KhachHang> danhSachKhachHang=(Map<String,KhachHang>)session.getAttribute("danhSachKhachHang"); %>
<%Set<String> dsUser=danhSachKhachHang.keySet(); %>
<%List<String> dsEmail=new ArrayList<>(); %>
<%for(KhachHang khachHang: danhSachKhachHang.values()){
	dsEmail.add(khachHang.getEmail());
}
%>
<script type="text/javascript">

var arr=new Array();
<%for(int i = 0; i < dsEmail.size(); i++) {%>
	arr[<%=i%>]="<%=dsEmail.get(i)%>";
<%}%>

function kiemTraEmail() {
	for (var i = 0; i < arr.length; i++) {
		var us=arr[i];
		if(document.quenMK.emailInput.value == us){
			document.getElementById('email').innerHTML = '';
			return true;
		}
	}
	document.getElementById('email').innerHTML = 'Email bạn nhập không chính xác !';
	return false;
}

</script>
<body class="login">

  <hr>
  <div class="container">
    <div class="row">
      <div class="row">
        <div class="col-md-4 col-md-offset-4">
          <div class="panel panel-default">
            <div class="panel-body">
              <div class="text-center">
                <h3><i class="glyphicon glyphicon-lock"></i></h3>
                <h2 class="text-center">Bạn đã quên mật khẩu?</h2>
                <p>Bạn có thể lấy lại mật khẩu ở đây.</p>
                <div class="panel-body">
                  <form class="form" action="XuLyQuenMK" method="get" onsubmit="return(kiemTraEmail())"  name="quenMK">
                    <fieldset>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="emailInput" placeholder="Email của bạn" class="form-control" type="email" oninvalid="setCustomValidity('Địa chỉ email bạn nhập sai!')" onchange="try{setCustomValidity('')}catch(e){}" name="mailaddress">
                        </div>
                      </div>
                      <div class="form-group">
                      	<p id="email"></p>
                        <input class="btn btn-lg btn-primary btn-block"  value="Gởi cho tôi mật khẩu mới" type="submit" >
                      </div>
                    </fieldset>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>

</html>