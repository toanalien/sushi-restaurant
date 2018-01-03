using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Utils
{
    public static class Const
    {
        public const string UPLOAD_LOCATION = "/Content/uploads/";
        public const int STATUS_BOOK = 0;
        public const int STATUS_PROGRESS = 1;
        public const int STATUS_DONE = 2;

        public const int ORDER_INPROGRESS = 0;
        public const int ORDER_DONE = 1;
        public const int ORDER_CANCEL = 2;
        public static List<SelectListItem> SexSelect = new List<SelectListItem>()
            {
                new SelectListItem() {Text="Không xác định", Value="0"},
                new SelectListItem() {Text="Nam", Value="1"},
                new SelectListItem() {Text="Nữ", Value="2"}
            };
    }
}