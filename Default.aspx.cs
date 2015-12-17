using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    //公有变量：String 类型
    //json_zgxx 返回字段包含：id,titles,bclass,sclass,fbtimes　查询条件：表　article  sclass=6
    //json_tzgg 返回字段包含：id,titles,bclass,sclass, fbtimes 查询条件：表　article  sclass=5
    //json_flfg 返回字段包含：id,titles,bclass,sclass ,fbtimes 查询条件：表　article  sclass=6

    _BLL b = new _BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        string  json_zgxx = json_zgxxz();
        string  json_tzgg = json_tzggt();
        string  json_flfg = json_flfgf();



           }
  
 
   
    public string json_zgxxz()
    {
        string jason = "";
        DataTable dt = b.zgxx();
        jason = Tools.BiuldJson_InitTime("", dt, 4, "yyyy/MM/dd");
        return jason;
    }


   
    
    public string json_tzggt()
    {

        string jason = "";
        DataTable dt = b.tzgg();
        jason = Tools.BiuldJson_InitTime("", dt, 4, "yyyy/MM/dd");
        return jason;
    }


    public string json_flfgf()
    {

        string jason = "";
        DataTable dt = b.flfg();
        jason = Tools.BiuldJson_InitTime("", dt, 4, "yyyy/MM/dd");
        return jason;
    }


}
  
  
     
