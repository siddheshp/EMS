<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EMS_UI.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
         <h4 style="font-size: medium">Log In</h4>
         <hr />
         <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LoginForm" >
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="UserName" />
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                       ControlToValidate="UserName"
                       runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="Password" TextMode="Password"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                       ControlToValidate="Password"
                       runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <div>
                  <asp:Button ID="ButtonLogin" runat="server" Text="Log in"
                      OnClick="ButtonLogin_Click"/>
               </div>
                <div>
                  <asp:Button ID="ButtonRegister" runat="server" Text="Register"
                      OnClick="ButtonRegister_Click" CausesValidation="false"/>
               </div>
            </div>
         </asp:PlaceHolder>
      </div>
</asp:Content>
