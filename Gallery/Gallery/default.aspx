<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Gallery._default" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Galleri</title>
    <link rel="stylesheet" href="Content/css/styles2.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="allElements">
            <h1>Galleri</h1>
            <%--Felmeddelande --%>
            <asp:Panel ID="UploadMessDiv" runat="server" Visible="false">
                <asp:Label ID="UploadMess" runat="server"></asp:Label>
            </asp:Panel>

            <div id="LargeImgDiv">
            <%-- Stor bild - Beror på vilken Thumbnail som klickas --%>
                <asp:Image ID="LargeImage" runat="server" Visible="true" />
            </div>

            <%-- Thumbnails --%>
            <div id="thumbsDiv">
                <asp:Repeater ID="FileRepeater" runat="server"
                    ItemType="Gallery.Model.FileData"
                    SelectMethod="FileRepeater_GetData"
                    OnItemDataBound="FileRepeater_ItemDataBound" >
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="FileHyperLink" runat="server"
                            NavigateUrl='<%# "/?img=" + Item.Name %>'
                            OnClick="ChangeLargeImg_Click"
                            CssClass="Thumbnail" >
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Content/files/thumbs/" + Item.Name %>' />
                        </asp:HyperLink>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <%-- Uppladdning av bilder --%>

            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="UploadFile" runat="server" Text="Ladda upp" OnClick="UploadFile_Click" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Du måste välja en fil att ladda upp." ControlToValidate="FileUpload1" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Endast jpg, png och gif-bilder får laddas upp." ControlToValidate="FileUpload1" 
                ValidationExpression=".*.(gif|GIF|jpg|JPG|jpeg|JPEG|png|PNG)" />
        </div>
    </form>

    <%-- Kod som styr in- och utgång på meddelandet --%>
    <script>
        
    </script>

</body>
</html>
