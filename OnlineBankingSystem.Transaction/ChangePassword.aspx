<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineBankingSystem.Transaction.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>

    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <h5>Şifre Yenileme</h5>
            </td>
        </tr>

        <tr>
            <td style="width: 160px">
                <asp:Label ID="Label3" runat="server" Text="Yeni Şifre"></asp:Label>
                <asp:HiddenField ID="hdnAnswer" runat="server" />
            </td>
            <td style="width: 160px">
                <asp:TextBox ID="txtNewPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtNewPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="En az 6 karakter olmalıdır"
                        ControlToValidate="txtNewPassword" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>

        <tr>
            <td style="width:160px">
                <asp:Label ID="Label5" runat="server" Text="Şifre Onay"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="En az 6 karakter olmalıdır"
                        ControlToValidate="txtConfirmPassword" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,15}$"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Şifreniz eşleşmedi" SetFocusOnError="true" Display="Dynamic"
                        ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" ForeColor="Red"></asp:CompareValidator>
                </div>
            </td>
        </tr>

         <tr>
                <td align="center">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Şifre Değitir" Height="28px" CssClass="btn-success" OnClick="btnChangePassword_Click"/>
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
