
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace Data.Repository
{

using System;
    using System.Collections.Generic;
    using Model.Entities;
    

public partial interface ITableRepository : Data.Repository.IBaseRepository<Table>
{
}

public partial class TableRepository : Data.Repository.BaseRepository<Table>, ITableRepository
{
	public TableRepository(Entities dbContext) : base(dbContext)
    {
    }
}

}
