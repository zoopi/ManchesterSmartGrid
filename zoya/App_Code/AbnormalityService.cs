using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for AbnormalityService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AbnormalityService : System.Web.Services.WebService {

    public static List<OverThresholdObj> overThresholdArray = new List<OverThresholdObj>();
    //public List<OverThresholdObj> pullRequest = new List<OverThresholdObj>();
    //public List<OverThresholdObj> publishSubs = new List<OverThresholdObj>();

    [WebMethod]
    public List<OverThresholdObj> OverThresholdWebMethod()
    {
        if (overThresholdArray == null)
            return null;
        else
        {
            return overThresholdArray;
            /*
            WebApplication.Notification alert = new WebApplication.Notification();

            foreach (OverThresholdObj overThr in overThresholdArray)
            {
                double addedPercentage = (overThr.ActualDataValue / overThr.PreDefinedThreshold) - 1;
                if (addedPercentage < 0.05)
                {
                    pullRequest.Add(overThr);
                }
                else
                {
                    alert.Alert(overThr);
                }
            }
             */
            //return pullRequest;
        }
    }
}
