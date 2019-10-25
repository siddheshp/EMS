using EMS_DAL.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMS_DAL
{
    public static class DAL
    {
        static string connString =
            ConfigurationManager.ConnectionStrings["SqlConnString"].ToString();

        public static bool AddEmployee(Employee employee)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"INSERT INTO Employees(Name,Salary,Commission,DateOfJoining," +
                        $"DateOfBirth,DepartmentNo,JobTitle,ReportingTo,Email,Phone,Gender) " +
                        $"VALUES('{ employee.Name}',{ employee.Salary},{ employee.Commission}, " +
                        $"'{employee.DateOfJoining.ToString("yyyy-MM-dd")}','{employee.DateOfBirth.ToString("yyyy-MM-dd")}'," +
                        $"{ employee.DepartmentNo},'{ employee.JobTitle}'," +
                        $" { employee.ReportingTo}, '{ employee.Email}', { employee.Phone}," +
                        $" '{ employee.Gender}')";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result == 1) //success insert
                    {
                        return true;
                    }
                    else
                    {
                        return false; //insert failed
                    }
                }
            }
            catch (Exception ex)
            {
                //log
                return false;
            }
        }

        public static bool Login(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"select username from Users where" +
                        $" username='{username}' and password = '{password}'";
                    SqlCommand command = new SqlCommand(query, connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static bool RegisterUser(string username, string password)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"INSERT INTO Users(Username,Password) " +
                        $"VALUES('{ username}','{password}')";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result == 1) //success insert
                    {
                        return true;
                    }
                    else
                    {
                        return false; //insert failed
                    }
                }
            }
            catch (Exception ex)
            {
                //log
                return false;
            }
        }

        public static DataSet GetEmployeesByDept(int deptId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    string query = "select e.Number, e.Name, e.Salary, e.Commission," +
                        " e.DateOfBirth, e.DateOfJoining, d.Name as [Dept Name], " +
                        "e.JobTitle, ISNULL(m.Name, 'No Manager') as [Manager], " +
                        "e.Email, e.Phone, e.Gender from Employees e " +
                        "left join Employees m on e.ReportingTo = m.Number " +
                        "join Departments d on e.DepartmentNo = d.DepartmentID " +
                        $"where e.DepartmentNo = {deptId}";

                    SqlCommand command = new SqlCommand(query, connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static bool DeleteEmployee(int empId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"delete Employees where Number = {empId}";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result == 1) //success delete
                    {
                        return true;
                    }
                    else
                    {
                        return false; //delete failed
                    }
                }
            }
            catch (Exception ex)
            {
                //log
                return false;
            }
        }

        public static DataSet GetEmployeeById(int empId)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand($"select * from Employees where Number = {empId}",
                        connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static DataSet GetEmployeeList()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    string query = "select e.Number, e.Name, e.Salary, e.Commission," +
                        " e.DateOfBirth, e.DateOfJoining, d.Name as [Dept Name], " +
                        "e.JobTitle, ISNULL(m.Name, 'No Manager') as [Manager], " +
                        "e.Email, e.Phone, e.Gender from Employees e " +
                        "left join Employees m on e.ReportingTo = m.Number " +
                        "join Departments d on e.DepartmentNo = d.DepartmentID";
                    SqlCommand command =
                        new SqlCommand(query, connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static bool UpdateEmployee(Employee employee)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    var query = $"UPDATE Employees set Name = '{ employee.Name}', " +
                        $"Salary = { employee.Salary }, " +
                        $"Commission = { employee.Commission }, " +
                        $"DateOfJoining = '{employee.DateOfJoining.ToString("yyyy-MM-dd")}', " +
                        $"DateOfBirth = '{employee.DateOfBirth.ToString("yyyy-MM-dd")}', " +
                        $"DepartmentNo = { employee.DepartmentNo }, " +
                        $"JobTitle = '{ employee.JobTitle}', " +
                        $"ReportingTo = {employee.ReportingTo}, " +
                        $"Email = '{ employee.Email}', Phone = { employee.Phone }, " +
                        $"Gender = '{ employee.Gender}' where Number = { employee.Number }";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result == 1) //success insert
                    {
                        return true;
                    }
                    else
                    {
                        return false; //insert failed
                    }
                }
            }
            catch (Exception ex)
            {
                //log
                return false;
            }
        }

        public static DataSet GetDepartments()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand("select DepartmentId, Name from Departments",
                        connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static DataSet GetEmployeeIdAndName()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connString))
                {
                    SqlCommand command =
                        new SqlCommand("select Number, Name from Employees",
                        connection);
                    DataSet ds = new DataSet();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
