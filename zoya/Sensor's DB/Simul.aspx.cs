using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class Sensor_s_DB_Simul : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string DSN = "PostgreSQL30";
        OdbcConnection connection = new OdbcConnection("Dsn=" + DSN);
        loginErrorLabel.Text = "State: " + connection.State.ToString();

        string query = "SELECT * FROM q1;";

        GridViewDataTextColumn myCol0 = new GridViewDataTextColumn();
        GridViewDataTextColumn myCol1 = new GridViewDataTextColumn();
        GridViewDataTextColumn myCol2 = new GridViewDataTextColumn();
        GridViewDataTextColumn myCol3 = new GridViewDataTextColumn();

        try
        {
            OdbcDataAdapter adapter = new OdbcDataAdapter(query, connection);
            DataTable dt = new DataTable();
            connection.Open();
            adapter.Fill(dt);

            myCol0.FieldName = dt.Columns[0].ColumnName;
            myCol0.VisibleIndex = 0;

            myCol1.FieldName = dt.Columns[1].ColumnName;
            myCol1.VisibleIndex = 1;
            
            myCol2.FieldName = dt.Columns[2].ColumnName;
            myCol2.VisibleIndex = 2;

            myCol3.FieldName = dt.Columns[3].ColumnName;
            myCol3.VisibleIndex = 3;

            grid.Columns.Clear();
            grid.Columns.Add(myCol0);
            grid.Columns.Add(myCol1);
            grid.Columns.Add(myCol2);
            grid.Columns.Add(myCol3);

            grid.DataSource = dt;
            grid.DataBind();

            Chart1.DataSource = dt;
            Chart1.DataBind();
            Chart1.Series["Series1"].XValueMember = dt.Columns[0].ColumnName;
            Chart1.Series["Series1"].YValueMembers = dt.Columns[2].ColumnName;
            Chart1.ChartAreas["ChartArea1"].AxisY.Title = dt.Columns[2].ColumnName;
            Chart1.ChartAreas["ChartArea1"].AxisX.Title = "Time Stamp";
            
            
            //connection.Close();
        }
        catch (Exception exp)
        {
            loginErrorLabel.Text = exp.Message;
        }
    }
}