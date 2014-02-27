using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace Gallery.Model
{
    public class Service
    {
        private static readonly string WorkingDirectory;

        static Service()
        {
            WorkingDirectory = Path.Combine(
                AppDomain.CurrentDomain.GetData("APPBASE").ToString(),
                @"Content\files"
                );
        }

        public IEnumerable<FileData> GetFileData()
        {
            var regex = new Regex("(.png|.jpg|.gif)", RegexOptions.IgnoreCase);
            var di = new DirectoryInfo(WorkingDirectory);
            return (from fi in di.GetFiles()
                   select new FileData 
                   {
                       Name = fi.Name,
                       Class = regex.IsMatch(fi.Extension) ? 
                       fi.Extension.Substring(1) :
                       String.Empty
                   }).AsEnumerable();
        }

        public IEnumerable<FileData> GetCachedFileData()
        {
            throw new NotFiniteNumberException();
        }
    }
}