using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

 
    /// <summary>
    /// 
    /// </summary>
    public class SqlHelper
    {
        
        public static readonly String ConnStr = ConfigurationManager.AppSettings["constr"].ToString();
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="type"></param>
        /// <param name="spr"></param>
        /// <returns></returns>
        public static DataTable GetTable(String sql, CommandType type, params SqlParameter[] spr)
        {
            DataTable dt=null;
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.CommandType = type;
                        if (spr != null)
                        {
                            cmd.Parameters.AddRange(spr);
                        }
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
            catch (SqlException)
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="type"></param>
        /// <param name="spr"></param>
        /// <returns></returns>
        public static int ExcoutSQL(String sql, CommandType type, params SqlParameter[] spr)
        {
            int r = -1;
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.CommandType = type;
                        if (spr != null)
                        {
                            cmd.Parameters.AddRange(spr);
                        }
                       r= cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
                return r;
            }
            catch (SqlException e)
            {
            //    String err = "sql:" + sql + "err:" + e.Message;
            //    Inserterr(err);

                int ercode = e.Errors[0].Number;
                return ercode;
            }
        }

        public static int ExcoutSQL_2Parmter(String sql, CommandType type,  SqlParameter[] value_spr,SqlParameter[] where_spr)
        {
            int a=value_spr.Length;
            int b=where_spr.Length;
            SqlParameter[] spr=new SqlParameter[a+b];
            for (int i = 0; i < a; i++)
			{
			 spr[i]=value_spr[i];
			}
            for (int i = 0; i < b; i++)
			{
			 spr[a+i]=where_spr[i];
			}

            int r = -1;
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.CommandType = type;
                        if (spr != null)
                        {
                            cmd.Parameters.AddRange(spr);
                        }
                        r = cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
                return r;
            }
            catch (SqlException e)
            {
                int ercode = e.Errors[0].Number;
                return ercode;
            }
        }

        public static void ExcoutSQLX(String sql, CommandType type, params SqlParameter[] spr)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.CommandType = type;
                        if (spr != null)
                        {
                            cmd.Parameters.AddRange(spr);
                        }
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
            }
            catch (SqlException e)
            {
               
            }
        }
        /// <summary>
        /// 插入
        /// </summary>
        /// <param name="TableName">表名</param>
        /// <param name="spr">参数名须与列名一至</param>
        /// <returns></returns>
        public static String GetSQLInsert_normal(String TableName, SqlParameter[] spr)
        {
            String colnames="";
            foreach (SqlParameter item in spr)
            {
                colnames = colnames + item.ParameterName.Substring(1) + ",";
            }
            colnames = colnames.Substring(0,colnames.LastIndexOf(','));
            String colparmter = "";
            foreach (SqlParameter item in spr)
            {
                colparmter = colparmter + item.ParameterName + ",";
            }
            colparmter = colparmter.Substring(0, colparmter.LastIndexOf(','));
            String sql = String.Format("insert into {0} ({1}) values ({2})", TableName, colnames, colparmter);
            return sql;
        }

        public static String GetSQLSelect_normal(String TopNum,String Backcol,String TableName, SqlParameter[] spr,String compar,String andor,String order)
        {
            String[] compars = new String[] { };
            String[] andors = new String[] { };
            if (compar.Contains(','))
            {
                compars = compar.Split(',');
            }
            else
            {
                compars = new String[] { compar };
            }
            if (andor.Contains(','))
            {
                andors = andor.Split(',');
            }
            else
            {
                andors = new String[] { andor };
            }
            String str = "";
            int andorlenth = andors.Length;
            if (spr != null)
            {
                str = "where ";
                for (int i = 0; i < spr.Length; i++)
                {
                    if (i + 1 > andorlenth)
                    {
                        str = str + spr[i].ParameterName.Substring(1) + compars[i] + spr[i].ParameterName;
                    }
                    else
                    {
                        str = str + spr[i].ParameterName.Substring(1) + compars[i] + spr[i].ParameterName + " " + andors[i] + " ";
                    }
                }
            }

            String sql = String.Format("select {4} {0} from {1} {2} order by {3}", Backcol, TableName, str,order,TopNum);
            return sql;
        }

        public static String GetSQLUpdate_normal(String TableName, SqlParameter[] Set_spr,SqlParameter[] Where_spr,String compar,String andor)
        {
            String SetStr = "";
            String WhereStr = "";

            String colname = "";
            String pname = "";
            foreach (SqlParameter item in Set_spr)
            {
                colname = item.ParameterName.Substring(1);
                pname = item.ParameterName;
                SetStr = SetStr + colname + "=" + pname + ",";
            }
            SetStr = SetStr.Substring(0,SetStr.LastIndexOf(','));//


            String[] compars = null;
            String[] andors = null;
            if (compar.Contains(','))
            {
                compars = compar.Split(',');
            }
            else
            {
                compars = new String[] { compar };
            }
            if (andor.Contains(','))
            {
                andors = andor.Split(',');
            }
            else
            {
                andors = new String[] { andor };
            }
            String str = "";
            int andorlenth = andors.Length;
            if (Where_spr != null)
            {
                str = "";
                for (int i = 0; i < Where_spr.Length; i++)
                {
                    if (i + 1 > andorlenth)
                    {
                        str = str + Where_spr[i].ParameterName.Substring(1) + compars[i] + Where_spr[i].ParameterName;
                    }
                    else
                    {
                        str = str + Where_spr[i].ParameterName.Substring(1) + compars[i] + Where_spr[i].ParameterName + " " + andors[i] + " ";
                    }
                }
            }
            WhereStr = str;


            String sql = String.Format("update {0} set {1} where {2}",TableName,SetStr,WhereStr);
            return sql;
        }
    }

