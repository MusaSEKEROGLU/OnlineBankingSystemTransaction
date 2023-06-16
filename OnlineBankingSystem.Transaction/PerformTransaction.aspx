<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderMenu.master" AutoEventWireup="true" CodeBehind="PerformTransaction.aspx.cs" Inherits="OnlineBankingSystem.Transaction.PerformTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">


    <table align="center">
        <tr>
            <td align="center" colspan="2">
                <h5 style="color: navy; font-weight: bold; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif; margin-top: 20px">Transfer İşlemleri</h5>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Alıcı Hesap No"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlPayeeAccountNumber" runat="server" Height="28px" Width="200px" AppendDataBoundItems="true">
                    <asp:ListItem Value="0">Lütfen alıcı hesap seçiniz</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="ddlPayeeAccountNumber" SetFocusOnError="true" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Alıcı Adı"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPayeeName" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtPayeeName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alıcı adı en az 6 karakter olmalıdır(alphanumeric)"
                        ControlToValidate="txtPayeeName" SetFocusOnError="true" Display="Dynamic" ForeColor="Red"
                        ValidationExpression="^[a-zA-Z0-9\s]{6,15}$"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Telefon Numarası"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtMobileNumber" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtMobileNumber" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                <div>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Telefon numarası 10 karakter olmalıdır.(alphanumeric)" Display="Dynamic" ControlToValidate="txtMobileNumber" ForeColor="Red" SetFocusOnError="true" ValidationExpression="[0-9]{10}-*"></asp:RegularExpressionValidator>
                </div>
            </td>
        </tr>
      

        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Tutar"></asp:Label></td>
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
            <td>
                <asp:Label ID="Label10" runat="server" Text="Açıklama"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtRemarks" runat="server" Height="28px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txtRemarks" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="center">
                <asp:Button ID="btnSend" runat="server" Text="Gönder" Height="28px" CssClass="btn-success" OnClick="btnSend_Click"/>
            </td>
            <td>
                <asp:Button ID="btnGiveUp" runat="server" Text="Vazgeç" Height="28px" CssClass="btn-danger" OnClick="btnGiveUp_Click" CausesValidation="false" />
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
