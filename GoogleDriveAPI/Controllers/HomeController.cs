using GoogleDriveAPI.Models;
using OfficeOpenXml;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;

namespace GoogleDriveAPI.Controllers
{
    public class HomeController : Controller
    {
        QuanLyLichThiEntities db = new QuanLyLichThiEntities();

        public ActionResult Index()
        {
            List<Khoa> listKhoa = db.Khoas.ToList();
            return View(listKhoa);
        }

        public ActionResult DangNhapPartial()
        {
           
            return PartialView();
        }

        public JsonResult DangNhap(FormCollection f)
        {
            string email = f["Email"];
            string pass = f["Pass"];
            NguoiDung user = db.NguoiDungs.SingleOrDefault(x => x.Email == email && x.Pass == pass);
            if(user == null)
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                Session["User"] = user;
                return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult HeaderPartial()
        {
            NguoiDung user = Session["User"] as NguoiDung;
            ViewBag.listKhoa = db.Khoas.ToList();
            if(user == null)
            {
                ViewBag.idUser = 0;
            }
            else
            {
                ViewBag.idUser = 1;
            }
            
            return PartialView(user);
        }

        public ActionResult DangXuat()
        {
            Session["User"] = null;

            return RedirectToAction("Index");
        }
        public ActionResult XemLichThi(int id)
        {
            ViewBag.TenKhoa = db.Khoas.SingleOrDefault(n=>n.MaKhoa == id).TenKhoa;
            ViewBag.giangVien = db.NguoiDungs.Where(n => n.MaKhoa == id).Where(n => n.MaLND == 1).ToList();
            ViewBag.hocPhan = db.MonHocs.Where(n => n.MaKhoa == id).ToList();

            List<LichThi> lich = db.LichThis.Where(n => n.MaKhoa == id).Where(n=>n.NhomMonHoc.MonHoc.MaKhoa == id).ToList();

            ViewBag.user = Session["User"] as NguoiDung;

            return View(lich);
        }
        public ActionResult DangKyLichThi()
        {
            NguoiDung user = Session["User"] as NguoiDung;
            List<NhomMonHoc> listNhom = db.NhomMonHocs.Where(n => n.MaGV == user.MaND).ToList();
            ViewBag.listNhom = listNhom;
            ViewBag.listPhong = db.PhongHocs.ToList();
            return View();
        }
        public JsonResult GetListMon()
        {
           
            NguoiDung user = Session["User"] as NguoiDung;

            List<NhomMonHoc> listNhom = db.NhomMonHocs.Where(n => n.MaGV == user.MaND).ToList();
            var list = listNhom.Select(x => new
            {
                ID = x.MaMon,
                MaMon = x.MonHoc.MaMon,
                TenMon = x.MonHoc.TenMon

            }).Distinct();

            return Json(new { listNhom = list }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetListNhom(int MaMon)
        {
            
            NguoiDung user = Session["User"] as NguoiDung;
            List<NhomMonHoc> listNhom = db.NhomMonHocs.Where(n => n.MaGV == user.MaND && n.MaMon == MaMon).ToList();
           
          
            return PartialView("GetListNhom");
        }
        public JsonResult GetListNhom1(int MaMon)
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;
            List<NhomMonHoc> listNhom = db.NhomMonHocs.Where(n => n.MaGV == user.MaND && n.MaMon == MaMon).ToList();


            return Json(new { listNhom = listNhom }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetListTime()
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;

            List<ThoiGian> listTG = db.ThoiGians.ToList();

            return Json(new { listTG = listTG }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllLT()
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;

            List<LichThi> listLT = db.LichThis.ToList();

            return Json(new { listLT = listLT }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetListHTThi()
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<HinhThucThi> listHT = db.HinhThucThis.ToList();

            return Json(new { listHT = listHT }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllPhong()
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;

            List<PhongHoc> listPhong = db.PhongHocs.ToList();

            return Json(new { listPhong = listPhong }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SubmitDangKy(int MaPhong, int MaNhom, int MaTG, int MaHT, string Note, int slCB) {
            NguoiDung user = Session["User"] as NguoiDung;
            LichThi lich = new LichThi();
            lich.MaPhong = MaPhong;
            lich.MaNhom = MaNhom;
            lich.MaTG = MaTG;
            lich.MaHT = MaHT;
            lich.SLGV = slCB;
            lich.Note = Note;
            ThoiGian tg = db.ThoiGians.SingleOrDefault(n=>n.MaTG == MaTG);
            lich.MaKhoa = user.MaKhoa;
            
            lich.ThoiGian = tg.ThoiGian1;
            db.LichThis.Add(lich);
            db.SaveChanges();
            
            return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult DeleteLichThi(int MaLich)
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;
            List< DoiLichThi> doilich = db.DoiLichThis.Where(n => n.MaLich == MaLich).ToList();
            if(doilich.Count > 0)
            {
                foreach(var item in doilich)
                {
                    List<ThongBao> tb = db.ThongBaos.Where(n => n.MaDoiLich == item.ID).ToList();
                    foreach(var t in tb)
                    {
                        db.ThongBaos.Remove(t);
                    }
                    db.DoiLichThis.Remove(item);
                }
                
               
            }

            LichThi lich = db.LichThis.SingleOrDefault(n => n.MaLich == MaLich);
            if (lich == null)
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            db.LichThis.Remove(lich);

            db.SaveChanges();
            return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SuaLichThi(int MaLich)
        {
            LichThi lich = db.LichThis.SingleOrDefault(n => n.MaLich == MaLich);

            return View(lich);
        }
        public JsonResult SubmitSuaLich(int MaLich, int MaPhong, int MaTG,  string Note, int slCB)
        {
            NguoiDung user = Session["User"] as NguoiDung;
            LichThi lich = db.LichThis.SingleOrDefault(n => n.MaLich == MaLich);
            if(lich == null)
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            lich.MaPhong = MaPhong;
           
            lich.MaTG = MaTG;
           
            lich.SLGV = slCB;
            lich.Note = Note;
            ThoiGian tg = db.ThoiGians.SingleOrDefault(n => n.MaTG == MaTG);
            lich.MaKhoa = user.MaKhoa;

            lich.ThoiGian = tg.ThoiGian1;
           
            db.SaveChanges();

            return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
        }
        public void InFileExcel()
        {
            using (ExcelEngine excelEngine = new ExcelEngine())
            {
                IApplication application = excelEngine.Excel;
                application.DefaultVersion = ExcelVersion.Xlsx;
                //Create a workbook
                IWorkbook workbook = application.Workbooks.Create(1);
                IWorksheet worksheet = workbook.Worksheets[0];
                //Add a picture
                IPictureShape shape = worksheet.Pictures.AddPicture(1, 2, Server.MapPath("~/Content/images/logo_CTU.png"), 5, 5);
                //Disable gridlines in the worksheet
                worksheet.IsGridLinesVisible = false;
               
               

                //ExcelPackage ex = new ExcelPackage();
                //ExcelWorksheet ws = ex.Workbook.Worksheets.Add("Report");
                worksheet["A1:Z100"].CellStyle.Font.FontName = "Times New Roman";
                worksheet.Range["A1:Z100"].CellStyle.Font.Size = 13;
                worksheet.Range["A5:C5"].Merge();
                worksheet.Range["A5"].Text = "TRƯỜNG ĐẠI HỌC CẦN THƠ";
                worksheet.Range["A6:C6"].Merge();
                worksheet.Range["A6"].Text = "Trường Công Nghệ Thông Tin và Truyền Thông";
                worksheet.Range["A6"].CellStyle.Font.Bold = true;
                worksheet.Range["H1:K1"].Merge();
                worksheet.Range["H1"].Text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
                worksheet.Range["H1"].CellStyle.Font.Bold = true;
                worksheet.Range["H2:K2"].Merge();
                worksheet.Range["H2"].Text = "Độc lập - Tự Do - Hạnh phúc";
                worksheet.Range["H2"].CellStyle.Font.Bold = true;
               
                worksheet.Range["E3:K3"].Merge();
                worksheet.Range["E3"].Text = "LỊCH THI RIÊNG HỌC KỲ 2 NĂM HỌC 2022-2023";
                worksheet.Range["E3"].CellStyle.Font.Bold = true;
                worksheet.Range["E3"].CellStyle.Font.Size = 20;
                worksheet.Range["A8:K8"].Merge();
                worksheet.Range["A8"].Text = "Thi cuối kỳ - GV tự tổ chức tuần 01/05/2023 - 07/05/2023 theo đúng TKB của lớp, có thề thi ở tuần dự trữ (24/04/2023)";
                worksheet.Range["A8"].CellStyle.Font.Bold = true;
                worksheet.Range["A9:K9"].Merge();
                worksheet.Range["A9"].Text = "Thi chung cuối kỳ(các môn đông, Trường hỗ trợ sắp lịch, giáo viên và Khoa phân công coi thi): từ 08/05/2023 - 14/05/2023";
                worksheet.Range["A9"].CellStyle.Font.Bold = true;
                worksheet.Range["A10:K10"].Merge();
                worksheet.Range["A10"].Text = "GV không tổ chức thi riêng trong tuần thi chung";
                worksheet.Range["A10"].CellStyle.Font.Color = ExcelKnownColors.Blue;

               
                worksheet.Range["A12:M12"].Merge();
                worksheet.Range["A12"].Text = "Hạn cuối nhập điểm: chú ý: Ngày kết thúc nhập điểm học phần học kỳ 2, năm học 2022-2023 là 21/05/2023";
                worksheet.Range["A12"].CellStyle.Font.Color = ExcelKnownColors.Red;
                worksheet.Range["A13:M13"].Merge();
                worksheet.Range["A13"].Text = "Đối với các học phần dời lịch thi theo thông báo 1266/DHCT-KHTH ngày 12/04/20223 thì hạn nhập điểm là 26/05/2023";
                worksheet.Range["A13"].CellStyle.Font.Color = ExcelKnownColors.Red;
                worksheet.Range["A12:A13"].CellStyle.Color = Color.Yellow;
                worksheet.Range["A15"].Text = "Stt";
                worksheet.Range["B15"].Text = "Mã CB";
                worksheet.Range["C15"].Text = "Họ và tên CB";
                worksheet.Range["D15"].Text = "Mã HP";
                worksheet.Range["E15"].Text = "Mã nhóm";
                worksheet.Range["F15"].Text = "Số SV";
                worksheet.Range["G15"].Text = "Tên HP";
                worksheet.Range["H15"].Text = "Số CB coi thi";
                worksheet.Range["I15"].Text = "Ngày thi";
                worksheet.Range["J15"].Text = "Phòng";
                worksheet.Range["K15"].Text = "Thời gian";
                worksheet.Range["L15"].Text = "Hình thức";
                worksheet.Range["A15:L15"].CellStyle.Font.Bold = true;
                worksheet.Range["A15:L15"].CellStyle.Color = Color.Gray;
                worksheet.Range["A15:L15"].CellStyle.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
                worksheet.Range["A15:L15"].CellStyle.Borders[ExcelBordersIndex.EdgeTop].Color = ExcelKnownColors.Black;
                List<LichThi> listexcel = db.LichThis.ToList();
                int rowSart = 16;
                int i = 1;
                foreach (var item in listexcel)
                {
                    worksheet.Range[string.Format("A{0}", rowSart)].Value = i.ToString();
                    worksheet.Range[string.Format("B{0}", rowSart)].Value = item.NhomMonHoc.NguoiDung.MSND;
                    worksheet.Range[string.Format("C{0}", rowSart)].Value = item.NhomMonHoc.NguoiDung.TenND;
                    worksheet.Range[string.Format("D{0}", rowSart)].Value = item.NhomMonHoc.MonHoc.MaMon;
                    worksheet.Range[string.Format("E{0}", rowSart)].Value = item.NhomMonHoc.TenNhom.ToString();
                    worksheet.Range[string.Format("F{0}", rowSart)].Value = item.NhomMonHoc.SoLuong.ToString();
                    worksheet.Range[string.Format("G{0}", rowSart)].Value = item.NhomMonHoc.MonHoc.TenMon;
                    worksheet.Range[string.Format("H{0}", rowSart)].Value = item.SLGV.ToString();
                    worksheet.Range[string.Format("I{0}", rowSart)].Value = item.ThoiGian.ToString();
                    worksheet.Range[string.Format("J{0}", rowSart)].Value = item.PhongHoc.TenPhong;
                    worksheet.Range[string.Format("K{0}", rowSart)].Value = "150p";
                    worksheet.Range[string.Format("L{0}", rowSart)].Value = item.HinhThucThi.TenHT;
                    worksheet.Range["A" + rowSart + ":L" +  rowSart].CellStyle.Borders[ExcelBordersIndex.EdgeTop].LineStyle = ExcelLineStyle.Thin;
                    worksheet.Range["A" + rowSart + ":L" + rowSart].CellStyle.Borders[ExcelBordersIndex.EdgeBottom].LineStyle = ExcelLineStyle.Thin;
                    worksheet.Range["A" + rowSart + ":L" +  rowSart].CellStyle.Borders[ExcelBordersIndex.EdgeTop].Color = ExcelKnownColors.Black;
                    rowSart++;
                    i++;
                }
                
                //Save the workbook to disk in xlsx format
                workbook.SaveAs("Output.xlsx", HttpContext.ApplicationInstance.Response, ExcelDownloadType.Open);
            }


            


        }
        public JsonResult UploadFiles(FormCollection f)
        {
            string LyDo = f["LyDo"];
            string EmailGV = f["EmailGV"];
            int MaLich = Convert.ToInt32(f["MaLich"]);
            int MaGV = Convert.ToInt32(f["MaGV"]);
            NguoiDung user = Session["User"] as NguoiDung;

            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                   
                        HttpFileCollectionBase files = Request.Files;
                        for (int i = 0; i < files.Count; i++)
                        {
                            //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                            //string filename = Path.GetFileName(Request.Files[i].FileName);  

                            HttpPostedFileBase file = files[i];
                            string fname;

                            // Checking for Internet Explorer  
                            if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                            {
                                string[] testfiles = file.FileName.Split(new char[] { '\\' });
                                fname = testfiles[testfiles.Length - 1];
                            }
                            else
                            {
                            string date = DateTime.Now.ToString();
                            DoiLichThi lich = new DoiLichThi();

                                fname = file.FileName;
                                lich.LyDo = LyDo;
                                lich.NgayTao = date;
                                lich.MaND = user.MaND;
                                lich.MSND = user.MSND;
                                lich.XetDuyet = 0;
                                lich.MaLich = MaLich;
                                lich.HinhAnh = fname;
                                lich.MaGV = MaGV;
                                lich.EmailGV = EmailGV;
                                lich.HoTenSV = user.TenND;
                                db.DoiLichThis.Add(lich);
                                ThongBao tb = new ThongBao();
                                tb.MaDoiLich = lich.ID;
                                tb.DaXem = false;
                                tb.NgayTao = date;
                                tb.MaND = user.MaND;
                                db.ThongBaos.Add(tb);
                              
                            if (ModelState.IsValid)
                            {
                                var senderEmail = new MailAddress(user.Email, user.TenND);
                                var receiverEmail = new MailAddress(EmailGV, "Receiver");
                                var password = "epqsluzynvkxiyiv";
                                string subject = "THÔNG BÁO - XÉT DUYỆT YÊU CẦU DỜI LỊCH THI";
                                //string body = "Chào bạn, đây là mã xác nhận tài khoản của bạn: ";
                                string body = "Bạn có thông báo mới từ hệ thống quản lý lịch thi. Có một yêu cầu chờ bạn xét duyệt. Vui lòng đăng nhập vào hệ thống để xem chi tiết!!!";
                              

                                var smtp = new SmtpClient
                                {
                                    Host = "smtp.gmail.com",
                                    Port = 587,
                                    EnableSsl = true,
                                    DeliveryMethod = SmtpDeliveryMethod.Network,
                                    UseDefaultCredentials = false,
                                    Credentials = new NetworkCredential(senderEmail.Address, password)
                                };
                                using (var mess = new MailMessage(senderEmail, receiverEmail)
                                {
                                    IsBodyHtml = true,
                                    Subject = subject,
                                    Body = body
                                })
                                {
                                    smtp.Send(mess);
                                }
                                db.SaveChanges();

                            }
                        }

                            // Get the complete folder path and store the file inside it.  
                            fname = Path.Combine(Server.MapPath("~/Content/images/"), fname);
                            file.SaveAs(fname);
                        }
                        // Returns message that successfully uploaded  
                        return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
                    
                    //  Get all files from Request object  

                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
            }
            
        }
        public ActionResult NotifyPartial()
        {
            NguoiDung user = Session["User"] as NguoiDung;
            if(user != null)
            {
                List<ThongBao> list = db.ThongBaos.Where(n => n.MaND == user.MaND).ToList();
                ViewBag.listDaXem = db.ThongBaos.Where(n => n.MaND == user.MaND && n.DaXem == false).ToList().Count;
                return PartialView(list);
            }
            else
            {
                ViewBag.listDaXem = 0;
                return PartialView(null);
            }
        }
        public JsonResult DaXemTB()
        {
            db.Configuration.ProxyCreationEnabled = false;
            NguoiDung user = Session["User"] as NguoiDung;
            List<ThongBao> tb = db.ThongBaos.Where(n => n.MaND == user.MaND && n.DaXem == false).ToList();
            if (tb != null)
            {
                foreach (var item in tb)
                {
                    item.DaXem = true;
                }
                db.SaveChanges();
            }
            return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult XetDuyet()
        {
            NguoiDung user = Session["User"] as NguoiDung;
            List<DoiLichThi> list = db.DoiLichThis.Where(n => n.MaGV == user.MaND && n.XetDuyet == 0).ToList();

            return View(list);
        }
        public JsonResult DuyetDoiLich(int MaDoiLich)
        {
            db.Configuration.ProxyCreationEnabled = false;
            string date = DateTime.Now.ToString();
            NguoiDung user = Session["User"] as NguoiDung;
            DoiLichThi doi = db.DoiLichThis.SingleOrDefault(n=>n.ID == MaDoiLich);
            if(doi != null)
            {
                doi.XetDuyet = 1;
                ThongBao tb = new ThongBao();
                tb.MaDoiLich = MaDoiLich;
                tb.DaXem = false;
                tb.NgayTao = date;
                tb.MaND = user.MaND;
                db.ThongBaos.Add(tb);
                ThongBao tb1 = new ThongBao();
                tb1.MaDoiLich = MaDoiLich;
                tb1.DaXem = false;
                tb1.NgayTao = date;
                tb1.MaND = doi.MaND;
                db.ThongBaos.Add(tb1);
                db.SaveChanges();
                return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult TuChoiDoiLich(int MaDoiLich)
        {
            db.Configuration.ProxyCreationEnabled = false;
            string date = DateTime.Now.ToString();
            NguoiDung user = Session["User"] as NguoiDung;
            DoiLichThi doi = db.DoiLichThis.SingleOrDefault(n => n.ID == MaDoiLich);
            if (doi != null)
            {
                doi.XetDuyet = 2;
                ThongBao tb = new ThongBao();
                tb.MaDoiLich = MaDoiLich;
                tb.DaXem = false;
                tb.NgayTao = date;
                tb.MaND = user.MaND;
                db.ThongBaos.Add(tb);
                db.SaveChanges();
                return Json(new { mess = "success" }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { mess = "fail" }, JsonRequestBehavior.AllowGet);
        }
    }
}