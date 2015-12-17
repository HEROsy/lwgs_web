<%@ WebHandler Language="C#" Class="ReceivFile" %>

using System;
using System.Web;

public class ReceivFile : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        try
        {
            HttpPostedFile files = context.Request.Files["upfile"];

            if (files!=null&&files.ContentLength>0)
            {
                String picpath = "..//img//upload//";// System.Configuration.ConfigurationManager.AppSettings["AdminUpFilePath"].ToString();
                
                    String pic;
                    String str = files.FileName;
                    String hdm = str.Substring(str.LastIndexOf('.'));
                    Random rd = new Random();
                    String filename =DateTime.Now.ToString("yyyyMMddhhmmss") + rd.Next(0, 9).ToString() + rd.Next(0, 9).ToString() + hdm;
                    pic = picpath + filename;

                    files.SaveAs(context.Server.MapPath(pic));
                    context.Response.Write("ok:"+filename);
                    //Response.End();
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                
            }
        }
        catch (Exception)
        {
            context.Response.Write("no:上传文件不符合规范,请重试!");
            context.Response.End();
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}