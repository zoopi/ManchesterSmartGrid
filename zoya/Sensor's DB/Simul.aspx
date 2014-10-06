<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Simul.aspx.cs" Inherits="Sensor_s_DB_Simul" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        // <![CDATA[
            var timeout;
            function scheduleGridUpdate(grid) {
                window.clearTimeout(timeout);
                timeout = window.setTimeout(
                    function () { grid.Refresh(); },
                    2000
                );
            }
            function grid_Init(s, e) {
                scheduleGridUpdate(s);
            }
            function grid_BeginCallback(s, e) {
                window.clearTimeout(timeout);
            }
            function grid_EndCallback(s, e) {
                scheduleGridUpdate(s);
            }
        // ]]>
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:550px; width:280px; float:left; margin:80px auto auto 50px; overflow:scroll">
            <dx:ASPxGridView ID="grid" runat="server"
                    AutoGenerateColumns="False" Theme="Office2003Silver">

                    <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
                    
                    <Styles>
                        <Header HorizontalAlign="Center" />
                    </Styles>
                    <Settings GridLines="Vertical" ShowFilterRow="True" />
                    
                    
                    <SettingsBehavior AllowDragDrop="false" />
                    <SettingsPager Mode="ShowAllRecords" />
                    <SettingsLoadingPanel Mode="ShowOnStatusBar" />
                </dx:ASPxGridView>
            </div>

            <div style="height:550; width:800px; float:right; margin:30px 50px auto auto;">
                <asp:Chart ID="Chart1" runat="server" style="width:800px; height:600px">
                    <Series>
                        <asp:Series Name="Series1" ChartType="Spline">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <div>
            </div>
            <div>
                <asp:Label runat="server" ID="loginErrorLabel" />
            </div>
    </form>
</body>
</html>
