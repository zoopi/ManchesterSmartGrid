using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class OverThresholdObj
{
    public DateTime TimeStamp { set; get; }
    public double PreDefinedThreshold { set; get; }
    public double ActualDataValue { set; get; }
}