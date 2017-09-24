namespace Data.Service
{

    using System;
    using System.Collections.Generic;
    using Data.Model.Entities;


    public partial interface IDishService : Data.Service.IBaseService<Dish>
    {
    }

    public partial class DishService : Data.Service.BaseService<Dish>, IDishService
    {
       
    }

}
