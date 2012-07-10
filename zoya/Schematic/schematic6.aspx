<%@ Page Language="C#" AutoEventWireup="true" CodeFile="schematic6.aspx.cs" Inherits="Schematic_schematic6" %>


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
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <a href="../Test.aspx">
    <input type=button value="Return to the main page" />
    </a>
    </br>  
    
     <a href="../Sensor's DB/sensor6DB.aspx"> 
    <input type="button" value="Return to the DataBase">
    </a>
        
        
    <div>
        <asp:Image ID="Image1" runat="server" 
            ImageUrl="~/Schematic/6.jpg" Height="800px" />
    </div>
    </form>
</body>
</html>