//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GoogleDriveAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ThongBao
    {
        public int ID { get; set; }
        public string NgayTao { get; set; }
        public Nullable<int> MaND { get; set; }
        public Nullable<int> MaDoiLich { get; set; }
        public Nullable<bool> DaXem { get; set; }
    
        public virtual DoiLichThi DoiLichThi { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
    }
}