<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestGUI.aspx.cs" Inherits="WebApplication.TestGUI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> This is the Test Web Service GUI</h1>
    </div>
    <div style="border: 2px dashed black; width:500px; height:200px;">
        <asp:Label ID="AlertNotification" runat="server" ForeColor="Red" />
    </div>
    <div>
        <p> In the following you can find the result of web service:</p>
        <div>
            <asp:Label ID="shaya" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
