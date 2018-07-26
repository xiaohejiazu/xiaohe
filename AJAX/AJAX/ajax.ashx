<%@ WebHandler language="C#" Class="AJAX.ajax" codebehind="ajax.ashx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>AJAX01</title>
    <script type="text/javascript">
        function btnClick() {
            //alert(1);
            // 1 创建XMLHTTP对象，相当于WebClient
            var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); 
            
            if (!xmlhttp) {
                alert("创建xmlhttp对象异常");
                return;
            }
            
            // 2 “准备”01AJAX.ashx发出Post请求。这里还没有发出请求
            //XMLHTTP默认（也推荐）不是同步请求的，也就是open方法并不像WebClient的DownloadString
            //那样把服务器返回的数据拿到才返回，
            //是异步的，因此需要监听onreadystatechange事件


            xmlhttp.open("POST", "01AJAX.ashx?id=" + encodeURI('AJAX服务器') + "&ts=" + new Date(), false);
            
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4) {//readyState == 4 表示服务器返回数据了
                    if (xmlhttp.status == 200) {//如果状态码为200则是成功
                        //接收服务器的返回数据，没有用send的返回值，而是在onreadystatechange事件里来接收
                        document.getElementById("txtTime").value = xmlhttp.responseText; //responseText属性为服务器返回的文本
                    }
                    else {
                        alert("AJAX服务器返回错误!");
                    }
                }
            }
            //不要以为if(xmlhttp.readyState == 4) 在send之前执行！！！！
            //if (xmlhttp.readyState == 4)只有在服务器返回值以后才会执行，而!!send之后过一会儿服务器才会返回数据
            xmlhttp.send(); //这时才开始发送请求
        }
    </script>
</head>
<body>
    <input type="text" id="txtTime" />
    <input type="button" id="btn" value="button" onclick="btnClick()" />
</body>
</html>