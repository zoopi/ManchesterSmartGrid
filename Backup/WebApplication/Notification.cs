using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication
{
    public class Notification
    {
        public static List<String> OverThresholdStringList { get; set; }

        public List<String> Alert(AbNormalityServiceReference.OverThresholdObj obj)
        {
            String text = String.Format("Time stamp: {0} <br /> Data: {1} <br /> Threshold: {2}"
                    , obj.TimeStamp, obj.ActualDataValue, obj.PreDefinedThreshold);

            //OverThresholdString = text;

            OverThresholdStringList.Add(text);

            return OverThresholdStringList;
        }
    }
}