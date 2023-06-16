<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineBankingSystem.Transaction.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>

    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h5>Şifremi Unuttum</h5>
            </td>
        </tr>

        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı"></asp:Label>
            </td>
            <td style="width: 160px">
                <asp:Label ID="lblUserName" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label2" runat="server" Text="Güvenlik Sorusu"></asp:Label>
            </td>
            <td style="width: 160px">
                <asp:Label ID="lblSecurityQuestion" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label3" runat="server" Text="Cevap"></asp:Label>

                <asp:HiddenField ID="hdnAnswer" runat="server" />
            </td>
            <td style="width: 160px">
                <asp:TextBox ID="txtAnswer" runat="server" Height="28px" Width="200px"></asp:TextBox>
              
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtAnswer" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>

             <tr>
                <td align="center">
                    <asp:Button ID="btnForgotPassword" runat="server" Text="Şifremi Unuttum" Height="28px" CssClass="btn-success" OnClick="btnForgotPassword_Click"/>
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Çıkış Yap" Height="28px" CssClass="btn-danger" OnClick="btnCancel_Click" CausesValidation="false" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <div id="error" runat="server" style="color: red">
                    </div>
                </td>
            </tr>


    </table>
</asp:Content>
