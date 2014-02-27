<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="mockup.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Föreläsning - Rolig databas-kurs - 2014-01-31 
        </h1>

        <asp:Image ID="Image1" runat="server" ImageUrl="~/Screenshot (5).png" Height="300px" Width="550px" />
        <br />

        <h1>
            Ställ fråga på tidslinjen
        </h1>

        <asp:Label ID="Label1" runat="server" Text="Precisera tid på tidslinjen (hh:mm:ss)"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Fråga"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Skicka fråga!" />
    </div>
    </form>
</body>
</html>
