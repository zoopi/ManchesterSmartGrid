﻿/* 
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
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Npgsql;
using NpgsqlTypes;
using IntelliSoftware;

public partial class Sensor_s_DB_postgretest16 : System.Web.UI.Page
{
    private static string connectionString = "";
    private string server = "";
    private string username = "";
    private string password = "";
    private string dbName = "";
    private bool isLogin = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int login = Convert.ToInt32(Request.QueryString["login"]);
            if (login == 0)
            {
                Multiview1.ActiveViewIndex = 0;
            }
            if(login == 1)
            {
                Multiview1.ActiveViewIndex = 1;
            }
        }
    }

    /* --- this method checks the values when page is loaded Or not working sensor
     *  if the value of each cell is over the threshold:
     *      1- active alert: highlight the cell
     *      2- Passive alert: sending sms
     */
    protected void OverThreshold(string tableName, double threshold)
    {
        AbnormalityService.overThresholdArray.Clear();
        Boolean workingSensor = false;
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            //for (int j = 0; j < GridView2.Rows[i].Cells.Count; j++)
            {
                DateTime today = DateTime.Now;
                DateTime yesterday = today.AddDays(-1);
                DateTime gridTime = Convert.ToDateTime(GridView2.Rows[i].Cells[0].Text);
                double data = Convert.ToDouble(GridView2.Rows[i].Cells[1].Text);
                if (data > threshold)
                {
                    GridView2.Rows[i].Cells[1].CssClass = "highlight";
                    if (gridTime.Date == yesterday.Date || gridTime.Date == today.Date)
                    {
                        GridView2.Rows[i].Cells[0].CssClass = "red";

                        //sendSMS("The value which is over the threshold is: " + data + " in " + tableName + ". ");

                        OverThresholdObj thresholdObj = new OverThresholdObj()
                        {
                            ActualDataValue = data,
                            PreDefinedThreshold = threshold,
                            TimeStamp = gridTime
                        };
                        AbnormalityService.overThresholdArray.Add(thresholdObj);
                    }
                }
                if (gridTime.Date == today.Date && gridTime.Hour >= today.AddHours(-1).Hour)
                {
                    workingSensor = true;
                }
            }
        }
        if (!workingSensor)
        {
            SensorError.Text = "The " + tableName + " is not working properly.";
            //sendSMS("The " + tableName + " is not working properly.");
        }
    }

    //Method for sending SMS via IntelliSMS
    protected void sendSMS(string msg)
    {
        IntelliSMS objIntelliSMS = new IntelliSMS();

        objIntelliSMS.Username = "your_username_here";
        objIntelliSMS.Password = "your_password_here";
        int Balance = objIntelliSMS.GetBalance();

        String MessageId = objIntelliSMS.SendMsg 
            ( "44775...", msg + "Your remaining credit is: " + Balance, "ZOYA" );
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        /* --- initialize the DataTable named table as a temp --- */
        DataTable table = new DataTable();

        //copying the gridview into the datatable
        GridViewToDataTable(GridView2, table);

        /* --- assign the start and end time from gridview which is populated by DB --- */
        DateTime startDate = Convert.ToDateTime(GridView2.Rows[0].Cells[0].Text);
        DateTime endDate = Convert.ToDateTime(GridView2.Rows[(GridView2.Rows.Count)-1].Cells[0].Text);

        bool showChartDesc = false;
        
        //trying to get the values from those two input fields and convert them to the proper date
        try
        {
            startDate = Convert.ToDateTime(startDateTextBox.Text);
            endDate = Convert.ToDateTime(endDateTextBox.Text);
            showChartDesc = true;
        }
        catch (Exception exp)
        {
            Label2.CssClass = "errorText";
            Label2.Text = exp.Message + "<br /> The input was invalid. You have to select a date from " + startDate.ToLongDateString() + " to " + endDate.ToLongDateString();
        }

        // querying on datatable for selecting only the rows which have the in range timestamp.
        var query = (from x in table.AsEnumerable()
                     where startDate <= x.Field<DateTime>("timeStamp") && x.Field<DateTime>("timeStamp") <= endDate
                     select x);

        // Drawing th Chart
        Chart1.CssClass = "showGraph";
        Chart1.DataSource = query;
        Chart1.DataBind();

        // Showing the search result
        GridView2.DataSource = query.AsDataView();
        GridView2.DataBind();

        Chart1.Series["Series1"].XValueMember = "TimeStamp";
        Chart1.Series["Series1"].YValueMembers = YDropDown.SelectedValue;

        Chart1.ChartAreas["ChartArea1"].AxisY.Title = YDropDown.SelectedValue + " (KW.h)";

        //if (Chart1.Series["Series1"].XValueMember.Contains((Convert.ToDateTime("06/05/2012")).ToString()))
        //Chart1.ChartAreas["ChartArea1"].AxisX.Title = Chart1.Series["Series1"].

        if (showChartDesc)
        {
            Label2.CssClass = "normalText";
            Label2.Text = "The Chart below shows the value of - " + YDropDown.SelectedItem.Text + " - from the Register of the " + tableReading.SelectedItem.Text + " from the Sub-Group of the New Main LV Switch Board in the main group of the Metering of Electric, Gas, Water, Heat, and Steam from the Kilburn Building. You have chosen " + 
                startDate.ToLongDateString() + " as your start date and " + endDate.ToLongDateString() +" as your final date" ;
        }
    }

    /* -- copying the gridview into datatable --- */
    protected void GridViewToDataTable(GridView gv, DataTable table)
    {
        table.Columns.Add("timeStamp", System.Type.GetType("System.DateTime"));
        table.Columns.Add("value" , System.Type.GetType("System.Double"));
        table.Columns.Add("total", System.Type.GetType("System.Double"));
        table.Columns.Add("duration", System.Type.GetType("System.Double"));
        
        for (int i = 0; i < gv.Rows.Count; i++){
            double data1 = 0;
            double data2 = 0;
            double data3 = 0;
            DateTime dt = new DateTime();

            for (int j = 0; j < gv.Rows[i].Cells.Count; j++){
                if (j == 0)
                    dt = Convert.ToDateTime(gv.Rows[i].Cells[j].Text);
                if (j == 1)
                    data1 = Convert.ToDouble(gv.Rows[i].Cells[j].Text);
                if (j == 2)
                    data2 = Convert.ToDouble(gv.Rows[i].Cells[j].Text);
                if (j == 3)
                    data3 = Convert.ToDouble(gv.Rows[i].Cells[j].Text);
            }
            table.Rows.Add(dt, data1, data2, data3);
        }
    }

    /* --- method for picking the start time from the pop up calender --- */
    protected void calStartDate_SelectionChanged(object sender, EventArgs e)
    {
        startDateTextBox.Text = calStartDate.SelectedDate.ToString("d");
    }

    /* --- method for picking the end time from the pop up calender --- */
    protected void calEndDate_SelectionChanged1(object sender, EventArgs e)
    {
        endDateTextBox.Text = calEndDate.SelectedDate.ToString("d");
    }

    protected void loginButton_Click(object sender, EventArgs e)
    {
        username = dbUserNameTextBox.Text;
        password = dbPassTextbox.Text;
        server = dbServerTextBox.Text;
        dbName = dbNameTextBox.Text;

        connectionString =
            "Server=" + server + ";" +
            "Database=" + dbName + ";" +
            "User ID="+ username + ";" +
            "Password=" + password + ";";

        InitialTheSearchPart(this.tableReading, this.YDropDown);
        
        String schema= "smart_meters";
        ConnectToDB(GridView2, connectionString, tableReading.SelectedValue, schema);
        //AddToBackupDB(tableReading.SelectedValue, GridView2);

        //For over threshold
        OverThreshold(tableReading.SelectedValue, 23);

        if(isLogin)
            Multiview1.ActiveViewIndex = 1;
    }

    protected void ConnectToDB(GridView gv, String connectionString, String table, String schemaName)
    {
        String query = "";
        if (table != null)
            query = "Select * " +
                       "From " + schemaName + ".\"" + table + "\"";
        else
            Label2.Text = "No table is selected";
        try
        {
            IDbConnection dbcon;
            dbcon = new NpgsqlConnection(connectionString);
            dbcon.Open();
            IDbCommand dbcmd = dbcon.CreateCommand();
            dbcmd.CommandText = query;
            IDataReader reader = dbcmd.ExecuteReader();
            gv.DataSource = reader;
            gv.DataBind();
            reader.Close();
            reader = null;
            dbcmd.Dispose();
            dbcmd = null;
            dbcon.Close();
            dbcon = null;
            isLogin = true;
        }
        catch
        {
            loginErrorLabel.CssClass = "errorText";
            loginErrorLabel.Text = "The connection is not established. Please check your input values.";
        }
    }

    protected void InitialTheSearchPart(DropDownList tableDropDownList, DropDownList yAxisDropDownList)
    {
        tableDropDownList.Items.Clear();
        tableDropDownList.Items.Add("tblReadingR1733");
        tableDropDownList.Items.Add("tblReadingR1735");
        tableDropDownList.Items.Add("tblReadingR1921");
        tableDropDownList.SelectedIndex = 0;
        tableDropDownList.AutoPostBack = true;

        yAxisDropDownList.Items.Clear();
        yAxisDropDownList.Items.Add("Value");
        yAxisDropDownList.Items.Add("Total");
    }

    protected void tableReading_SelectedIndexChanged(object sender, EventArgs e)
    {
        String schema = "smart_meters";
        ConnectToDB(GridView2, connectionString, tableReading.SelectedItem.Text, schema);
        //AddToBackupDB(tableReading.SelectedValue, GridView2);
    }

    protected void AddToBackupDB(String tableName, GridView gv)
    {
        String connstring = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\BackupDatabase.mdf;Integrated Security=True";
        using (SqlConnection connection = new SqlConnection(connstring))
        {
            connection.Open();
            
            SqlCommand dropTable = new SqlCommand("DROP TABLE " + tableName , connection);
            dropTable.ExecuteNonQuery();
            
            SqlCommand createTable = new SqlCommand("CREATE TABLE " + tableName + "(Timestamp DATETIME NOT NULL, Value FLOAT (53) NULL, Total FLOAT (53) NULL, Duration FLOAT (53) NULL);", connection);
            createTable.ExecuteNonQuery();
            
            DateTime today = DateTime.Now;
            DateTime oneWeekAgo = today.AddDays(-7); 
            
            foreach (GridViewRow GVRow in gv.Rows)
            {
                DateTime timeStamp = Convert.ToDateTime(GVRow.Cells[0].Text);
                if (today.Date >= timeStamp.Date && timeStamp.Date >= oneWeekAgo.Date)
                {
                    Double value = Convert.ToDouble(GVRow.Cells[1].Text);
                    Double total = Convert.ToDouble(GVRow.Cells[2].Text);
                    Double duration = Convert.ToDouble(GVRow.Cells[3].Text);

                    SqlCommand addRow = new SqlCommand("INSERT INTO " + tableName + " VALUES (@timestamp, @value, @total, @duration)", connection);
                    addRow.Parameters.AddWithValue("@timestamp", timeStamp);
                    addRow.Parameters.AddWithValue("@value", value);
                    addRow.Parameters.AddWithValue("@total", total);
                    addRow.Parameters.AddWithValue("@duration", duration);
                    addRow.ExecuteNonQuery();
                }
            }
            connection.Close();
        }
    }
    
    protected void BackupButton_Click(object sender, EventArgs e)
    {
        AddToBackupDB(tableReading.SelectedValue, GridView2);
    }
}