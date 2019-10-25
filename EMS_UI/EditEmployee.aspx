<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="EMS_UI.EditEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit Employee</h2>
    <p>Enter Employee ID
        <asp:TextBox ID="TextBoxEmpID" runat="server" TextMode="Number"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonGetEmpById" runat="server" OnClick="ButtonGetEmpById_Click" Text="Search" ValidationGroup="SearchGroup" />
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxEmpID" ErrorMessage="RequiredFieldValidator" ValidationGroup="SearchGroup">Employee Id is required</asp:RequiredFieldValidator>
    </p>
    <p>&nbsp;</p>

    <table>
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="TextBoxName" runat="server" MaxLength="255"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Name is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Email is required</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonListGender" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Plz select Gender</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DropDownListDept" runat="server" DataTextField="Name" DataValueField="DepartmentId">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownListDept" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Plz select a department</asp:RequiredFieldValidator>
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
                    Type="Date" ValidationGroup="UpdateGroup">Date of birth should be in the past</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Date Of Joining</td>
            <td>
                <asp:TextBox ID="TextBoxDateOfJoining" TextMode="Date" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxDateOfJoining" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Date of joining is required</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Phone is required</asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBoxPhone" ErrorMessage="RangeValidator" MaximumValue="9999999999" MinimumValue="1000000000" Type="Double" ValidationGroup="UpdateGroup">Phone number should be 10 digits</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>Salary</td>
            <td>
                <asp:TextBox ID="TextBoxSalary" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxSalary" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Salary is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Comission</td>
            <td>
                <asp:TextBox ID="TextBoxCommission" runat="server" TextMode="Number"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxCommission" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Commission is required</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownListJobTitle" ErrorMessage="RequiredFieldValidator" ValidationGroup="UpdateGroup">Job title is required</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="ButtonCreate_Click" ValidationGroup="UpdateGroup" />
            </td>
            <td>
                <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" CssClass="btn btn-warning" CausesValidation="False" OnClick="ButtonCancel_Click" />
            </td>
        </tr>

    </table>
</asp:Content>
