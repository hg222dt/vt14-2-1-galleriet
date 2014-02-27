<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="mockup.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Registrera elev på kurs
        </h1>

        <asp:Label ID="Label1" runat="server" Text="Förnamn"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Efternamn"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="E-post"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Välj kurs"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Rolig Databas-kurs</asp:ListItem>
            <asp:ListItem>Rolig Asp.net-kurs</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:button runat="server" text="Lägg till fler kurser" />
        <br />
        <br />
        <asp:button runat="server" text="Lägg till fler elever" />
        <br />
        <br />
        <asp:button runat="server" text="Klar med registrering" />
    </div>
    </form>
</body>
</html>
