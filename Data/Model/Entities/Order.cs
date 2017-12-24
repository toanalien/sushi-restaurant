//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data.Model.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            this.OrderDishes = new HashSet<OrderDish>();
        }
    
        public int Id { get; set; }
        public System.DateTime CreateAt { get; set; }
        public long SubTotal { get; set; }
        public Nullable<long> PromotionDiscount { get; set; }
        public Nullable<long> ClassDiscount { get; set; }
        public Nullable<long> Total { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<int> CustomerID { get; set; }
        public string UserId { get; set; }
        public string Note { get; set; }
        public int TableID { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Table Table { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDish> OrderDishes { get; set; }
    }
}
