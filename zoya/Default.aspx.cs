using System;
using System.Collections.Generic;
using System.IO;
using System.Data;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CalculateButton_Click(object sender, EventArgs e)
    {
        int counter = 0;
        string line;
        DataTable table = new DataTable();
        table.Columns.Add("Index");
        table.Columns.Add("Value");
        try
        {
            StreamReader file = new StreamReader(@"C:\Users\Zoya\Desktop\WebSite1\File.txt");
            string baseNumb = file.ReadLine();
            FirstLabel.Text = "The file has been successfully loaded.";
            table.Rows.Add(counter, Convert.ToInt32(baseNumb, 2));
            while ((line = file.ReadLine()) != null)
            {
                int remainingBits = baseNumb.Length - line.Length;
                baseNumb = baseNumb.Substring(0, remainingBits) + line;
                counter++;
                table.Rows.Add(counter, Convert.ToInt32(baseNumb, 2));
            }

            file.Close();

            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        catch (Exception exp)
        {   
            FirstLabel.Text = exp.Message;
        }
    }
}