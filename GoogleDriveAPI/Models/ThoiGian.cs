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
    
    public partial class ThoiGian
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThoiGian()
        {
            this.LichThis = new HashSet<LichThi>();
        }
    
        public int MaTG { get; set; }
        public Nullable<System.DateTime> ThoiGian1 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichThi> LichThis { get; set; }
    }
}
