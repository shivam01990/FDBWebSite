using FDBBLL;
using FDBDAL;
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
            var lstReturnMedicine = new List<clsMedicine>();

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
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        vFacilityCode = Convert.ToString(dt.Rows[1][1]);

                        dt.Columns.Add("MSG", typeof(string));
                        dt.Columns.Add("Pharmacy Unit Price", typeof(string));
                        //dt.Columns.Add("FDB Unit Price", typeof(string));
                        dt.Columns.Add("Unit Price", typeof(string));
                        dt.Columns.Add("Original Unit Price", typeof(string));
                        dt.Columns.Add("Price", typeof(string));
                        dt.Columns.Add("PercentVariance", typeof(string));
                        dt.Columns.Add("Variance", typeof(string));

                        FDBEntities db = new FDBEntities();

                        var objFacility = FacilityService.Instance.GetFacility(vFacilityCode.Trim());
                        int MedicineCount = db.Medicines.Count();

                        if (MedicineCount > 0)
                        {
                            clsMedicine objMedicine = null;
                            for (var i = 0; i < dt.Rows.Count; i++)
                            {
                                try
                                {
                                    objMedicine = new clsMedicine();

                                    objMedicine.Chain = dt.Rows[i][0] != DBNull.Value ? Convert.ToString(dt.Rows[i][0]) : string.Empty;

                                    objMedicine.Facility = dt.Rows[i][1] != DBNull.Value ? Convert.ToString(dt.Rows[i][1]) : string.Empty;

                                    objMedicine.Month = dt.Rows[i][2] != DBNull.Value ? DateTime.Parse(Convert.ToString(dt.Rows[i][2])) : default(Nullable<DateTime>);

                                    objMedicine.RX = dt.Rows[i][3] != DBNull.Value ? Convert.ToString(dt.Rows[i][3]) : string.Empty;

                                    try
                                    {
                                        objMedicine.Date = dt.Rows[i][4] != DBNull.Value ? DateTime.Parse(Convert.ToString(dt.Rows[i][4])) : default(Nullable<DateTime>);
                                    }
                                    catch { }
                                    objMedicine.PatientID = dt.Rows[i][5] != DBNull.Value ? Convert.ToInt32(dt.Rows[i][5]) : new Nullable<Int32>();

                                    objMedicine.PatientLast = dt.Rows[i][6] != DBNull.Value ? Convert.ToString(dt.Rows[i][6]) : string.Empty;

                                    objMedicine.PatientFirst = dt.Rows[i][7] != DBNull.Value ? Convert.ToString(dt.Rows[i][7]) : string.Empty;

                                    objMedicine.NDC = dt.Rows[i][8] != DBNull.Value ? Convert.ToString(dt.Rows[i][8]) : string.Empty;

                                    objMedicine.Medication = dt.Rows[i][9] != DBNull.Value ? Convert.ToString(dt.Rows[i][9]) : string.Empty;

                                    objMedicine.Quantity = dt.Rows[i][10] != DBNull.Value ? Double.Parse(Convert.ToString(dt.Rows[i][10])) : default(Nullable<double>);

                                    objMedicine.Cost = dt.Rows[i][11] != DBNull.Value ? Double.Parse(Convert.ToString(dt.Rows[i][11])) : default(Nullable<Double>);

                                    objMedicine.Physician = dt.Rows[i][12] != DBNull.Value ? Convert.ToString(dt.Rows[i][12]) : string.Empty;

                                    objMedicine.PhysicianNPI = dt.Rows[i][13] != DBNull.Value ? Convert.ToString(dt.Rows[i][13]) : string.Empty;

                                    objMedicine.PayType = dt.Rows[i][14] != DBNull.Value ? Convert.ToString(dt.Rows[i][14]) : string.Empty;

                                    objMedicine.DaysSupply = dt.Rows[i][15] != DBNull.Value ? Convert.ToString(dt.Rows[i][15]) : string.Empty;

                                    objMedicine.RouteOfAdmin = dt.Rows[i][16] != DBNull.Value ? Convert.ToString(dt.Rows[i][16]) : string.Empty;

                                    objMedicine.InventoryCategory = dt.Rows[i][17] != DBNull.Value ? Convert.ToString(dt.Rows[i][17]) : string.Empty;

                                    objMedicine.Copay = dt.Rows[i][18] != DBNull.Value ? Convert.ToString(dt.Rows[i][18]) : string.Empty;

                                    objMedicine.Brand = dt.Rows[i][19] != DBNull.Value ? Convert.ToString(dt.Rows[i][19]) : string.Empty;


                                    Medicine objMedicine_5 = new Medicine();
                                    Medicine objMedicine_7 = new Medicine();
                                    Medicine objMedicine_9 = new Medicine();
                                    double? FDBPrice = 0;
                                    double? BillPrice = 0;
                                    var ndc = Convert.ToString(dt.Rows[i][8]);

                                    objMedicine_5 = (from item in
                                                         db.Medicines
                                                     where item.NDC == ndc
                                                      && item.PriceType == 5
                                                     orderby item.Date
                                                      descending
                                                     select item).FirstOrDefault();

                                    if (objMedicine_5 != null)
                                    {
                                        objMedicine_5.Price = (objMedicine_5.Price * 1.2) + 5;
                                    }

                                    objMedicine_7 = (from item in db.Medicines
                                                     where item.NDC == ndc
                                                      && item.PriceType == 7
                                                     orderby item.Date
                                                      descending
                                                     select item).FirstOrDefault();

                                    if (objMedicine_7 != null)
                                    {
                                        objMedicine_7.Price = (objMedicine_7.Price * 1.2) + 5;
                                    }

                                    objMedicine_9 = (from item in
                                                         db.Medicines
                                                     where item.NDC == ndc
                                                      && item.PriceType == 9
                                                     orderby item.Date
                                                      descending
                                                     select item)
                                                             .FirstOrDefault();
                                    if (objMedicine_9 != null)
                                    {
                                        objMedicine_9.Price = (objMedicine_9.Price * 1.2) + 5;
                                    }

                                    try
                                    {
                                        objMedicine.PharmacyUnitPrice = Math.Round(objMedicine.Cost.Value / objMedicine.Quantity.Value, 3);
                                    }
                                    catch { objMedicine.PharmacyUnitPrice = 0; }

                                    BillPrice = objMedicine.Cost;
                                    try
                                    {
                                        if (Convert.ToString(dt.Rows[i]["Brand"]).ToUpper() == "Y")
                                        {
                                            if (objMedicine_9 != null)
                                            {
                                                objMedicine.FDBUnitPrice = objMedicine_9.Price - (objMedicine_9.Price * 5 / 100);
                                                FDBPrice = objMedicine.Quantity * objMedicine_9.Price;
                                            }
                                            else
                                            {
                                                objMedicine.FDBUnitPrice = 0;
                                                FDBPrice = 0;
                                            }
                                        }
                                        else
                                        {
                                            if (objMedicine_7 != null)
                                            {
                                                objMedicine.FDBUnitPrice = objMedicine_7.Price;
                                                FDBPrice = objMedicine.Quantity * objMedicine_7.Price;
                                            }
                                            else
                                            {
                                                objMedicine.FDBUnitPrice = 0;
                                                FDBPrice = 0;
                                            }
                                        }

                                        if (objMedicine_7 != null)
                                        {
                                            objMedicine.SSG = objMedicine_7.Price - (objMedicine_7.Price * 20 / 100);
                                        }
                                        else
                                        {
                                            objMedicine.SSG = 0;
                                        }

                                        if (objMedicine_5 != null)
                                        {
                                            objMedicine.MSG = objMedicine_5.Price - (objMedicine_5.Price * 5 / 100);
                                        }
                                        else
                                        {
                                            objMedicine.MSG = 0;
                                        }
                                    }
                                    catch { }
                                    objMedicine.FDBPrice = FDBPrice;
                                    objMedicine.PharmacyPrice = BillPrice;
                                    objMedicine.Variance = CalculateVariance(FDBPrice, BillPrice);
                                    double PercentVariance = 0;
                                    try
                                    {
                                        PercentVariance = (double)((FDBPrice - BillPrice) / BillPrice);
                                    }
                                    catch { }
                                    objMedicine.PercentVariance = PercentVariance;

                                    lstReturnMedicine.Add(objMedicine);
                                }
                                catch (Exception ex)
                                {
                                    //AddtoLogFile("Upload Error:" + ex.ToString());
                                }
                            }
                        }

                    }
                    GridView1.DataSource = lstReturnMedicine;
                    GridView1.DataBind();
                }

            }
        }

        public double CalculateVariance(double? x, double? y)
        {
            double Variance = 0;
            double _x = 0;
            double _y = 0;
            try
            {
                _x = (double)x;

            }
            catch { }
            try
            {
                _y = (double)y;
            }
            catch { }
            double Mean = (_x + _y / 2);
            Variance = (Math.Pow(_x - Mean, 2) + Math.Pow(_y - Mean, 2)) / 2;



            return Math.Sqrt(Variance);
        }
    }
}