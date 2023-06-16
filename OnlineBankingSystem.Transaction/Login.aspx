<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineBankingSystem.Transaction.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script> 

    <table align="center">
        <tr>
            <td colspan="4" align="center">
                <h5 style="color:darkblue;font-weight:bold;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Müşteri Girişi</h5>
               
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Height="28px" Width="255px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtUsername" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td style="padding-right: 40px"></td>       
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Height="28px" Width="255px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>         
        </tr>
        <tr>
             <td colspan="4" style="padding-left:84px;">
                 <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" Height="28px" OnClick="btnLogin_Click" CssClass ="btn-primary" />

                 <asp:LinkButton ID="LinkButton1" runat="server" Height="28px" CausesValidation="false" OnClick="lbForgotPassword_Click">Şifremi Unuttum</asp:LinkButton>

                  <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" Height="28px" CssClass="btn-success" OnClick="btnRegister_Click" CausesValidation="false" />
             </td>
        </tr>
        <tr>
            <td colspan="3">
                <div id="error" runat="server" style="color:red">

                </div>
            </td>                   
        </tr>

    </table>
</asp:Content>
