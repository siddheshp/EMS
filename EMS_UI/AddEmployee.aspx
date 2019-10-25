<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="EMS_UI.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add New Employee</h2>

    <table>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="TextBoxName" runat="server" MaxLength="255"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="RequiredFieldValidator">Name is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="RequiredFieldValidator">Email is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonListGender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>TransGender</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonListGender" ErrorMessage="RequiredFieldValidator">Plz select Gender</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DropDownListDept" runat="server" DataTextField="Name" DataValueField="DepartmentId">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListDept" ErrorMessage="RequiredFieldValidator">Plz select a department</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Date Of Birth</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfBirth" TextMode="Date" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxDateOfBirth" ErrorMessage="RequiredFieldValidator">Date of birth is required</asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="TextBoxDateOfBirth" ErrorMessage="RangeValidator" 
                    Type="Date">Date of birth should be in the past</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Date Of Joining</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfJoining" TextMode="Date" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxDateOfJoining" ErrorMessage="RequiredFieldValidator">Date of joining is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Manager</td>
            <td>
                <asp:DropDownList ID="DropDownListManager" runat="server" DataTextField="Name" DataValueField="Number">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <asp:TextBox ID="TextBoxPhone" runat="server" TextMode="Number" MaxLength="10"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="RequiredFieldValidator">Phone is required</asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="RangeValidator" MaximumValue="9999999999" MinimumValue="1000000000" Type="Double">Phone number should be 10 digits</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Salary</td>
            <td>
                <asp:TextBox ID="TextBoxSalary" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxSalary" ErrorMessage="RequiredFieldValidator">Salary is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Comission</td>
            <td>
                <asp:TextBox ID="TextBoxCommission" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxCommission" ErrorMessage="RequiredFieldValidator">Commission is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Job Title</td>
            <td>
                <asp:DropDownList ID="DropDownListJobTitle" runat="server">
                    <asp:ListItem>Developer</asp:ListItem>
                    <asp:ListItem>Analyst</asp:ListItem>
                    <asp:ListItem>Salesman</asp:ListItem>
                    <asp:ListItem>Manager</asp:ListItem>
                    <asp:ListItem>Tester</asp:ListItem>
                    <asp:ListItem>Accountant</asp:ListItem>
                    <asp:ListItem>Cashier</asp:ListItem>
                    <asp:ListItem>President</asp:ListItem>
                    <asp:ListItem>Senior Developer</asp:ListItem>
                    <asp:ListItem>CEO</asp:ListItem>
                    <asp:ListItem>COO</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownListJobTitle" ErrorMessage="RequiredFieldValidator">Job title is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonCreate" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="ButtonCreate_Click" />
            </td>
            <td>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CssClass="btn btn-warning" CausesValidation="False" OnClick="ButtonCancel_Click" />
            </td>
        </tr>

    </table>
</asp:Content>
