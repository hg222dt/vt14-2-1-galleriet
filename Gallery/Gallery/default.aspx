<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Gallery._default" Trace="true" ViewStateMode="Disabled" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Panel ID="UploadMessDiv" runat="server" Visible="false">
            <asp:Label ID="UploadMess" runat="server"></asp:Label>

        </asp:Panel>
        
    <%-- Stor bild - Beror på vilken Thumbnail som klickas --%>
    <%-- Querystring beror på vilken thumbnail som klickas --%>

    <asp:Image ID="LargeImage" runat="server" Visible="false" />
    

    <%-- Thumbnails --%>
    <div>
        <asp:Repeater ID="FileRepeater" runat="server" 
                ItemType="Gallery.Model.FileData" 
                SelectMethod="FileRepeater_GetData" 
                OnItemDataBound="FileRepeater_ItemDataBound" >
            <HeaderTemplate>
                <ul>

            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <asp:HyperLink ID="FileHyperLink" runat="server" 
                                   NavigateUrl='<%# "/?img=" + Item.Name %>'
                                   CssClass='<%# Item.Class %>' OnClick="ChangeLargeImg_Click" >

                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Content/files/thumbs/" + Item.Name %>' />

                    </asp:HyperLink>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>

    <%-- Uppladdning av bilder --%>

        <asp:FileUpload ID="FileUpload1" runat="server"  />
        
        <asp:Button ID="UploadFile" runat="server" Text="Ladda upp" OnClick="UploadFile_Click" />
    </form>
</body>
</html>