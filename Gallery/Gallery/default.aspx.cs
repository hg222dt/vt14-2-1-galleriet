using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Gallery.Model;



namespace Gallery
{
    public partial class _default : System.Web.UI.Page
    {   

        private Model.ImageHandler _imageHandler;

        private Model.ImageHandler ImageHandler
        {
            get
            {
                return _imageHandler ?? (_imageHandler = new Model.ImageHandler());
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            var nameQuery = Request.QueryString["img"];
            
            if(nameQuery != null)
            {
                LargeImage.Visible = true;
                LargeImage.ImageUrl = "~/Content/files/" + nameQuery;
            }

            if(Request.QueryString["uploaded"] == "false")
            {
                //Skriv ut felmeddelande
                UploadMessDiv.Visible = true;
                UploadMess.Text = "Uppladdning misslyckades!";
                LargeImage.Visible = false;
            }
            else if (Request.QueryString["uploaded"] == "true")
            {
                //Skriv ut rättmeddelande
                LargeImage.Visible = true;
                UploadMessDiv.Visible = true;
                UploadMess.Text = "Uppladdning lyckades!";
            }
        }

        public IEnumerable<Model.FileData> Filerepeater_GetData()
        {
            return ImageHandler.GetImageNames();
        }

        protected void UploadFile_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string fileName = Path.Combine(Server.MapPath("~/Content/files"), FileUpload1.FileName);

                    ImageHandler.SaveImage(FileUpload1.FileContent, FileUpload1.FileName);

                    Response.Redirect("?img=" + FileUpload1.FileName + "&uploaded=true", false);

                }
                catch (Exception)
                {
                    Response.Redirect("?img=" + FileUpload1.FileName + "&uploaded=false", false);
                }
            }

        }

        protected void FileRepeater_ItemDataBound(object sendet, RepeaterItemEventArgs e)
        {
            var fileData = (FileData)e.Item.DataItem;


        }
    }
}