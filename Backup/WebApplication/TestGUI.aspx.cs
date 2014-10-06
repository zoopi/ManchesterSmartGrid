using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace WebApplication
{
    public partial class TestGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            String pullReq = "";
            
            foreach (String str in Notification.OverThresholdStringList)
                pullReq = pullReq + str;

            AlertNotification.Text = pullReq;
            */ 

            AbNormalityServiceReference.AbnormalityService service = new AbNormalityServiceReference.AbnormalityService();
            AbNormalityServiceReference.OverThresholdObj[] test = service.OverThresholdWebMethod();
            
            int size = test.Length;
            String text = "Size is " + size + "<br />";
            for (int i = 0; i < size; i++)
            {
                text = String.Format("{0}Time stamp: {1} <br /> Data: {2} <br /> Threshold: {3}"
                    , text, test[i].TimeStamp, test[i].ActualDataValue, test[i].PreDefinedThreshold);  
            }
            shaya.Text = text;
        }
    }
}