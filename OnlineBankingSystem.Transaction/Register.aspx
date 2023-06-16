<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineBankingSystem.Transaction.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>

    <div align="center" style="margin-top: 15px">
        <table align="center">
            <tr>
                <td colspan="2" align="center">
                    <h5 style="color: darkblue; font-weight: bold; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">Kayıt Ol</h5>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label1" runat="server" Text="Hesap Numarası"></asp:Label></td>
                <td>
                    <asp:Label ID="lblAccountNumber" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label2" runat="server" Text="Hesap Tipi"></asp:Label></td>
                <td>
                    <asp:Label ID="lblAccountType" runat="server" Text="Tasarruf Hesabı"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server" Height="28px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtUsername" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="En az 6 karakter olmalıdır(alphanumeric)"
                            ControlToValidate="txtUsername" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^[a-zA-Z0-9\s]{6,15}$"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label4" runat="server" Text="Şifre"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Height="28px" Width="200px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="En az 6 karakter olmalıdır"
                            ControlToValidate="txtPassword" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,15}$"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
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
                            ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ForeColor="Red"></asp:CompareValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label6" runat="server" Text="Cinsiyet"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlGender" Height="28px" Width="200px" runat="server">
                        <asp:ListItem>Erkek</asp:ListItem>
                        <asp:ListItem>Kadın</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label7" runat="server" Text="Email Adres"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Height="28px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Geçersiz e-posta formatı"
                            ControlToValidate="txtEmail" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label8" runat="server" Text="Adres"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Height="28px" Width="200px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtAddress" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label9" runat="server" Text="Güvenlik Sorusu"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlSecurityQuestion" Height="28px" Width="200px" runat="server" DataSourceID="SqlDataSource1" DataTextField="SecurityQuestionName" DataValueField="SecurityQuestionId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Dbo_OnlineBankingSystemConnectionString %>" SelectCommand="SELECT * FROM [SecurityQuestion]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label10" runat="server" Text="Cevap"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server" Height="28px" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtAnswer" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label11" runat="server" Text="Hesap Bakiyesi"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAmount" runat="server" Height="28px" Width="200px" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red"
                        ControlToValidate="txtAmount" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Geçerli bir miktar giriniz.Maximum 5 karakter olmalı"
                            ControlToValidate="txtAmount" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                            ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>

            <tr>
                <td align="center">
                    <asp:Button ID="btnRegister" runat="server" Text="Kaydet" Height="28px" CssClass="btn-success" OnClick="btnRegister_Click" />
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
    </div>
</asp:Content>

