using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ITJob
{
    public class Utils
    {
        public static bool IsValidExtension(string fileName)
        {
            bool isVaid = false;
            string[] fileExtension = { ".jpg", ".png", ".jpeg" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isVaid = true;
                    break;
                }
            }
            return isVaid;
        }


        public static bool IsValidExtension4Resume(string fileName)
        {
            bool isVaid = false;
            string[] fileExtension = { ".doc", ".docx", ".pdf" };
            for (int i = 0; i <= fileExtension.Length - 1; i++)
            {
                if (fileName.Contains(fileExtension[i]))
                {
                    isVaid = true;
                    break;
                }
            }
            return isVaid;
        }
    }
}