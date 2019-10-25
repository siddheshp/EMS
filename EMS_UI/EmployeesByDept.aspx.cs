using EMS_DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class EmployeesByDept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListDepts.DataSource = DAL.GetDepartments();
                DropDownListDepts.DataBind();
            }            
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            var deptId = Convert.ToInt32(DropDownListDepts.SelectedValue);

            DataSet result = DAL.GetEmployeesByDept(deptId);

            GridViewEmployees.DataSource = result;
            GridViewEmployees.DataBind();
        }
    }
}