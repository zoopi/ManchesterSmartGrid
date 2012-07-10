<%@ Page Language="c#" AutoEventWireup="true" Title="postgres via Npgsql" CodeFile="Postgretest16.aspx.cs" Inherits="Sensor_s_DB_postgretest16" %>
<!-- 
 * Copyright (c) 2011-2012 , Zoya Pourmirza, 2012, All Rights Reserved.
 * 
 * == BEGIN LICENSE == 
 * 
 *      Licensed under the GNU Lasser General Public License, Version 2.1 (the "License");
 *      You may not use this file except in compliance with the License.
 *      You may obtain a copy of the License at
 *          - GNU Lesser General Public License Version 2.1 (the "LGPL") 
 *          http://www.gnu.org/licenses/lgpl-2.1.html
 * 
 *      This software is free; you can redistribute it and/or
 *      modify it under the terms of the GNU Lesser General Public
 *      License as published by the Free Software Foundation; either
 *      version 2.1 of the License, or (at your option) any later version.
 *
 *      This library is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU 
 *      Lesser General Public License for more details.
 *
 *      You should have received a copy of the GNU Lesser General Public
 *      License along with this software; if not, write to the Free Software
 *      Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 * 
 *      The University of Manchester, hereby disclaims all copyright interest in
 *      the software written by Zoya Pourmirza.
 *
 * 
 * == END LICENSE == 
 * 
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="head1" runat="server">
    
    <title>Graph and Data</title>
    
    <link href="../StyleSheet.css" rel="StyleSheet" media="screen"/>
    
    <!-- using meta for refreshing purpos -->
    <meta http-equiv="refresh" content="86400"/>
    
    <!-- JavaScript for popup Calender -->
    <script type="text/javascript">
        function popupCalendar(var1){
            var dateField = document.getElementById(var1);
            if (dateField.style.display == 'none')
                dateField.style.display = 'block';
            else
                dateField.style.display = 'none';
        }
    </script>

    <style type="text/css">
        body 
        {
            background-color:#FAE6FA;
            height: 677px;
        }
        .highlight
        {
            background-color: Yellow;
        } 
        .red
        {
            background-color: Red;
        }   
        .errorText
        {
            color: Red;
            font-weight:bold;
            text-align:center;
            margin:10px;
        }
        .normalText
        {
            color: balck;
            font-weight:normal;
            text-align:left;
            margin:10px;
        }
        .showGraph
        {
            display:inline;
        } 
        .hideGraph
        {
            display:none;
        }
    </style>
</head>

<body>
 <form id="form1" runat="server">
    <div id="headerButtons"> 
        <p id="back2Main">    
            <a href="../Test.aspx"> 
                <input type="button" value="Return to the main page" />
            </a>
        </p>
        <!-- is it working? -->
        <p id="dataGraph">
            <a target="_blank" href="../Graph/graph1.aspx"> </a>
        </p>
    </div>    
    <asp:MultiView runat="server" ID="Multiview1">
        <asp:View runat="server" ID="loginView">
            <div id="loginCheck">
                <table>
                <tr>
                    <td><asp:Label runat="server" ID="serverLabel" Text="Server URI" /></td>
                    <td><asp:TextBox runat="server" ID="dbServerTextBox" /></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="User Name" ID="dbUserNameLabel" /></td>
                    <td><asp:TextBox runat="server" ID="dbUserNameTextBox"/></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Password" ID="dbPassLabel" /></td>
                    <td><asp:TextBox runat="server" ID="dbPassTextbox" TextMode="Password"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button runat="server" ID="loginButton" Text="Login" 
                            onclick="loginButton_Click"/></td>
                </tr>
            </table>
            <p>
                <asp:Label runat="server" Text="" ID="loginErrorLabel" />
            </p>
        </div>
    </asp:View>
    <asp:View runat="server" ID="dataView"> 
        <div id="showTableAndGraphWrapper">
        <div id="searchSection">
            <asp:Label ID="tableLabel" runat="server" Text="Select the table" AssociatedControlID="tablereading"></asp:Label>
            <asp:DropDownList ID="tableReading" runat="server" Height="30px" Width="140px" 
                onselectedindexchanged="tableReading_SelectedIndexChanged"/>
             
            <asp:Label runat="server" ID="startDateLabel" Text="Start Date" AssociatedControlID="startDateTextBox"/>
            <asp:TextBox runat="server" ID="startDateTextBox" />
            <img src="../markers/cal.png" onclick="popupCalendar('dateStartField')" alt="calender" width="40px"/>

            <asp:Label runat="server" ID="endDateLabel" Text="End Date" AssociatedControlID="endDateTextBox"/>
            <asp:TextBox runat="server" ID="endDateTextBox" />
            <img src="../markers/cal.png" onclick="popupCalendar('dateEndField')" alt="calender" width="40px"/>
            
            <asp:Label ID="yAxisLabel" runat="server" Text="Select value of Y axix" AssociatedControlID="YDropDown"></asp:Label>
            <asp:DropDownList ID="YDropDown" runat="server" Height="30px" Width="100px" />

            <asp:Button ID="Button1" runat="server" Text="Show Graph" onclick="Button1_Click"/>
            <asp:Label ID="showSelectedLabel" runat="server"/>     

            <p style="display:block;"> 
                <asp:Label ID="Label2" runat="server" Text=""/> 
            </p>  
                    
        </div>

        <!-- Div -> calender for the start date -->
        <div id="dateStartField" style="display:none; float:left; margin-left:260px">
            <asp:Calendar id="calStartDate" 
                OnSelectionChanged="calStartDate_SelectionChanged" Runat="server" 
                BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                ForeColor="#003399" Height="200px" Width="220px" >
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                    Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </div>

        <!-- Div -> calender for the end date -->
        <div id="dateEndField" style="display:none; float:right; margin-right:510px;">
            <asp:Calendar id="calEndDate" 
                Runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" 
                CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                ForeColor="#003399" Height="200px" Width="220px" 
                onselectionchanged="calEndDate_SelectionChanged1" >
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                    Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </div>

        <!-- Div -> Showing the Graph -->
        <div id="graph">
            <asp:Chart ID="Chart1" runat="server" Height="500px" Width="1200px" 
                BackColor="#FAE6FA" CssClass="hideGraph">
                <Series>
                    <asp:Series ChartType="Spline" Name="Series1" Legend="Legend1" XValueType="DateTime" />
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisY Title="Value (Joule)" TitleFont="Microsoft Sans Serif, 9.75pt, style=Bold" 
                            MaximumAutoSize="100" LineWidth="1">
                        </AxisY>
                        <AxisX Title="TimeStamp" IsLabelAutoFit="False" 
                            TitleFont="Microsoft Sans Serif, 9.75pt, style=Bold" MaximumAutoSize="100">
                            <LabelStyle Interval="Auto" Font="Microsoft Sans Serif, 9.75pt" />
                        </AxisX>
                    </asp:ChartArea>
                </ChartAreas>                                   
            </asp:Chart>
        </div>
        <div id="calender">
            <asp:Calendar runat="server" BackColor="White" BorderColor="Black" 
                BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" 
                ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                    Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                    Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
        </div>
        <div id="gridView">
            <p>
            The following table shows data from the Kilburn Building updated at 5am with previous day data.
            </p>
            <asp:GridView id="GridView2" runat="server" HorizontalAlign="Left" 
                Width="500px" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                BorderWidth="1px" CellPadding="3" GridLines="Vertical" >
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div> 
    </div>                              
    </asp:View>
    </asp:MultiView>
</form>
</body> 
</html>       