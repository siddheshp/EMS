<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeesByDept.aspx.cs" Inherits="EMS_UI.EmployeesByDept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Employees By Department</h2>

    <div>

        Select Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListDepts" runat="server"
            DataTextField="Name" DataValueField="DepartmentId">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonSearch" runat="server" Text="Search" 
            OnClick="ButtonSearch_Click"/>
        <br />
        <br />
        <asp:Label ID="LabelDeptName" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridViewEmployees" runat="server"
            EmptyDataText="No employees found">
        </asp:GridView>

    </div>
</asp:Content>
