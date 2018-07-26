<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajax.aspx.cs" Inherits="AJAX.ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ajax</title>
    <script type="text/javascript">
        function btnClick() {
            var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            if (!xmlhttp) {
                alert("创建xmlhttp对象异常");
                return;
            }

            xmlhttp.open("POST",);

        }
    </script>
</head>
<body>
    <input type="text" id="txtTime" />
    <input type="button" id="btn" value="button" onclick="btnClick()" />
</body>
</html>
