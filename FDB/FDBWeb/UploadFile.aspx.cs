using LumenWorks.Framework.IO.Csv;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FDBWeb
{
    public partial class UploadFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FUControl.HasFile == true)
            {
                string FilePath = System.Web.HttpContext.Current.Server.MapPath("Uploads");
                string FileName = FUControl.FileName;
                string FullFilePath = FilePath + "\\" + FileName;
                FUControl.SaveAs(FullFilePath);           


                var vFacilityCode = string.Empty;
                var strConnection = string.Empty;
                if (FullFilePath.Contains(".xlsx"))
                {
                    strConnection = string.Concat(str0: "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=", str1: FullFilePath, str2: ";Extended Properties=", str3: ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"");
                }
                else
                {
                    strConnection = string.Concat(str0: "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=", str1: FullFilePath, str2: ";Extended Properties=", str3: "Excel 8.0;");
                }

                var dt = new System.Data.DataTable("dtSheet");

                using (var conn = new OleDbConnection(strConnection))
                {
                    conn.Open();
                    var dtSheet = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                    var lstSheet = new List<string>();
                    foreach (DataRow drSheet in dtSheet.Rows)
                    {
                        if (drSheet["TABLE_NAME"].ToString().Contains("$"))
                        {
                            lstSheet.Add(drSheet["TABLE_NAME"].ToString());
                        }
                    }
                    using (var da = new OleDbDataAdapter(string.Format("SELECT * FROM [{0}]", lstSheet[0]), conn))
                    {
                        da.Fill(dt);
                    }

                    try
                    {
                        dt = dt.Rows.Cast<DataRow>().Where(row => !row.ItemArray.All(field => field is System.DBNull || string.Compare((field as string).Trim(), string.Empty) == 0)).CopyToDataTable();
                    }
                    catch { }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

            }
        }
    }
}