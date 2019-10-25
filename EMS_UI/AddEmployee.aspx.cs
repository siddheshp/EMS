using EMS_DAL;
using EMS_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_UI
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListDept.DataSource = DAL.GetDepartments();
                DropDownListDept.DataBind();

                DropDownListManager.DataSource = DAL.GetEmployeeIdAndName();
                DropDownListManager.DataBind();

                RangeValidator2.MaximumValue = DateTime.Now.ToShortDateString();
                RangeValidator2.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
            }
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            Employee employee = new Employee
            {
                Name = TextBoxName.Text,
                Email = TextBoxEmail.Text,
                Gender = RadioButtonListGender.SelectedItem.Text,
                DepartmentNo = Convert.ToInt32(DropDownListDept.SelectedItem.Value),
                DateOfBirth = Convert.ToDateTime(TextBoxDateOfBirth.Text),
                DateOfJoining = Convert.ToDateTime(TextBoxDateOfJoining.Text),
                ReportingTo = Convert.ToInt32(DropDownListManager.SelectedItem.Value),
                Phone = Convert.ToInt64(TextBoxPhone.Text),
                Salary = Convert.ToInt32(TextBoxSalary.Text),
                Commission = Convert.ToInt32(TextBoxCommission.Text),
                JobTitle = DropDownListJobTitle.SelectedItem.Text
            };


            bool result = DAL.AddEmployee(employee);

            if (result)
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), 
                //    "showalert", "alert('Employee added successfully');", true);

                //Response.Redirect("Default.aspx");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
               "alert('Employee added successfully'); window.location='EmployeeList.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(),
                    "showalert", "alert('Failed to add Employee');", true);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}