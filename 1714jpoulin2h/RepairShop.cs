//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714jpoulin2h
{
    using System;
    using System.Collections.Generic;
    
    public partial class RepairShop
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RepairShop()
        {
            this.Quotes = new HashSet<Quote>();
            this.Employee = new HashSet<Person>();
            this.Reviews = new HashSet<Review>();
        }
    
        public int Id { get; set; }
        public string RepairShopName { get; set; }
        public string RepairShopAddress { get; set; }
        public string RepairShopCity { get; set; }
        public string RepairShopState { get; set; }
        public string RepairShopZip { get; set; }
        public string RepairShopPhone { get; set; }
        public string RepairShopEmail { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Quote> Quotes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Person> Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
