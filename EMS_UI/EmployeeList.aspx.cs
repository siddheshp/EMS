using EMS_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class EmployeeList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewEmpList.DataSource = DAL.GetEmployeeList();
                GridViewEmpList.DataBind();
            }
        }

        protected void GridViewEmpList_RowDeleting(object sender,
            GridViewDeleteEventArgs e)
        {
            var empId = Convert.ToInt32(e.Keys["Number"]);

            bool result = DAL.DeleteEmployee(empId);

            if (result)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "displayAlert",
               "alert('Employee deleted successfully');", true);

                GridViewEmpList.DataSource = DAL.GetEmployeeList();
                GridViewEmpList.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "showalert", "alert('Failed to delete employee');", true);
            }
        }
    }
}