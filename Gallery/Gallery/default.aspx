<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Gallery._default" Trace="true" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Galleri</title>
    <link rel="stylesheet" href="Content/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">

        <%--Felmeddelande --%>
        <div id="message">
            <asp:Panel ID="UploadMessDiv" runat="server" Visible="false">
                <asp:Label ID="UploadMess" runat="server"></asp:Label>
            </asp:Panel>
        </div>
        
        <%-- Stor bild - Beror på vilken Thumbnail som klickas --%>
        <asp:Image ID="LargeImage" runat="server" Visible="false" />
    

        <%-- Thumbnails --%>
        <div class="thumbsDiv">
            <asp:Repeater ID="FileRepeater" runat="server" 
                    ItemType="Gallery.Model.FileData" 
                    SelectMethod="FileRepeater_GetData" 
                    OnItemDataBound="FileRepeater_ItemDataBound" >
                <HeaderTemplate>
                    
                </HeaderTemplate>
                <ItemTemplate>
                        <asp:HyperLink ID="FileHyperLink" runat="server" 
                                       NavigateUrl='<%# "/?img=" + Item.Name %>'
                                       CssClass='<%# Item.Class %>' OnClick="ChangeLargeImg_Click" >
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Content/files/thumbs/" + Item.Name %>' />
                        </asp:HyperLink>
                </ItemTemplate>
                <FooterTemplate>
                    
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <%-- Uppladdning av bilder --%>

        <asp:FileUpload ID="FileUpload1" runat="server"  />
        
        <asp:Button ID="UploadFile" runat="server" Text="Ladda upp" OnClick="UploadFile_Click" />
    </form>
</body>
</html>