using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace Gallery.Model
{
    public class ImageHandler: System.Web.UI.Page
    {
        //Hanterar extentions
        private static Regex ApprovedExtentions;

        //Hanterar sökväg till bilder
        private static string PhysicalUploadImagePath;

        //hanterar sanerat sökväg
        private static Regex SantizePath;

        //Konstruktor
        static ImageHandler()
        {
            ApprovedExtentions = new Regex("(.png|.jpg|.gif)", RegexOptions.IgnoreCase);
            PhysicalUploadImagePath = Path.Combine(AppDomain.CurrentDomain.GetData("APPBASE").ToString(), "Content/files");
            
            var invalidChars = new string(Path.GetInvalidFileNameChars());
            SantizePath = new Regex(string.Format("[{0}]", Regex.Escape(invalidChars)));
            
        }

        //Metod som returnerar filnamn på bilder i lista.
        public IEnumerable<FileData> GetImageNames()
        {
            var regex = new Regex("(.png|.jpg|.gif)", RegexOptions.IgnoreCase);
            var di = new DirectoryInfo(PhysicalUploadImagePath);
            return (from fi in di.GetFiles()
                   select new FileData 
                   {
                       Name = fi.Name,
                       Class = regex.IsMatch(fi.Extension) ? 
                       fi.Extension.Substring(1) :
                       String.Empty
                   }).OrderBy(fi => fi.Name).ToList();
        }

        //Metod som returnerar cahad data. används inte.
        public IEnumerable<FileData> GetCachedImageNames()
        {
            var files = HttpContext.Current.Cache["files"] as IEnumerable<FileData>;
            if(files == null)
            {
                files = GetImageNames();
                HttpContext.Current.Cache.Insert("files", files, null, 
                    DateTime.Now.AddMinutes(1), TimeSpan.Zero);
            }

            return files;
        }

        //Metod som kontrollerar om fil existerar i filmapp
        public bool ImageExists(string name)
        {
            return File.Exists(Path.Combine(PhysicalUploadImagePath, name));
        }

        //Metod som kontrollerar så att bild är i godkänt format.
        public bool IsValidImage(System.Drawing.Image img)
        {
            if (img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Gif.Guid || img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Png.Guid || img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Jpeg.Guid)
            {
                return true;
            }

            return false;
        }

        //Metod som sparar bild.
        public string SaveImage(Stream stream, string fileName)
        {
            var img = System.Drawing.Image.FromStream(stream);

            fileName = SantizePath.Replace(fileName, "");

            if (!IsValidImage(img))
            {
                throw new ArgumentException("Image is not valid");
            }

            //Byten namn på filen existerande namn redan finns.
            if(ImageExists(fileName))
            {
                //Dela upp filnamnet i tre delar
                string nameWithoutExtension = Path.GetFileNameWithoutExtension(fileName);
                int counter = 0;
                string extension = Path.GetExtension(fileName);

                //Lägg till ett nummer som ändelse på filnamnet som skiljer ut filnandet.
                while (ImageExists(fileName))
                {
                    counter++;
                    fileName = String.Format("{0}(Kopia {1}){2}", nameWithoutExtension, counter, extension);
                }
            }

            //Fixa och spara tumnagelbild, i samma proportioner som originalbilden.

            double imgRel = (double)img.Height / (double)img.Width;

            double thumbHeightD = 45;
            double thumbWidthD = thumbHeightD / imgRel;

            var thumbnail = img.GetThumbnailImage((int)thumbWidthD, (int)thumbHeightD, null, System.IntPtr.Zero);
            
            //Sparar tummnagelbild
            thumbnail.Save(PhysicalUploadImagePath + "/thumbs/" + fileName); // path -> fullständig fysisk filnamn inklusive sökväg

            //Sparar bild
            img.Save(Path.Combine(PhysicalUploadImagePath, fileName));
            return fileName;
        }
    }
}