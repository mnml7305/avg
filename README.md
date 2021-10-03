////request
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <!--<link rel="stylesheet" href="request.css" />-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/zipcode.js"></script>
    <script>
      //dropdown
      (function () {
        document.addEventListener('DOMContentLoaded', function() {
          const btn = document.getElementById('dropdown_btn');
          if(btn) {
            btn.addEventListener('click', function(){
              this.classList.toggle('is-open');
            });
          }
        });
      }());
    </script>
    <script type="text/javascript">
     //add
      $(function() {
        $('button#add').click(function(){
        var setting = document.getElementById("setting");
        var count;
        var type = 2; //変数に変える
        var add_device = '' +
                        '<div class="device_area">' +
                        '<label label for="device_name">機種名</label>' +
                        '<input type="text" name="device_name[]" class="device" maxlength="200">' +
                        '<label for="mobile">携帯電話番号</label>' +
                        '<input type="tel" name="mobile[]" class="device" maxlength="20" pattern="\d{2,4}-\d{3,4}-\d{3,4}" placeholder="〇〇〇-〇〇〇〇-〇〇〇〇">' +
                        '</div>';
                        $(add_device).appendTo(setting);
      
          if (type == 2) {
          var reson  = document.getElementById("reson");
          var add_reson = '' +
                          '<div class="reson_area" style="<%=reson_mode%>">' +
                          '<label for="reason">故障理由・状況等</label>' +
                          '<textarea  name="reason[]" maxlength="1000"></textarea>' +
                          '</div>';
                          $(add_reson).appendTo(setting); 
          }  
        });
      });
    </script>
    <script type="text/javascript">
    //other
      function carrierChange() {
        if (document.getElementById("carrier_id")) {
          value = document.getElementById("carrier_id").value;
          var display_switch;
          var required_switch;
          if (value == "4") {
            //その他の入力エリアを表示
            display_switch = "block";
            required_switch = true;
            
          } else {
            //その他の入力エリアを非表示
            display_switch = "none";
            required_switch = false;

          }
           document.getElementById("other").style.display = display_switch;
           document.getElementById("carrier_other").required = required_switch;
        }
      }
    </script>

    <script type="text/javascript">
    //cancel
      function cancelCheck(){

        var result = confirm("依頼をキャンセルしてもよろしいですか？");
        if(result) {
            //yes
            document.requestform.reset();
        } else {
            //no
            result = false;
        }
          return result;
        }
    </script>
    <title>新規(故障/紛失)キッティング依頼フォーム</title>
  </head>
<body>
  <div class=header>
    <div class="logo"><img class="logo" src="img/logo.png"></div>
    <div><h1 class="blue" id="title">新規(故障/紛失)キッティング依頼フォーム</h1></div>
    <div class="dropdown">
    <span class="company"><%=company_name %></span>
    <button class="dropdown_btn" id="dropdown_btn"><a></a></button>
    <div class="dropdown_body">
    <ul class="dropdown_list">
    <li class="dropdown_item"><a href="/password_change" class="dropdown_item-link">パスワード変更</a></li>
    <li class="dropdown_item"><a href="/logout" class="dropdown_item-link">ログアウト</a></li>
    </ul>
    </div>
</div>    
  </div>
<div class="title">
<a class="iqon"></a><h2 class="blue"><%=mode %></h2>
</div>
<div class="main">
<form method="POST" action="/webapp/template/request/confirm.html" name="requestform">
  <div id="setting">
  <h3 class="blue">①設定機器情報</h3>
    <div class="device_area">
      <label label for="device_name">機種名</label>
      <input type="text" name="device_name" class="device" maxlength="200">
      <label for="mobile">携帯電話番号</label>
      <input type="tel" name="mobile" class="device" maxlength="20" pattern="\d{2,4}-\d{3,4}-\d{3,4}" placeholder="〇〇〇-〇〇〇〇-〇〇〇〇" required>
    </div>
    <div class="reson_area" style="<%=reson_mode%>">
      <label for="reason">故障理由・状況等</label>
      <textarea  name="reason" maxlength="1000" required></textarea>
    </div>
    <div class="add_btn">
      <button type="button" id="add" class="btn_style">＋追加</button>
    </div> 
  </div>

  <div class="shipping" style="<%=shipping_mode %>">
  <h3 class="blue">②受付事務局への配送情報</h3>
    <div><label for="shipping_date">発送日</label>
      <input type="date" name="shipping_date" required>
    </div>
    <div><label for="carrier_id">運送業者</label>
      <select id="carrier_id" name="carrier_id" onchange="return carrierChange()" required>
      <option value="0" selected></option>
      <option value="1">ヤマト</option>
      <option value="2">佐川</option>
      <option value="3">郵便</option>
      <option value="4">その他</option>
      </select>
      <div id="other" style="display: none;"><label for="carrier_other">その他</label>
        <input id="carrier_other" type="text"name="carrier_other" maxlength="200">
      </div>
    </div>
    <div><label for="shipping_number">発送番号</label>
    <input type="text" name="shipping_number" maxlength="20" required>
    </div>
  </div>

  <div class="user">
  <h3 class="blue"><%=user_title %>設定後のお届け情報</h3>
    <p><label for="zip_code">郵便番号</label>
      <input type="text" id="zip_code" name="zip_code" maxlength="8" pattern="\d{3}-\d{4}" placeholder="〇〇〇-〇〇〇〇" required>
      <button type="button" id="btn" class="btn_style" >検索</button>
    </p><p>
      <label for="address1">住所</label>
      <input type="text" id="address1" name="address1" maxlength="200" required>
    </p><p>
      <label for="address2">番地・建物名</label>
      <input type="text" name="address2" maxlength="200" required>
    </p><p>
      <label for="tel">電話番号</label>
      <input type="tel" name="tel" maxlength="20" pattern="\d{2,4}-\d{3,4}-\d{3,4}" required>
    </p><p>
      <label for="department_name">部署</label>
      <input type="text" name="department_name" maxlength="200" required>
    </p><p>
      <label for="name">氏名</label>
      <input type="text" name="name" maxlength="200" required>
    </p><p>
      <label for="email">メールアドレス</label>
      <input type="email" name="mail" maxlength="200" required>
    </p>
  </div>

  <div class="btn_area">
    <input type="submit" value="確認" id="confirm" class="btn_style" name="confirm_btn">
    <input type="button" value="キャンセル" id="cancel" class="btn_style" name="cancel_btn" onclick="cancelCheck();">
  </div>

</form>
</div>
</body>
</html>
	  
	  
	  
////confirm
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <!--<link rel="stylesheet" href="request.css" />-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/zipcode.js"></script>
    <script>
      //dropdown
      (function () {
        document.addEventListener('DOMContentLoaded', function() {
          const btn = document.getElementById('dropdown_btn');
          if(btn) {
            btn.addEventListener('click', function(){
              this.classList.toggle('is-open');
            });
          }
        });
      }());
    </script>
    <script type="text/javascript">
    //confrm
      function confirmCheck(){
          
        var result = confirm("依頼を受付事務職に送信します。よろしいですか？");
        if(result) {
            //yes
        } else {
            //no
            result = false;
        }
        return result;
      }
    </script>
    
    <title>新規(故障/紛失)キッティング依頼フォーム</title>
  </head>
<body>
  <div class=header>
    <div class="logo"><img class="logo" src="img/logo.png"></div>
    <div class="title"><h1 class="blue" id="title">新規(故障/紛失)キッティング依頼フォーム</h1></div>
    <div class="dropdown">
      <span class="company"><%=company_name %></span>
      <button class="dropdown_btn" id="dropdown_btn"><a></a></button>
      <div class="dropdown_body">
      <ul class="dropdown_list">
      <li class="dropdown_item"><a href="/password_change" class="dropdown_item-link">パスワード変更</a></li>
      <li class="dropdown_item"><a href="/logout" class="dropdown_item-link">ログアウト</a></li>
      </ul>
    </div>
    </div>    
  </div>

<div class="title">
<a class="iqon"></a><h2 class="blue"><%=mode %></h2>
</div>

<div class="main">
   
  <div id="setting">
  <h3 class="blue">①設定機器情報</h3>
    <div class="input_data"><label for="device_name">機種名</label>
      <p>×××××××××</p>
      <p>×××××××××</p>
      <p>×××××××××</p>
    </div>
    <div class="input_data"><label for="mobile">携帯電話番号</label>
      <p>×××××××××</p>
      <p>×××××××××</p>
      <p>×××××××××</p>
    </div>
    <div class="input_data"><label for="reason">故障理由・状況等</label>
      <p>×××××××××</p>
      <p>×××××××××</p>
      <p>×××××××××</p>
    </div>
  </div>

  <div class="shipping" style="<%=shipping_mode %>">
  <h3 class="blue">②受付事務局への配送情報</h3> 
    <div class="input_data"><label for="shipping_date">発送日</label>
      <p>×××××××××</p>
    </div>
    <div class="input_data"><label for="carrier_id">運送業者</label>
      <p>×××××××××</p>
    </div>
    <div class="input_data"><label for="shipping_number">発送番号</label>
     <p>×××××××××</p>
    </div>
  </div>
  
  <div class="user">
  <h3 class="blue"><%=user_title %>設定後のお届け情報</h3>
   <div class="input_data">
      <p>〒×××-××××</p>
      <p>○○県○○市○○○</p>
      <p>☎××××××××</p>
      <p>部署の転写</p>
      <p>氏名の転写</p>
      <p>メールアドレスの転写</p>
    </div>
  </div>

  <form method="POST" action="/webapp/template/request/request.html" onchange="confirmCheck()" required>
    <div class="btn_area">
    <input type="submit" value="送信" id="post" class="btn_style" name="post_btn" onclick="return confirmCheck();">
    <input type="button" value="戻る" id="back" class="btn_style" name="back_btn" onclick="history.back();">
    </div>
  </form>
  
</div>
</body>
</html>
	  
	  
	  
////css
*{
box-sizing:border-box
}

html{
  display: bolck
}

body{
  min-width: 745px;
 /* margin: 2px;*/
   font-family: "Hiragino maru Gothic ProN W4", "Hiragino Kaku Gothic Pro","Hiragino Sans", "arial", "Meiryo", "MS PGothic", sans-serif !important;
  font-weight: 400;
  font:"Meiryo"
}

.main {
margin: 0 50px;
}

/* --- header --- */  
.header{
  display: flex;
  align-items: center;
  /*justify-content: space-between;*/
  background-color: #dbeef4;
  color:#3ba1bd;
  width: 100%;
  height: 50px;
  padding: 0 10px;
}
.logo{
  width: 70px;
  height: 50px;
  /*  margin: 0 5px;*/
}
.company{
  margin-right: 40px;
  padding-right: 10px;
}

/* --- h2 title --- */
.title {
display: inline-block;
padding-left: 20px;
position: relative;
}

/*
/*
/* --request.jsp-- */

/* --- setting --- */
.device_area, .reson_area {
  margin-bottom: 20px;
  padding-left: 20px;
  display: block;
}
.device_area > label, .reson_area > label {
  display: inline-block;
  margin-right: 20px;
}
div.device_area > input {
  margin-right: 20px;
}
#setting .device{
  width: 200px ;  
}

/* --- shipping --- */
.shipping {
  margin-bottom: 20px;
  padding-bottom: 20px;
  min-height: 140px;
}
.shipping > div {
  display: inline-block;
  margin-right: 20px;
  padding-left: 20px;
  vertical-align: top;
}
.shipping > div > label {
  margin-right: 10px;
}

#other{
  margin-top: 20px;
}
#other > label{
  margin-right: 14px;
}

/* --- user --- */
.user > p {
  padding-left: 20px;
}
.user > p > label{
  display: inline-block;
  width: 130px;
}
#zip_code {
  width: 150px;
}

/* --- font --- */
.blue{
  color:#3ba1bd;
}

h1.blue, h2.blue {
  font-weight: 500;
  font-size: 22px;
  margin-left: 18px;
}
h3.blue{
  font-weight: 600;
  font-size: 16px;
}

/* --- dropdown --- */
.dropdown {
  margin: 0 0 0 auto;
  position: relative;
}
.dropdown_btn {
  display: block;
  width: 1.5em;
  padding: 0.2em;
  background: none;
  border: 0;
  position: absolute;
  top: 3px;
  right: 10px;
}
.dropdown_btn.is-open::after {
  content: "";
  width: 100%;
  height: 100%;
  cursor: default;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 4;
}
.dropdown_btn.is-open + .dropdown_body {
  display: block;
  z-index: 5;
}
.dropdown_body {
  display: none;
  width: 200px;
  background: #fff;
  box-shadow: 0 2px 6px 2px rgba(60,64,67,0.149), 0 1px 2px 0 rgba(60,64,67,0.302);
  border-radius: 4px;
  overflow: hidden;
  position: absolute;
  top: 32px;
  left: 32px;
}
.dropdown_list {
  margin: 0;
  padding: 0;
}
.dropdown_item {
  display: block;
}
.dropdown_item-link {
  display: block;
  padding: 1em 1.2em;
  font-size: 0.95em;
  text-decoration: none;
  color: #444;
}

.dropdown_item-link:hover {
  background: #fbfbfb;
}
/**/
/* --- ▼ --- */
#dropdown_btn a{
  display: block;
  width: 0;
  height: 0;
  border-left: 6px solid transparent;
  border-right: 6px solid transparent;
  border-top: 10px solid #3ba1bd;
}
/* --- ■ --- */
.iqon {
  display: block;
  position: absolute;
  top: 22px;
  left: 12px;
  width: 0;
  height: 0;
  border: 9px solid #3ba1bd;
}

/* --- button --- */
/* --- 追加 --- */
.add_btn {
  margin: 0 0 20px 80px;
}
#add {
  width: 70px;
  height: 33px;
  background-color: #3ba1bd;
  /*background-color: #3399ff;*/
  color:#ffffff;
}
/* --- 検索 --- */ 
#btn {
  width: 60px;
  height: 30px;
  background-color:#d0e0e3;
  vertical-align: middle;
}
/* --- 確認/送信 --- */ 
#confirm, #post {
 /* left: 171px;*/
  background-color: #3ba1bd;
  color:#ffffff;
  margin-right: 20px;
}

/* --- キャンセル/戻る --- */ 
#cancel, #back {
 /* left: 378px;*/
  background-color:#d0e0e3;
}
.btn_style  {
  position: relative;
  border-radius: 5px;
  border: unset;
  width: 220px;
  height: 35px;
  text-align: center;
}
.btn_area {
  display: flex;
  justify-content: flex-start;
  margin: 40px 0 40px 150px;
}
.btn_area12 {
  margin-bottom: 20px;
}

/* --input/textarea-- */
input[type="text"],
input[type="tel"],
input[type="email"],
input[type="date"],
            select{
  height: 30px;
  width: 400px;
  border: 1px solid #d0e0e3;
  vertical-align: middle;
  border-radius: 5px;
  font-size: medium;
}
textarea{
  width: 580px;
  border-radius:7px;
  border: 1px solid #d0e0e3;
  resize: none;
  padding: 4px 7px;
  font-size: 16px;
  vertical-align: top;
}
.shipping input[type="date"],
  select{
  width: 120px ; 
  height: 30px;
  background-color: #fff;
}
.shipping input[type="text"]{
  width: 170px ; 
}
/*
/*
/* --confirm.jsp-- */

#setting .input_data {
display: inline-block;
text-align: center;
margin-right: 30px;
margin-bottom: 20px;
padding-left: 20px;
}	  
