﻿//------------------------------------------------------------------------------
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
    using System.ComponentModel.DataAnnotations;

    public partial class SubCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SubCategory()
        {
            this.Dishes = new HashSet<Dish>();
        }
    
        public int ID { get; set; }
        [StringLength(60, ErrorMessage = "Số kí tự tối đa là 60")]
        [Required(ErrorMessage = "Chưa nhập tên")]
        public string Name { get; set; }
        [StringLength(60, ErrorMessage = "Số kí tự tối đa là 60")]
        [Required(ErrorMessage = "Chưa nhập chú thích")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Chưa chọn nhóm món ăn")]
        public int CategoryID { get; set; }
    
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dish> Dishes { get; set; }
    }
}
